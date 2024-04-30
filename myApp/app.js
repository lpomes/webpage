var express = require('express');
const session = require('express-session');
const path = require('path');
const morgan = require('morgan');
const mysql = require('mysql'); 

const portNumber = 8080;

var app = express();

app.set("view engine", "ejs");
var bodyparser = require("body-parser");
const { name } = require('ejs');

app.use(session({secret: 'secret', resave: true, saveUninitialized: true}));
app.use(bodyparser.urlencoded({ extended: true }));

app.use(morgan('dev'));

app.use(express.static("public"));

var con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'grocerystore'
});
con.connect((err) => {
    if (err) throw err;
    console.log("Database is connected");
});

//Registers customers into the database then takes them to the home page
app.post("/register", function(req, res) {
    var customer_info = { username: req.body.username, user_password: req.body.psw, name: req.body.name, address: req.body.address}; //std info
	var q = "insert into customer set ?";
	var customer_name = req.body.name;
	var q2 = "select * from customer where name = ?"

    con.query(q, customer_info, function(error, results) {
    	if (error) throw error;
		
		con.query(q2, customer_name, function(error, results) {
			if (error) throw error;
			res.render("home", {name: results[0].name});
		})
    });
});

//Displays all items in the database
app.get("/displayAll", function(req, res) {
    var q = "select * from product";
    con.query(q, function(error, results) {
        if (error) throw error;
        res.render("test", { data: results });
    });
});

//Displays all the items in the cart
app.get("/displayCart", function(req,res) {
	var q = "select productImage, productName, price, Qty, cartID, (price * Qty) as Total_Price from product join cart on product.productID = cart.productID;";
	var q2 = "select SUM(Qty * price) AS Overall_Total_Price from product join cart on product.productID = cart.productID;";
	con.query(q, function(error, results) {
		if(error) throw error;

		con.query(q2, function(error2, results2) {
			if(error2) throw error2;
			res.render("cart", {data1: results, data2: results2});
		});
	});

});

//Displays specific types of food
app.post("/searchDisplay", function(req,res) {
	categoryType = req.body.categories;
	var q = "select * from product where categoryID = ?";
	con.query(q, categoryType, function(error, results) {
		if(error) throw error;
		res.render("searchDisplayFilter", {data: results});
	}) ;
});

//Adds products to the cart
app.post("/addProductToCart", function(req,res) {
	var cartItem = req.body.productID;
	var q = "insert	into cart(customerID, productID) values(1, ?)";
	con.query(q, cartItem, function(error, results) {
		if(error) throw error;
		console.log("Added to cart!");
		res.redirect("/displayAll");
	}) ;
});

//Searches for specific food
app.post("/searchFood", function(req,res) {
	var searchedProduct = req.body.prodName;
	console.log("SearchedProduct: " + searchedProduct);
	var q = "select * from product where productName = ?";
	con.query(q, searchedProduct, function(error, results) {
		if(error) throw error;
		res.render("findFood", {data: results});
	});
});

//Uses main.html as the main directory to the website
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/public/main.html');
  });

//Authenitcates a user if they login with the right info then takes them to the home page
app.post('/auth', function(request, response) {
	let username = request.body.username;
	let password = request.body.password;
    let name = request.body.name;
	if (username && password) {
		con.query('SELECT * FROM customer WHERE username = ? AND user_password = ?', [username, password], function(error, results, fields) {
			if (error) throw error;
			if (results.length > 0) {
				request.session.loggedin = true;
				request.session.username = username;
                name = results[0].name;
                request.session.name = name;
				response.render('home', {name: results[0].name});
			} else {
				response.send('Incorrect Username and/or Password!');
			}			
			response.end();
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});

//Increases Qty amount
app.post("/qtyAdd", function(req, res) {
	var addQuant = req.body.qtyAdd;
	var q = "update cart set Qty = Qty+1 where cartID = ?";
	con.query(q, addQuant, function(error,results) {
		if(error) throw error;
		console.log("Quantity Updated!");
		res.redirect('/displayCart');
	});
});

//Decreases Qty amount
app.post("/qtySub", function(req, res) {
	var addQuant = req.body.qtySub;
	var q = "update cart set Qty = Qty-1 where cartID = ?";
	con.query(q, addQuant, function(error,results) {
		if(error) throw error;
		console.log("Quantity Updated!");
		res.redirect('/displayCart');
	});
});

//Removes products from the cart
app.post("/removeProduct", function(req, res) {
	var deleteFromCart = req.body.cartID;
	var q = "delete from cart where cartID = ?";
	con.query(q, deleteFromCart, function(error, results) {
		if(error) throw error;
		console.log("Item is successfully deleted!")
		res.redirect('/displayCart');
	});
});

//Deletes all items in the cart
app.post("/removeAllFromCart", function(req,res) {
	var q = "delete from cart";
	con.query(q, function(error, results) {
		if(error) throw error;
		console.log("Cart has been emptied");
		res.redirect('/displayCart');
	})
})

app.listen(portNumber, function () {
    console.log(`Server is listening at port number ${portNumber}`);
});

