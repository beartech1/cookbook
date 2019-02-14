--PB & J
INSERT INTO cookbook."LU_MEAL" (name)
VALUES ('Entree');

INSERT INTO cookbook."LU_MEASUREMENT" (name, measurement_type)
VALUES ('teaspoon', 'liquid');
INSERT INTO cookbook."LU_MEASUREMENT" (name, measurement_type)
VALUES ('each', 'solid');

INSERT INTO cookbook."INGREDIENT" (name)
VALUES ('Bread');
INSERT INTO cookbook."INGREDIENT" (name)
VALUES ('Peanut Butter');
INSERT INTO cookbook."INGREDIENT" (name)
VALUES ('Grape Jelly');

INSERT INTO cookbook."TAG" (name)
VALUES ('Cheap');
INSERT INTO cookbook."TAG" (name)
VALUES ('Fast');

INSERT INTO cookbook."RECIPE" (name, source, weight_watchers_points, meal_id)
VALUES ('Peanut Butter & Jelly Sandwich', 'www.google.com', 11, 1);

-- bread
INSERT INTO cookbook."INGREDIENT_RECIPE_LINK" (recipe_id, ingredient_id, measurement_id, measurement_amount, "order")
VALUES (1, 1, 2, 2, 1);
-- peanut butter
INSERT INTO cookbook."INGREDIENT_RECIPE_LINK" (recipe_id, ingredient_id, measurement_id, measurement_amount, "order")
VALUES (1, 2, 1, 2, 2);
-- jelly
INSERT INTO cookbook."INGREDIENT_RECIPE_LINK" (recipe_id, ingredient_id, measurement_id, measurement_amount, "order")
VALUES (1, 3, 1, 2, 3);

INSERT INTO cookbook."INSTRUCTION" (display, "order", recipe_id)
VALUES ('Spread peanut butter onto first bread slice', 1, 1);
INSERT INTO cookbook."INSTRUCTION" (display, "order", recipe_id)
VALUES ('Spread jelly onto the second bread slice', 2, 1);
INSERT INTO cookbook."INSTRUCTION" (display, "order", recipe_id)
VALUES ('Put bread pieces together and enjoy!', 3, 1);

INSERT INTO cookbook."RECIPE_TAG_LINK" (recipe_id, tag_id)
VALUES (1, 1);
INSERT INTO cookbook."RECIPE_TAG_LINK" (recipe_id, tag_id)
VALUES (1, 2);