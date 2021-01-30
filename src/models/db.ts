import mysql from 'mysql2';

const pool = mysql.createPool({
    host     : 'localhost',
    user     : 'root',
    password : 'root',
    database : 'graph',
});

export const promisePool = pool.promise();
