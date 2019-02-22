'use strict';

const {Pool} = require('pg');

const pool = new Pool({
	user: 'postgres',
	host: 'localhost',
	database: 'cookbook',
	password: 'postgres',
	port: 5433
});

module.exports = {
	getPool: function () {
		return pool;
	}
};