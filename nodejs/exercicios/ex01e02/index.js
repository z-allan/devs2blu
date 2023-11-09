const StatusCodes = require('http-status-codes').StatusCodes;
const Express = require('express');
const app = new Express();
const PORT = 8080;

const listaProdutos = [
    {id:1, nome:'Fusca', fabricante:'VW'},
    {id:2, nome:'iPhone', fabricante:'Apple'},
    {id:3, nome:'Miband', fabricante:'Xiaomi'},
    {id:4, nome:'Cachaça de Abacaxi', fabricante:'Spezia'}
];

app.get("/", function (req,res) {
    res.send('<h1>Acesse a lista de produtos</h1><a href="/produto">Produtos</a>');
});

app.get("/produto", function (req,res) {
    res.send({
        tamanho:listaProdutos.length,
        produtos:listaProdutos
    });
});

app.get("/produto/:id", function (req,res) {
    const produto = listaProdutos.find((prod) => {
        return prod.id === Number(req.params.id);
    });
    
    if (produto instanceof Object)
        return res.status(StatusCodes.OK).send(produto);
        
    return res.status(StatusCodes.NO_CONTENT);
});

app.listen(PORT, function() {
    console.log(`\nAPI rodando em http://localhost:${PORT}\n`); 
});
