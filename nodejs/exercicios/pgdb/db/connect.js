exports.petshopConnectDB = async function petshopConnectDB() {
    if (global.connection) {
        console.log('Conexão já existe, retornando...')
        return global.connection.connect();
    }
    const { Pool } = require("pg");
    const pool = new Pool({connectionString: process.env.CONN_STRING_PETSHOP});
    const client = await pool.connect();
    console.log('Conectando...');
    const res = await client.query(" SELECT NOW() ");
    console.log('Conexão iniciada: ' + res.rows[0].now);
    client.release();
    global.connection = pool;
    return pool.connect();
}

