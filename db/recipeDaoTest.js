'use strict';

const dao = require('./recipeDao.js');
const recipeToInsert = {
    "name": "Grilled Cheese",
    "wwPts": 20,
    "instructions": "1. butter bread and put in pan on high \n2. put cheese on bread \n3. put bread together",
    "tags": "lunch,easy,quick",
    "ingredients": [
        {
            "name": "wheat bread",
            "measName": "each",
            "measAmt": 2,
            "order": 1
        }, {
            "name": "butter",
            "measName": "tablespoon",
            "measAmt": 1,
            "order": 2
        }, {
            "name": "american cheese",
            "measName": "each",
            "measAmt": 1,
            "order": 3
        }
    ]
};

//insert simple recipe
dao.addRecipe(recipeToInsert);