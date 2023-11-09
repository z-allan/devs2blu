require("dotenv").config();
const express = require("express");
const db = require("./db/query.js")

const app = express();
const port = process.env.API_PORT;

app.get('/', async function (req,res){
    res.send('<h1>Acesse a lista de animais</h1><a href="/animals">Animais do Petshop</a>');
});

app.get('/animals', async function (req,res){
    res.send(await db.getAllAnimals());
});

app.get('/animals/:id', async function (req,res){
    res.send(await db.getAnimal(req.params.id));
});

app.listen(port, function () {
 console.log("Serviço iniciado em http://localhost:" + port);
});

   