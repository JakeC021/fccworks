#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

$($PSQL "create table customers(customer_id serial primary key,phone varchar unique,name varchar) ")
$($PSQL "create table appointments(appointment_id serial primary key,customer_id int,service_id int, time varchar) ")
$($PSQL "create table services(service_id serial primary key,name varchar) ")

$($PSQL "alter table appointments add foreign key(customer_id) references customers(customer_id) ")
$($PSQL "alter table appointments add foreign key(service_id) references services(service_id) ")

