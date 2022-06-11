console.log("Hello World....");
//print("hello world")
const express = require('express');
const PORT = 3000;

const app = express();

//creating an api
//CRUD request

app.listen(PORT,"0.0.0.0",() =>{
    console.log(`connected  at port  ${PORT}`);
});
//localhost

