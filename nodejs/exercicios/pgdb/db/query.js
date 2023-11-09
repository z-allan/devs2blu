const db = require('./connect');

exports.getAllAnimals = async function getAllAnimals() {
    const client = await db.petshopConnectDB();
    const res = await client.query(`select t1.id, t1.nome, t2.nome as dono, t3.nome as raca, t1.data_nasc 
                                    from petshop.tb_animal t1 
                                    inner join petshop.tb_pessoa t2 on (t1.dono=t2.id) 
                                    inner join petshop.tb_raca t3 on (t1.raca=t3.id) 
                                    order by t1.id`);
    return res.rows;
}

exports.getAnimal = async function getAllAnimals(pId) {
    const client = await db.petshopConnectDB();
    const res = await client.query(`select t1.id, t1.nome, t2.nome as dono, t3.nome as raca, t1.data_nasc 
                                    from petshop.tb_animal t1 
                                    inner join petshop.tb_pessoa t2 on (t1.dono=t2.id) 
                                    inner join petshop.tb_raca t3 on (t1.raca=t3.id) 
                                    where t1.id = ${pId}`);
    return res.rows[0];
}

