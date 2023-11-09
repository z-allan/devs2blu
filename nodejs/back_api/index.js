import 'dotenv/config';
import express from 'express';
import { DatabasePostgres } from './dbpg_query.js';
import { User }  from './user.js';

const app = express();
const port = process.env.PORT ?? 8080;
const db = new DatabasePostgres();
const user = new User();

app.use(express.json()); 
app.use(express.urlencoded({ extended: true }));

app.get('/teste', function (req,res) {
    console.log(req.headers.authorization)
});

app.post("/login", function (req, res) {
    const bodyUser = req.body.user;
    const bodyPass = req.body.pass;
    const infoUser = `${bodyUser}:${bodyPass}`;
    
    try {
        const isCorrect = (infoUser === process.env.TEST_CREDENTIAL);

        if (!isCorrect)
            return res.status(401).send({ resp:'Password or E-mail incorrect!' });
        var token = user.tokenSign(infoUser);

        return res.status(200).json(token);
    } catch (error) {
        return res.send(error);
    };
});

app.use(user.tokenVerify);
app.use(user.checkPermission);

app.get('/', async function (_,res){
    res.send(`<h1>Endpoints válidos</h1>
              <a href="/products">/products</a><br>
              <a href="/products/1">/products/id</a><br>
              <a href="/search?q=Não+é">/search?q=string</a><br>`);
});

app.get('/products', async function (_,res){
    res.send(await db.getAllProducts());
});

app.get('/products/:ID', async function (req,res){
    try {
        res.send(await db.getProduct(req.params.ID));
    } catch (error) {
        res.status(406).send(error);
    }
});

app.get('/search', async function (req,res){
    try {
        res.send(await db.searchProduct(req.query.q));
    } catch (error) {
        res.status(406).send(error);
    }
});

app.post('/products', async function (req,res) {
    const { nome, preco, fabricante, descricao } = req.body;
    
    try {
        await db.insertProduct({nome, preco, fabricante, descricao});
        res.status(201).send();
    } catch (error) {
        res.status(500).send(error);
    }
    
});

app.put('/products/:ID', async function (req,res) {
    const idProduto = req.params.ID;
    const { nome, preco, fabricante, descricao } = req.body;
    
    try {
        await db.updateProduct(idProduto, {nome, preco, fabricante, descricao});
        res.status(204).send();
    } catch (error) {
        res.status(500).send(error);
    }
});

app.delete('/products/:ID', async function (req,res) {
    try {
        const idProduto = req.params.ID;

         await db.deleteProduct(idProduto);
         res.status(204).send();
    } catch (error) {
        res.status(500).send(error);
    }
});

const host = '127.0.0.1';
app.listen(port, host, function () {
    console.log(`Serviço iniciado em http://${host}:${port}`);
});

