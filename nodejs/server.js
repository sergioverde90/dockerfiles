var express = require('express');
var app = express();
var fs = require('fs');
var mysql = require('mysql');

const PORT = 8080

// allow load static resources
app.use(express.static('dist'));
// disable http cache -> 
app.disable('etag');

mysql.createConnection({
  host: "db",
  user: "postgres",
  password: "postgres"
});

app.get('/', function(request, response){
    response.send("hello world!")
});

console.log(`server listen in port ${PORT}`)
app.listen(PORT);
