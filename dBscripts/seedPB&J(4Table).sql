insert into recipes."LU_MEASUREMENT" (name, abbrev, meas_type) values ('each', 'ea', 'solid');
insert into recipes."LU_MEASUREMENT" (name, abbrev, meas_type) values ('tablespoon', 'tbsp', 'liquid');

insert into recipes."INGREDIENT" (name, meas_id) values ('bread', 1);
insert into recipes."INGREDIENT" (name, meas_id) values ('peanut butter', 2);
insert into recipes."INGREDIENT" (name, meas_id) values ('jelly', 2);

insert into recipes."RECIPE" (name, ww_pts, instructions, tags)
values ('PB & J Sandwich', 15,
        '1. spread peanut butter on first bread slice \n 2. spread jelly on second bread slice \m 3. put bread together like a sandwich',
        'lunch,easy,quick');

insert into recipes."INGREDIENT_RECIPE_LINK" (recipe_id, ingredient_id, meas_amt, "order")
values (1, 1, 2, 1);
insert into recipes."INGREDIENT_RECIPE_LINK" (recipe_id, ingredient_id, meas_amt, "order")
values (1, 2, 3, 2);
insert into recipes."INGREDIENT_RECIPE_LINK" (recipe_id, ingredient_id, meas_amt, "order")
values (1, 3, 3, 3);