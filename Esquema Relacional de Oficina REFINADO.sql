-- criaçao do banco de dados para o cenario do Oficina
create database oficina;
use oficina;

-- drop database oficina;
-- criando tabela cliente
create TABLE clients(
		idClient int auto_increment primary key,
        Fname varchar(10),
        Sexo char(1),
        Lname varchar (20),
        CPF char (11) not null,
        CNPJ float default ('false'),
       constraint unique_cpf_client unique (CPF),
       constraint unique_idClient_client unique (idClient)
					
);
alter table clients auto_increment=1;
-- drop table CLIENTS;

create table  Address_clients(
		idClient int,
        Address_rua varchar(50),
         Address_number float default ('S/N'),
		 Address_district varchar(50),
         Address_City varchar(50),
         Address_state varchar(50),
         Address_country varchar(50),
        different_delivery_address bool default (null),
        delivery_address_number float default ('S/N'),
        delivery_district varchar(50),
        delivery_City varchar(50),
        delivery_state varchar(50),
		delivery_country varchar(50),
        constraint fk_idClient_Address_clients foreign key (idClient) references clients(idClient)
        							on update cascade 
);
		

-- criando tabela Veiculo do cliente
create TABLE clients_vehicle(
		idClient int,
        maker varchar (10) not null,
        Vyear int not null,
        Vdescription varchar (100),
        constraint fk_idClient_clients_vehicle foreign key (idClient) references clients(idClient)
);


-- criando tabela reparos
create table repairs(
		idRepair int primary key not null auto_increment,
        delivery_date date not null,
        Rdescription varchar (100),
		constraint unique_idRepair_repairs unique (idRepair)
						
);


-- criando tabela Revisao
create table revision(
		idRevision int primary key not null auto_increment,
        delivery_date date not null,
		Rdescription varchar (100),
		constraint unique_idRevision_revision unique (idRevision)
				
);

-- criando tabela SERVIÇOS
create table services(
		idClient int,
		idRepair int,
        idRevision int,      
		primary key(idClient,idRepair),
        constraint fk_idRevision_revision foreign key (idRevision) references revision(idRevision)
        
        	on update cascade 
);

 -- drop database oficina; 
-- criando tabela fornecedor
create TABLE Supplier(
		idSupplier int primary key not null auto_increment,
        Social_Name varchar(45) not null,
        CNPJ float not null,
        constraint unique_CNPJ_client unique (CNPJ)

);
alter table Supplier auto_increment=1;
DESC Supplier;

-- criando tabela estoque.
create TABLE Inventory(
		idInventory int auto_increment,
        idparts int not null,
        Address_rua varchar (100),
        Address_number float default 0,
		 Address_district varchar(50),
         Address_City varchar(50),
         Address_CEP float not null,
         Address_state varchar(50),
         Address_country varchar(50),        
        primary key (idInventory, idparts),
        constraint unique_idInventory_client unique (idInventory)
        
);
alter table Inventory auto_increment=1;
-- drop table Inventory;

-- criando tabela peças
create TABLE parts(
		idparts int auto_increment,
        Pvalue float not null,
        Pdescription varchar (45),  
        idinventory int,
        Pname varchar(50),
        category enum('Suspensao','Eletrica','motor','outro') not null,
		maker varchar (50),
        validity date default 0 ,
        primary key (idparts,Pvalue),
		constraint fk_idinventory_Product foreign key (idinventory) references inventory(idinventory)
        	on update cascade 
);
-- drop table parts;
alter table parts auto_increment=1;
desc parts;

-- criando tabela peças por fornecedor
create table Supplier_parts(
		idSupplier int,
        idPparts int,
        primary key (idSupplier, idPparts),
        constraint fk_idPparts_Supplier_parts foreign key (idPparts) references parts(idparts),
        constraint fk_idSupplier_Supplier_Product foreign key (idSupplier) references Supplier(idSupplier)
        	on update cascade 
);
desc Supplier_parts;
-- drop TABLE Supplier_parts;

-- criando tabela orcamento reparo
create table Repair_budget(
			idRepair INT,
            idParts int,
            Repairs_Value float not null,
            Ppvalue FLOAT not null,
            Team varchar (45),
            Authorization enum('Sim','Nao','Aguardando'),
			primary key (idRepair,idParts)            
          
            	
);
-- drop table Repair_budget;
desc Repair_budget;

-- criando tabela orçamento revisao
create table Revision_budget(
			idRevision INT,
            idParts int,
            Revision_Value float,
            Team varchar (45),
            Authorization enum('Sim','Nao','Aguardando'),
            primary key(idRevision),
			constraint fk_idParts_Revision_budget foreign key (idParts) references parts(idParts)
            	on update cascade 
);
-- drop table Revision_budget;
desc Revision_budget;

-- criando tabela peças em estoque
create TABLE Parts_Stock(
		idSParts int,
        idSinventory int,
        idStock int,
        primary key(idSParts, idSinventory),
		Amount int not null default 0,
        constraint fk_ididStock_Parts_Stock foreign key (idSParts) references parts(idParts),
        constraint fk_idSinventory_Product_Stock foreign key (idSinventory) references Inventory(idInventory)
        	on update cascade 
);
desc Parts_Stock;


-- criando tabela Funcionarios
create TABLE employees(
		idemployees int primary key not null auto_increment,
        SName varchar(45) not null,
        Lname Varchar(45) not null,
        CPF char(11) unique,
		Address_rua varchar (100),
        Address_number float default 0,
		 Address_district varchar(50),
         Address_City varchar(50),
         Address_CEP float not null,
         Address_state varchar(50),
         Address_country varchar(50),
        Specialty varchar(100) not null,
        Fone float not null,
        constraint unique_CPF_employees unique (CPF)
        
);
alter table employees auto_increment=1;
-- drop table employees;

-- criando tabela Ordem de Serviço
create TABLE OS(
		idOS int unique auto_increment,
        idRevision int, 
        idRepair INT,
        Classification varchar (50),
        OS_authorization enum('Sim','Nao','Aguardando'),
        Status_Os enum('Iniciada','Aguardando','Comcluida') not null,
        Date_Completed date,
        primary key(idOS,idRevision),
        constraint fk_idRepair_OS foreign key (idRepair) references repairs(idRepair)
        	on update cascade 
);
alter table OS auto_increment=1;
desc OS;
-- drop table Os;
-- criando tabela Equipe de Responsavel Pela OS
create TABLE OS_Team(
		idOS int,
        idIdemployees int,
        primary key(idOS),
        constraint unique_idOS_OS_Team unique (idOS),
		constraint fk_idIdemployees_OS_Team foreign key (idOS) references Os(idOS)
        	on update cascade 
);
desc OS_Team;

-- show databases;
SHOW tableS;
use information_schema;
desc referential_constraints;
-- select * from referential_constraints where constraint_schema = 'ecommerce';