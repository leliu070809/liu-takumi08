-- Project Name : ECSITE
-- Date/Time    : 2026/04/11 14:46:36
-- Author       : 81801
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

/*
  << CAUTION !! >>
  BackupToTempTable, RestoreFromTempTable directive is attached.
 This preserve data after drop table and create table.
 This function temporarily creates temporary table like $$TableName.
  This feature is only available in A5:SQL Mk-2.
*/

-- SUPPLIER
-- * RestoreFromTempTable
create table SUPPLIER (
  category_id serial not null
  , category_name character varying (100) not null
  , tel character varying (11) not null
  , address character varying (255) not null
  , email character varying (100) not null
  , created_by integer
  , updated_by integer
  , created_at timestamp
  , updated_at timestamp
  , constraint SUPPLIER_PKC primary key (category_id)
) ;

-- ORDER_DETAIL
-- * RestoreFromTempTable
create table ORDER_DETAIL (
  order_detai_no serial not null
  , order_no integer not null
  , product_id integer not null
  , item_num integer not null
  , created_by integer
  , updated_by integer
  , created_at timestamp
  , updated_at timestamp
  , constraint ORDER_DETAIL_PKC primary key (order_detai_no,order_no)
) ;

-- ORDER_HEADER
-- * RestoreFromTempTable
create table ORDER_HEADER (
  order_no serial not null
  , member_id integer not null
  , order_datetime timestamp not null
  , payment_type char(2) not null
  , member_card_id integer
  , created_by integer
  , updated_by integer
  , created_at timestamp
  , updated_at timestamp
  , constraint ORDER_HEADER_PKC primary key (order_no)
) ;

comment on table SUPPLIER is 'SUPPLIER';
comment on column SUPPLIER.category_id is 'supplier_id';
comment on column SUPPLIER.category_name is 'supplier_name';
comment on column SUPPLIER.tel is 'tel:no hyphen (ko -)';
comment on column SUPPLIER.address is 'address';
comment on column SUPPLIER.email is 'email';
comment on column SUPPLIER.created_by is 'created_by';
comment on column SUPPLIER.updated_by is 'updated_by';
comment on column SUPPLIER.created_at is 'created_at';
comment on column SUPPLIER.updated_at is 'updated_at';

comment on table ORDER_DETAIL is 'ORDER_DETAIL';
comment on column ORDER_DETAIL.order_detai_no is 'order_detail_no';
comment on column ORDER_DETAIL.order_no is 'order_no';
comment on column ORDER_DETAIL.product_id is 'product_id';
comment on column ORDER_DETAIL.item_num is 'item_num';
comment on column ORDER_DETAIL.created_by is 'created_by';
comment on column ORDER_DETAIL.updated_by is 'updated_by';
comment on column ORDER_DETAIL.created_at is 'created_at';
comment on column ORDER_DETAIL.updated_at is 'updated_at';

comment on table ORDER_HEADER is 'ORDER_HEADER';
comment on column ORDER_HEADER.order_no is 'order_no';
comment on column ORDER_HEADER.member_id is 'member_id';
comment on column ORDER_HEADER.order_datetime is 'order_datetime';
comment on column ORDER_HEADER.payment_type is 'payment_type:CC:creadit, BT: chuyen khoan, DV: tien mat';
comment on column ORDER_HEADER.member_card_id is 'member_card_id';
comment on column ORDER_HEADER.created_by is 'created_by';
comment on column ORDER_HEADER.updated_by is 'updated_by';
comment on column ORDER_HEADER.created_at is 'created_at';
comment on column ORDER_HEADER.updated_at is 'updated_at';
product
ALTER TABLE product ADD supplier_id INTEGER NULL;

