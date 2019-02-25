'use strict';

const pool = require('./setupDb.js').getPool();

const addRecipe = function(recipe) {
	const recipeInsert = 'INSERT INTO recipes."RECIPE" (name, ww_pts, instructions, tags) values ($1, $2, $3, $4) RETURNING id;';
	const measurementLookup = 'SELECT id FROM recipes."LU_MEASUREMENT" WHERE name = $1';
	const ingredientInsert = 'INSERT INTO recipes."INGREDIENT" (name, meas_id) values ($1, $2) RETURNING id;';
	const ingredientRecipeLinkInsert = 'INSERT INTO recipes."INGREDIENT_RECIPE_LINK" (recipe_id, ingredient_id, meas_amt, "order") values ($1, $2, $3, $4) RETURNING id;';

	let recipeId;
	pool.connect((err, client, done) => {
		if (err) throw err;
		client.query(recipeInsert, [recipe.name, recipe.wwPts, recipe.instructions, recipe.tags], (err, res) => {
			done();
			if (err) {
				console.log(err.stack);
			}
			recipeId = res.rows[0].id;

			for (let i = 0; i < recipe.ingredients.length; i++) {
				const ingredient = recipe.ingredients[i];
				const values = [];
				values.push(ingredient.name);
				// query for measurement id given the measurement name
				client.query(measurementLookup, [ingredient.measName], (err, res) => {
					done();
					if (err) {
						console.log(err.stack);
					}

					values.push(res.rows[0].id);

					// insert the ingredient record into the db and record the new id
					client.query(ingredientInsert, values, (err, res) => {
						done();
						if (err) {
							console.log(err.stack);
						}

						client.query(ingredientRecipeLinkInsert, [recipeId, res.rows[0].id, ingredient.measAmt, ingredient.order], (err, res) => {
							done();
							if (err) {
								console.log(err.stack);
							}

							// hacky...
							if (i + 1 === recipe.ingredients.length) {
								pool.end(() => {
									console.log('pool has ended.');
								});
							}
						});
					});
				});
			}
		});
	});
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