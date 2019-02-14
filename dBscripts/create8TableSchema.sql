create sequence "RECIPE_id_seq"
;

create sequence "INGREDIENT_id_seq"
;

create sequence "INGEDIENT_RECIPE_LINK_id_seq"
;

create sequence "TAG_id_seq"
;

create sequence "RECIPE_TAG_LINK_id_seq"
;

create sequence "LU_MEASUREMENT_id_seq"
;

create sequence "INSTRUCTION_id_seq"
;

create sequence "LU_MEAL_id_seq"
;

create table cookbook."RECIPE"
(
  name varchar(250) not null,
  id serial not null
    constraint "RECIPE_pkey"
    primary key,
  source varchar(250),
  weight_watchers_points smallint,
  meal_id integer
)
;

create index "fki_MEAL_fkey"
  on "RECIPE" (meal_id)
;

create table cookbook."INGREDIENT"
(
  id serial not null
    constraint "INGREDIENT_pkey"
    primary key,
  name varchar(250) not null
)
;

create table cookbook."INGREDIENT_RECIPE_LINK"
(
  id serial not null
    constraint "INGREDIENT_RECIPE_LINK_pkey"
    primary key,
  recipe_id integer not null
    constraint RECIPE_fkey
    references cookbook."RECIPE",
  ingredient_id integer not null
    constraint INGREDIENT_fkey
    references cookbook."INGREDIENT",
  measurement_id integer not null,
  measurement_amount numeric(5,3) not null,
  "order" smallint
)
;

create index "fki_RECIPE_fkey"
  on "INGREDIENT_RECIPE_LINK" (recipe_id)
;

create index "fki_INGREDIENT_fkey"
  on "INGREDIENT_RECIPE_LINK" (ingredient_id)
;

create index "fki_MEASUREMENT_fkey"
  on "INGREDIENT_RECIPE_LINK" (measurement_id)
;

create table cookbook."TAG"
(
  id serial not null
    constraint "TAG_pkey"
    primary key,
  name varchar(250) not null
)
;

create table cookbook."RECIPE_TAG_LINK"
(
  id serial not null
    constraint "RECIPE_TAG_LINK_pkey"
    primary key,
  recipe_id integer not null
    constraint RECIPE_fkey
    references cookbook."RECIPE",
  tag_id integer not null
    constraint TAG_fkey
    references cookbook."TAG"
)
;

create table cookbook."LU_MEASUREMENT"
(
  id serial not null
    constraint "LU_MEASUREMENT_pkey"
    primary key,
  name varchar(250) not null,
  measurement_type varchar(10) not null
)
;

alter table cookbook."INGREDIENT_RECIPE_LINK"
  add constraint MEASUREMENT_fkey
foreign key (measurement_id) references cookbook."LU_MEASUREMENT"
;

create table cookbook."INSTRUCTION"
(
  id serial not null
    constraint "INSTRUCTION_pkey"
    primary key,
  display varchar(500) not null,
  "order" smallint not null,
  recipe_id integer not null
    constraint RECIPE_fkey2
    references cookbook."RECIPE"
)
;

create index "fki_RECIPE_fkey2"
  on "INSTRUCTION" (recipe_id)
;

create table cookbook."LU_MEAL"
(
  id serial not null
    constraint "LU_MEAL_pkey"
    primary key,
  name varchar(250) not null
)
;

alter table cookbook."RECIPE"
  add constraint MEAL_fkey
foreign key (meal_id) references cookbook."LU_MEAL"
;

