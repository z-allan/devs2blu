import { sql } from './dbpg_con.js';

export class DatabasePostgres {

    async getAllProducts() {
        const query = 'select * from tb_produto order by id'
        const res = await sql(query, []);
        return res.rows;
    }

    async getProduct(pId) {
        if (isNaN(pId))
            throw {resp:'Valor informado não é númerico.', value: pId};
        
        const query = "select * from tb_produto where id=$1";
        const res = await sql(query, [pId]);
        
        if (res.rows.length == 0) 
            throw {resp:'Código não corresponde a um produto.', value:Number(pId)};  
        
        return res.rows[0];
    }

    async searchProduct(pSearch) {
        const query = "select * from tb_produto where nome ilike $1 or fabricante ilike $1 or descricao ilike $1";
        const res = await sql(query, ['%'+pSearch+'%']);
        if (res.rows.length == 0)  
            throw {resp:'Pesquisa não retornou nenhum registro.', value:pSearch};  
        return res.rows;
    }

    async insertProduct(pProd) {
        try {
            const query = "insert into tb_produto (nome,preco,fabricante,descricao) values ($1,$2,$3,$4)";
            await sql(query, [pProd.nome, pProd.preco, pProd.fabricante, pProd.descricao]);
        } catch (e) {
            if (!(e instanceof Error)) 
                e = new Error(e);
            throw {resp:'Erro ao realizar insert.', message:e.message, error:e};  
        }
    }

    async updateProduct(pId, pProd) {
        try {
            const query = "update tb_produto set nome=$1, preco=$2, fabricante=$3, descricao=$4 where id=$5";
            await sql(query, [pProd.nome, pProd.preco, pProd.fabricante, pProd.descricao, pId]);
        } catch (e) {
            if (!(e instanceof Error)) 
                e = new Error(e);
            throw {resp:'Erro ao realizar update.', message:e.message, error:e};  
        }
    }

    async deleteProduct(pId) {
        try {
            const query = "delete from tb_produto where id=$1";
            await sql(query, [pId]);
        } catch (e) {
            if (!(e instanceof Error))
                e = new Error(e);
            throw {resp:'Erro ao realizar delete.', message:e.message, error:e};  
        }
    }

}