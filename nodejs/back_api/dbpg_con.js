import Pool from 'pg-pool';
import { data } from './util.js';

const timeout = 60 * 1000;
const pool = new Pool({connectionString: process.env.CONN_STRING_NEON, idleTimeoutMillis:timeout});

var countConnect = 0;
var countAcquire = 0;

pool.on('connect', async function (client) {
    ++countConnect;
    const res = await client.query(" select cast(cast(now() at time zone 'UTC+3' as timestamp(0)) as varchar); ");
    console.log(`${data()} | Pool connect | ${client.host} | Connections=[${countConnect}] - Database=[${res.rows[0].timezone}] `);
});

pool.on('acquire', function(client) {
    ++countAcquire;
    console.log(`${data()} | Pool acquire | ${client.host} | Acquires=[${countAcquire}]`);
});

pool.on('error', function(error, client) {
    console.log(`${data()} | Pool error   | ${client.host} | Error=[${error}] `);
});

pool.on('remove', function(client) {
    --countConnect;
    console.log(`${data()} | Pool remove  | ${client.host} | Connections=[${countConnect}] `);
});

export async function sql(query, param) {
    try {
        return await pool.query(query, param);
    } catch (error) {
        throw error;
    }
}