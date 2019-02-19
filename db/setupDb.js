'use strict';

const {Client} = require('pg');

const client = new Client({
	user: 'postgres',
	host: 'localhost',
	database: 'cookbook',
	password: 'postgres',
	port: 5433
});

module.exports = {
	getDb: function () {
		return client;
	}
};