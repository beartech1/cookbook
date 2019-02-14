create sequence "LU_MEASUREMENT_id_seq"
;

create sequence "INGREDIENT_id_seq"
;

create sequence "RECIPE_id_seq"
;

create sequence "INGREDIENT_RECIPE_LINK_id_seq"
;

create table recipes."LU_MEASUREMENT"
(
  id serial not null
    constraint "LU_MEASUREMENT_pkey"
    primary key,
  name varchar(250),
  abbrev varchar(25),
  meas_type varchar(25)
)
;

create table recipes."INGREDIENT"
(
  id serial not null
    constraint "INGREDIENT_pkey"
    primary key,
  meas_id integer
    constraint INGREDIENT_LU_MEASUREMENT_fkey
    references recipes."LU_MEASUREMENT",
  name varchar(250) not null
)
;

create index "fki_INGREDIENT_LU_MEASUREMENT_fkey"
  on "INGREDIENT" (meas_id)
;

create table recipes."RECIPE"
(
  id serial not null
    constraint "RECIPE_pkey"
    primary key,
  name varchar(250) not null,
  source varchar(500),
  ww_pts smallint,
  instructions text not null,
  tags varchar(250)
)
;

create table recipes."INGREDIENT_RECIPE_LINK"
(
  id serial not null
    constraint "INGREDIENT_RECIPE_LINK_pkey"
    primary key,
  recipe_id integer not null
    constraint INGRED_REC_LNK_RECIPE_fkey
    references recipes."RECIPE",
  ingredient_id integer not null
    constraint INGRED_REC_LNK_INGREDIENT_fkey
    references recipes."INGREDIENT",
  meas_amt numeric(6,3),
  "order" smallint
)
;

create index "fki_INGRED_REC_LNK_RECIPE_fkey"
  on "INGREDIENT_RECIPE_LINK" (recipe_id)
;

create index "fki_INGRED_REC_LNK_INGREDIENT_fkey"
  on "INGREDIENT_RECIPE_LINK" (ingredient_id)
;

