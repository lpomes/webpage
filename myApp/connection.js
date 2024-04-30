// var mysql = require('mysql');
// const { faker } = require('@faker-js/faker');

// var con = mysql.createConnection({
//     host: 'localhost',
//     user: 'root',
//     database: 'grocerystore'
// });

// con.connect((err) => {
//     if (err) throw err;
//     console.log("Database connected");
// });

// //Select from a table
// var q = "select * from category";
// con.query(q, function (err, results, fields) {
//     if (err) throw err;
//     console.log(results);
// });


// //Aggregate function count
// var q = "select count(*) as total from category";

// con.query(q, function (err, results, fields) {
//     if (err) throw err;
//     console.log("Total count:" + results[0].total);
// });


// //Ramdom selection into product table (do tmr)
// // const productInfo = [];
// // const N = 5;
// // const categoryType = ["Vegetable","Fruit","Meat","Diary","Seafood"];

// // for (let i = 0; i < N; i++) {
// // const std_name = faker.person.fullName();
// // const std_credit = faker.number.int({min:15, max:120});

// // const rand_index = Math.floor(Math.random() * categoryType.length);
// // const rand_category = std_dept[rand_index];
// // productInfo.push([std_name, rand_category, std_credit]);
// // }

// // const q = "insert into student (name,dept_name,tot_credit) values ?";

// // con.query(q,[productInfo],(err,results)=> {
// //     if(err) throw err;
// //     console.log(results.affectedRows + " student is inserted successfully");
// // });
