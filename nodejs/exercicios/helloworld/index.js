import { createServer } from 'http';

var count = 0;

createServer(function (req, res) {
    res.writeHead(200, { 'Content-Type': 'html' });
    res.write("<br><br>")
    res.write("<style>")
    res.write("h1 { font-family:'Helvetica'; text-align:center; background-color:yellow; padding:8px }");
    res.write("h2 { font-family:'Helvetica'; text-align:center; background-color:rgb(0,255,0); padding:8px }");
    res.write("h3 { font-family:'Helvetica'; text-align:center; background-color:rgb(0,100,255); color:white; padding:8px}");
    res.write("</style>")
    res.write("<h1>Hello World!</h1>");
    if (req.url == '/') {
        var data = printDate();
        res.write(`<h2>${data}</h2>`);
        ++count;
        res.write(`<h3>${count}</h3>`);
    }
    res.end();

}).listen(8080);

function printDate() {
    const d = new Date() 
    const dia = d.getDate() < 10 ? '0'+d.getDate() : d.getDate();
    const mes = d.getMonth() < 10 ? '0'+d.getMonth() : d.getMonth();
    const ano = d.getFullYear();
    const hr = d.getHours() < 10 ? '0'+d.getHours() : d.getHours();
    const min = d.getMinutes() < 10 ? '0'+d.getMinutes() : d.getMinutes();
    const seg = d.getSeconds() < 10 ? '0'+d.getSeconds() : d.getSeconds();
    var dataFormatada = `${dia}/${mes}/${ano} ${hr}:${min}:${seg}`;
    console.log(dataFormatada);
    return dataFormatada;
}

console.log('\nServidor rodando no http://localhost:8080\n');