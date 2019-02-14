const {Client} = require('pg');

const client = new Client({
    user: 'postgres',
    host: 'localhost',
    database: 'cookbook',
    password: 'postgres',
    port: 5433,
});

client.connect();

client.query('SELECT * FROM recipes."INGREDIENT";', (err, res) => {
    if (err) {
        throw err;
    }

    res.rows.forEach((row) => {
        console.log(row);
    });
    client.end()
});