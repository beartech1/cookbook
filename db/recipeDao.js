'use strict';

const db = require('./setupDb.js').getDb();

const addRecipe = function(recipe) {
	const measurementLookup = 'SELECT id FROM recipes."LU_MEASUREMENT" WHERE name = $1';
	const ingredientInsert = 'INSERT INTO recipes."INGREDIENT" (name, meas_id) values ($1, $2);';
	const recipeInsert = 'INSERT INTO recipes."RECIPE" (name, ww_pts, instructions, tags) values ($1, $2, $3, $4);';
	const ingredientRecipeLinkInsert = 'INSERT INTO recipes."INGREDIENT_RECIPE_LINK" (recipe_id, ingredient_id, meas_amt, "order") values ($1, $2, $3, $4);';

	// TODO: now lookup all the measurements, put in a map?
	// TODO: then insert ingredients (will need the ingredient ids)
	// TODO: then insert recipe record (will need the recipe id)
	// TODO: finally insert link record
};

const updateRecipe = function (recipe) {

};

const getRecipe = function() {

};

module.exports = {
	addRecipe: addRecipe,
	updateRecipe: updateRecipe,
	getRecipe: getRecipe
};