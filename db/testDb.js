'use strict';

const client = require('./setupDb.js').getDb();

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