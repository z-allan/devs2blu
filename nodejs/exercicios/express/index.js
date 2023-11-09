const express = require('express');
const app = new express();
const port = 8080;

app.get("/", function (req,res) {
    res.send({
        api: "ok",
        port: port
    });
});

app.get("/products", function (req,res) {
    res.send({
        products: []
    });
});

app.listen(port, function() {
    console.log(`\nServidor rodando em http://localhost:${port}\n`); 
});
