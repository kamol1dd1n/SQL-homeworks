--Hometask2
--BIT data type stores boolean value, can accept 1 as true and 0 as false
--XML data type stores complex structural data that dont fit neatly into rows
use DB1
create table iam_projects_graveyard(db_id int identity (1,1) primary key, id int)
create table iam_projects (db_id int identity (1,1) primary key, id int, name varchar(20), type varchar(20))
create table iam_staged_projects_rules (db_id int identity(1,1) primary key, id int, name varchar(20), type varchar(20), deleted BIT, project_id int foreign key references iam_projects(id))
create table iam_staged_rule_conditions (db_id int identity (1,1), rule_db_id int foreign key references iam_staged_projects_rules(db_id), value XML, attribute varchar(20), operator varchar(20))
create table iam_project_rules (db_id int identity(1,1) primary key, id int, name varchar(20), type varchar(20), project_id int)
create table iam_rule_conditions (db_id int identity(1,1), rule_db_id int foreign key references iam_project_rules(db_id), value XML, attribute varchar(20), operator varchar(20))
create table iam_roles (db_id int identity(1,1), id int, name varchar(20), type varchar(20), actions XML)
create table iam_policies (db_id int identity(1,1), id int, name varchar(20), type varchar (20))
create table iam_statements (db_id int identity(1,1), id int, effect varchar(20), actions XML, resources XML, policy_id int foreign key references iam_policies(id), role_id int foreign key references iam_roles(id))
create table iam_members (db_id int identity(1,1), id int, name varchar(20))
create table iam_role_projects (role_id int foreign key references iam_roles(id), project_id int foreign key references iam_projects(id))
create table iam_statement_projects (project_id int foreign key references iam_projects(id), statement_id int foreign key references iam_statements(id))
create table iam_policy_projects (policy_id int foreign key references iam_policies(id), project_id int foreign key references iam_projects(id))
create table iam_policy_members (member_id int foreign key references iam_members(id), policy_id int foreign key references iam_policies (id))
select * from sys.tables

    ALTER TABLE iam_projects
    ADD CONSTRAINT iam_projects_id--unique_constraint_name -- Give it a descriptive name
    UNIQUE (id)

	ALTER TABLE iam_policies
    ADD CONSTRAINT iam_policies_id--unique_constraint_name -- Give it a descriptive name
    UNIQUE (id)

	ALTER TABLE iam_roles
    ADD CONSTRAINT iam_roles_id--unique_constraint_name -- Give it a descriptive name
    UNIQUE (id)

	alter table iam_statements
	add constraint iam_statements_id
	unique (id)
	drop table iam_project_rules
	 alter table iam_members
	 add constraint iam_members_id
	 unique (id)
	 alter table iam_project_rules
	 add constraint iam_project_rules_fkey
	 foreign key (project_id)
	 references iam_projects (id)

	 --Hometask1
	 use DB1
	 create table Cities(name varchar(50), address varchar(50))

insert into Cities values ('Romano', 'Italy')
insert into Cities values ('Federico', 'Bilbao')
insert into Cities values ('Sergio', null)
insert into Cities values ('romeo', '')
insert into Cities values ('anya', ' ')
insert into Cities values ('Oisha', null)
insert into Cities values ('Akmal', '')
insert into Cities values ('Jacob', ' ')
insert into Cities values ('Cristiano', 'Funchal')
select * from Cities

--trigger = when an event happens, do something
--ex. (INSERT, UPDATE, DELETE)
--checks data, handles errors, auditing tables

create trigger autochange_to_tashkent
on Cities
instead of insert
as
begin
insert into Cities(name, address)
select name,
case 
when address is null or address = '' then 'Tashkent' 
else address
end 
from inserted
end