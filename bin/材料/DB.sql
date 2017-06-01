/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/5/26 20:47:50                           */
/*==============================================================*/


drop table if exists Customer;

drop table if exists Dish;

drop table if exists OrderItem;

drop table if exists Orders;

/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table Customer
(
   username             varchar(32) not null,
   password             varchar(32),
   nickname             varchar(32),
   primary key (username)
);

/*==============================================================*/
/* Table: Dish                                                  */
/*==============================================================*/
create table Dish
(
   dishid               int AUTO_INCREMENT not null,
   name                 varchar(128),
   price                float,
   description          varchar(256),
   imgurl               varchar(1024),
   discount             float,
   primary key (dishid)
);

/*==============================================================*/
/* Table: OrderItem                                             */
/*==============================================================*/
create table OrderItem
(
   dishid               int not null,
   orderid              varchar(64) not null,
   count                int,
   finalprice           float,
   primary key (dishid, orderid)
);

/*==============================================================*/
/* Table: Orders                                                */
/*==============================================================*/
create table Orders
(
   orderid              varchar(64) not null,
   username             varchar(32),
   time                 datetime,
   count                int,
   totalptice           int,
   paystatus            varchar(16),
   address              varchar(64),
   tel                  varchar(16),
   primary key (orderid)
);

alter table OrderItem add constraint FK_OrderItem foreign key (dishid)
      references Dish (dishid);

alter table OrderItem add constraint FK_OrderItem2 foreign key (orderid)
      references Orders (orderid);

alter table Orders add constraint FK_Relationship_1 foreign key (username)
      references Customer (username);

