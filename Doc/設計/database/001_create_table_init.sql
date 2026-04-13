create table CATEGORY (
  id serial not null
  , category_name character varying (50) not null
  , category_desc character varying (255)
  , constraint CATEGORY_PKC primary key (id)
) ;

-- PRODUCT
-- * RestoreFromTempTable
create table PRODUCT (
  id serial not null
  , product_name character varying (50) not null
  , price integer not null
  , category_id integer
  , constraint PRODUCT_PKC primary key (id)
) ;

-- MANAGER
-- * RestoreFromTempTable
create table MANAGER (
  id serial not null
  , username character varying (50)
  , last_name character varying (100) not null
  , first_name character varying (100) not null
  , birthday date
  , address character varying (255)
  , constraint MANAGER_PKC primary key (id)
) ;

-- MEMBERS
-- * RestoreFromTempTable
create table MEMBERS(
  id serial not null
  , username character varying (50)
  , last_name character varying (100) not null
  , first_name character varying (100) not null
  , birthday date
  , address character varying (255)
  , constraint USER_PKC primary key (id)
) ;
