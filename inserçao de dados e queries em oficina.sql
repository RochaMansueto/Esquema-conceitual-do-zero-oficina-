-- inserçao de dados e queries
use oficina;
show tables;


-- clients (Fname, Sexo, LName, CPF, CNPJ)
insert into clients (Fname, Sexo, LName, CPF, CNPJ) values
						('Romario','m', 'Silva', '11111111111', null ),
                        ('Romenia','f','Kalifa','22222222222', null), 
                         ('Albion','m','Mago', '22333333333', null);
 select * from clients;      
 
 
 -- idClient,Address_rua,Address_number,Address_district,Address_City,Address_state,Address_country,different_delivery_address,delivery_address_number,delivery_district,
 -- delivery_City,delivery_state,delivery_country.
insert into Address_clients (idClient,Address_rua,Address_number,Address_district,Address_City,Address_state,Address_country,different_delivery_address,delivery_address_number,delivery_district,delivery_City,delivery_state,delivery_country) values
						('1','Rua Da loucura','12','centro','smalville','RJ','Br',null,'3','ABC','SP','SP','BR'),
                        ('2','Rua bonita','22','Sul','piraiba','SP','BR',null,null,null,null,null,null), 
                        ('3','Rua Das Galinhas','69','Mais em baixo','alamanda','FL','EUA',null,null,null,null,null,null);
                      
	
select * from Address_clients;


-- clients_vehicle(idClient,maker,Vyear,Vdescription) 
insert into clients_vehicle(idClient,maker,Vyear,Vdescription) values
							('1','Fiat', '1999','Fiat uno verde final da placa 797'),
                            ('2','BMW', '2021','Prata fosco final da placa 912'),
                            ('3','WV', '2019','Gol rosa final da placa 283');


select * from Supplier_Product;

-- repairs (idRepair, delivery_date, Rdescription) 
insert into repairs (idRepair, delivery_date, Rdescription) values 
						('1', '2022-12-2', 'B3'),
                        ('2', '2022-11-2', 'B1'),
                        ('3', '2022-1-1', 'B0');
                        
					
select * from repairs;
        
-- revision (idRevision, delivery_date, Rdescription)
insert into revision (idRevision, delivery_date, Rdescription) values
						('1', '2022-12-2', 'troca de oleo'),
                        ('2', '2021-11-2', 'alinhamento'),
                        ('3', '2023-1-1', 'troca de filtros');
				
select * from revision;      
 
 
 -- services(idClient,idRepair,idRevision)
 insert into services(idClient,idRepair,idRevision)  values 
						(1,'1','1'),
                        (2,'2','2'),
                        (3,'3','3');
 select * from services; 
 
 
 -- SupplieridSupplier int primary key not null auto_increment,Social_Name,CNPJ)
 insert into Supplier(Social_Name,CNPJ) values
						('Pemaza SA',123234985769),
                        ('Casa da borracha',183831000100),
                        ('Toyota FK',893800111000);
		
                  select * from   Supplier;    
-- delete from Supplier where Social_Name in(1,2);


-- Inventory(idInventory,idparts,Address)
insert into Inventory(idparts,Address_rua,Address_number,Address_district,Address_City,Address_CEP,Address_state,Address_country) values
					('1','Rua sombra','12','centro','smalville','987432','RJ','Br'),
                   ('2','Rua lz','11','sul','lilettille','929173726','AM','Br'),
                   ('3','Rua abc','2','norte','catibele','97214','AC','Br');
                   
                    
 select * from   Inventory;
 
-- parts (idparts, Pvalue, Pdescription, idinventory, Pname, category,maker,validity)
insert into parts (Pvalue, Pdescription, idinventory, Pname, category,maker,validity)	values
			('345','kit suspensao','1','Kit354','suspensao','toyota','2023-12-2'),
			('30','pastilha de freio','2',null,'outro','fiat','2022-11-2'),
            ('3500','kit motor','3','motor completo','motor','BMW','2029-12-2');
			
            
          select * from parts; 
           
-- Supplier_parts(idSupplier,idPparts)   
insert into Supplier_parts(idSupplier,idPparts) values
						(1,'2'),
                        (3,'3');
select * from Supplier_parts;

-- Repair_budget (idRepair,idParts,Repairs_Value,Ppvalue,Team,Authorization) 
insert into Repair_budget (idRepair,idParts,Repairs_Value,Ppvalue,Team,Authorization) values
						(1,3,'45','22','um','Sim'),
                        (2,1,'110','540','Dois','Nao'),
                        (3,2,'29','55','um','Aguardando'),
                        (4,3,'350','5393','Dois','Sim');
                        
select * from Repair_budget;
-- delete from Repair_budget where idRepair in(1,2,3,4);

-- Revision_budget(idRevision,idParts,Revision_Value,Ppvalue,Team,Authorization)
insert into Revision_budget(idRevision,idParts,Revision_Value,Team,Authorization) values
						(1,3,'45','um','Aguardando'),
                        (2,1,'110','Dois','Nao'),
                        (3,2,'29','um','Nao');
                      
select * from Revision_budget;


-- Parts_Stock(idSParts,idSinventory,idStock,Amount)
insert into Parts_Stock(idSParts,idSinventory,idStock,Amount) values
					(1,3,'1','10'),
                    (3,2,'1','110'),
                     (2,1,'1','240');
 select * from  Parts_Stock;                 


-- employees(idemployees,SName,Lname,CPF,Address,Specialty,Fone)
insert into employees(SName,Lname,CPF,Address_rua,Address_number,Address_district,Address_City,Address_CEP,Address_state,Address_country,Specialty,Fone) values
					('cezar','Souza','12211111111','rua 12','11', 'centro', 'jiparana','123422', 'RO','BR','Suspensao','9876567890'),
                    ('henrique','Pinto','12986387351','avenida quatro','2', 'louco','panama','1987422', 'DF','BR','Eletricista','0822156711'),
                    ('Amanda','Leite','09898675372','luz de havez','44', 'norte','afronte','1980000', 'am','BR','motor','0822156711');
 select * from  employees; 


-- OS(idOS,idRevision,idRepair,Classification,OS_authorization,Status_Os,Date_Completed)
insert into OS(idOS,idRevision,idRepair,Classification,OS_authorization,Status_Os,Date_Completed)values
					(1,32,'1','Reparo no sistema eletrico','Sim','Comcluida','2022-12-9' ),
                    (3,2,'3','Reparo suspensao','Sim','Iniciada','2022-10-9'),
                     (2,1,'2','Troca de motor','Aguardando','Aguardando', null );
                     
 select * from  Parts_Stock;                 
 
 
 insert into OS_Team(idOS,idIdemployees) values
				(1,2),
                (2,1);
