USE ecommerce;

-- inserindo clientes
 -- TABLE clients(idClient, Fname, Minit, Lname, CPF CHAR(11), RG VARCHAR(10), Street, Compl, District, City, State, CEP, BirthDate, Email);
 INSERT INTO clients(Fname, Minit, Lname, CPF, RG, Street, Compl, District, City, State, CEP, BirthDate, Email) VALUES 
					('Ana', 'M', 'Soares', '14789632125', '560254789', 'Rua Limoeiro', 'n 354, apto 1501', 'Lapa', 'Rio de Janeiro', 'RJ', '25664895', '1990-12-21', 'anamaria95@gmail.com'),
                    ('Guilherme', 'S', 'Menezes', '15896347811', '2156489701', 'Rua Carlos de Andrade', 'n 68', 'Bonsucesso', 'Rio de Janeiro', 'RJ', '25422987', '1995-07-15', 'gmenezes@hotmail.com'),
                    ('Leandra', 'G', 'Barbosa', '24563289725', '4478596123', 'Av Feraz de Vasconcelos', 'n 1015 apto 801 bloco A', 'Icaraí', 'Niterói', 'RJ', '25596748', '1985-08-01', 'leandra1985@gmail.com'),
                    ('Fernando', 'B', 'Azevedo', '35489752236', '7896541203', 'Trav Maria do Rosário', 'n 15 casa 03', 'Centro', 'Itaboraí', 'RJ', '24758968', '1978-02-28', 'febazevedo@gmahil.com'),
                    ('Caroline', 'A', 'Nascimento', '15786492246', '1254696304', 'Rua Chaves', 'lote 45 quadra 301', 'Inoã', 'Maricá', 'RJ', '24967123', '1993-05-14', 'carol_1993@gmail.com'),
                    ('Marcelo', 'C', 'Benutto', '84765823115', '9876523488', 'Av do Contorno', 'n 998 casa 02', 'Barreto', 'Niterói', 'RJ', '24954633', '1967-12-25', 'marbenuto@yahoo.com'),
                    ('Danyelly', 'S', 'Oliveira', '32183549120', '0578949236', 'Rua Santa Clara', 'n 45', 'Paraíso', 'São Gonçalo', 'RJ', '24896354', '1999-04-17','danyoliveira@gmail.com'),
                    ('Walter', 'T', 'Carvalho', '56894123018', '2165784316', 'Rua Vaz da Costa', 'n 180 apto 403', 'Alcantara', 'São Gonçalo', 'RJ', '24568944', '1980-06-21', 'wtcarvalho@hotmail.com'),
                    ('Barbara', 'N', 'Almeida', '87211599871', '4589563125', 'Av Um', 'n 1445 casa 08', 'Itaipu', 'Niterói', 'RJ', '24122588', '1992-06-15', 'barbie1992@hotmail.com'),
					('Estephano', 'V', 'Ancelotti', '14758263998', '1599864231', 'Rua Graça Silva', 'n 142 apto 101', 'Centro', 'Itaboraí', 'RJ', '24758968', '1978-11-09', 'estaphanovancelotti@gmail.com');

SELECT * FROM clients;

-- TABLE product(idProduct, ProdName, Category NOT NULL, Descript, Rating FLOAT DEFAULT 0, Price FLOAT NOT NULL);
INSERT INTO product (ProdName, Category, Descript, Rating, Price) VALUES
					('Escorredor de Prato', 'Cozinha', 'Escorredor para pia', 3.5, 39.99),
                    ('Porta Escova de Dentes', 'Banheiro', 'Com ventosas', 3.8, 5.99),
                    ('Almofada', 'Decoração', 'Duas almofadas de algodão', 4.2, 49.99),
                    ('Kit de solteiro', 'Quarto', 'Lençol, fronha e colcha', 4.1, 59.99),
                    ('Vaso decorativo', 'Decoração', '3 vasos de porcelana', 3.9, 21.99),
                    ('Painel de cortiça', 'Escritório', 'Com tachinhas', 4.8, 20.99),
                    ('Fruteira de Mesa', 'Cozinha', 'De plástico', 3.5, 12.99),
                    ('Quadros decorativos', 'Decoração', 'Com 2 quadros', 4.1, 39.99),
                    ('Travesseiro', 'Quarto', '100% algodão', 4.8, 45.99),
                    ('Kit de Panelas', 'Cozinha', 'Com 4 panelas esmaltadas', 4.7, 159.99);
                    
SELECT * FROM product;

-- CREATE TABLE stock( idStock, Street, Compl, District, City, State, CEP, QuantProd, CreateDate);
ALTER TABLE stock AUTO_INCREMENT=1;

INSERT INTO stock (Street, Compl, District, City, State, CEP, QuantProd, CreateDate) VALUES
				  ('BR-101', 'Km 300', 'Portão do Rosa', 'São Gonçalo', 'RJ', '24854990', 10, '2019-05-15'),
                  ('BR-101', 'Km 317', 'Barreto', 'Niteró', 'RJ', '24578950', 10, '2019-05-15');
                  
-- CREATE TABLE request ( Request_idClient, StatusRequest ENUM ('Em andamento', 'Enviado', 'Entregue', 'Cancelado') DEFAULT 'Em andamento', Descript, Freight FLOAT DEFAULT 10,
-- ValueProduct FLOAT, ValueOverall FLOAT, QuantProd INT, PaymentCash BOOL DEFAULT FALSE CONSTRAINT fk_request_clients FOREIGN KEY (Request_idClient) REFERENCES clients(idClient));
ALTER TABLE request AUTO_INCREMENT = 1;

INSERT INTO request (Request_idClient, StatusRequest, Descript, Freight, ValueProduct, ValueOverall, QuantProd, PaymentCash) VALUES
					(10, 'Enviado', 'compra aplicativo', 10, 33.98, 43.99, 2, false),
                    (5, 'Entregue', 'compra aplicativo', 15, 53.98, 58.99, 2, false),
                    (2, 'Em andamento', 'compra site', 10, 33.98, 43.99, 2, true),
                    (6, 'Enviado', 'compra aplicativo', 10, 53.98, 63.99, 2, true),
                    (8, 'Entregue', 'compra site', 10, 23.98, 23.98, 2, false);

INSERT INTO request(Request_idClient, StatusRequest, Descript, Freight, ValueProduct, ValueOverall, QuantProd, PaymentCash) VALUES
					(7, 'Enviado', 'compra site', 10, 11.99, 21.99, 1, false);

SELECT * FROM request;

-- CREATE TABLE provider( idProvider INT AUTO_INCREMENT, CNPJ, ProvRealName, ProvFantasy, Street,Compl, District, City, State, CEP CHAR(8), Contact, CreateDate DATE, 
-- CONSTRAINT unique_provider_cnpj UNIQUE(CNPJ), -- CONSTRAINT unique_provider_realName UNIQUE(ProvRealName));
ALTER TABLE provider AUTO_INCREMENT = 1;

INSERT INTO provider (CNPJ, ProvRealName, ProvFantasy, Street,Compl, District, City, State, CEP, Contact, CreateDate) VALUES
					('125648970001', 'Caza Importados LTDA', 'CazaDecor', 'Rua Santos Costa', 'n 1413', 'Bairro Industrial', 'Maricá', 'RJ', '24566985', 'caza@imports.com', '2006-11-17'),
                    ('8457778649931', 'Decorações Martins S.A.', 'DM Decor', 'Av Prates Filhos', 'n 1500', 'Venda das Pedras', 'Itaboraí', 'RJ', '24588954', 'dm.contato@dm.com', '1988-07-14'),
                    ('5477895467789', 'AnaMara Importados LTDA', 'Casa e Decoração', 'Estrada Velha de Maricá', 'n 280', 'Maria Paula', 'Niterói', 'RJ', '24123789', 'contato@anamara.com', '1998-12-31'),
                    ('1788945512536', 'Importados Augusto S/A', 'Importados e Nacionais', 'Av Mendes de Sá', 'n 1080', 'Sacramento', 'São Gonçalo', 'RJ', '24658941', 'augustosimports@contato.com', '2000-04-15');

SELECT * FROM provider;

-- CREATE TABLE seller( idSeller INT AUTO_INCREMENT, CNPJ, CPF, SellerRealName, SellerFantasy, Street, Compl, District, City, State, CEP, AssociateDate DATE, CreateDate DATE, Contact VARCHAR(45));
ALTER TABLE seller AUTO_INCREMENT = 1;

INSERT INTO seller (CNPJ, CPF, SellerRealName, SellerFantasy, Street, Compl, District, City, State, CEP, AssociateDate, CreateDate, Contact) VALUES
				   ('2564718963322', '25489671456', 'Alcantara Prods LTDA', 'Imports & Co.', 'Av Um', 'n 1400', 'Itaipu', 'Niterói', 'RJ', '24122588', '2019-08-15', '2019-08-15', 'importseco@gmail.com'),
                   ('1547896494565', '15477894865', 'Campanha Importados LTDA', 'Campanhas Boutique', 'Rua Carlos Drummond', 'n 12', 'Realengo', 'Rio de Janeiro', 'RJ', '24588987', '2021-09-21', '2018-09-12', 'andreacb@gmail.com'),
                   ('8157489986411', '54478964258', 'Cunha Revendas LTDA', 'Cunha - Cama e Banho', 'Av Laços Marques', 'n 1182', 'Centro', 'São Gonçalo',  'RJ', '24155897', '2020-10-05', '2019-12-27', 'cunhacb@gmail.com'),
                   ('1847445671235', '47758964122', 'IG CasaDecor LTDA', 'Casa & Decor', 'Rua das Mercês', 'n 21', 'Centro', 'Maricá',  'RJ', '24151566', '2022-06-25', '2020-07-15', 'casaedecor@gmail.com');

SELECT * FROM seller;
-- TABLE productSeller( idProdSeller INT, idProdProduct INT, ProdQuant INT DEFAULT 1)

INSERT INTO productSeller(idProdSeller, idProdProduct, ProdQuant) VALUES
						(9, 52, 15),
                        (11, 51, 25),
                        (12, 57, 48),
                        (10, 54, 47);

SELECT * FROM productSeller;

-- TABLE productRequest(idPR_Product INT, idPR_Request INT, PRQuantity INT, PRStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível');
INSERT INTO productRequest(idPR_Product, idPR_Request, PRQuantity, PRStatus) VALUES
						  (51, 2, 1, 'Disponível'),
                          (56, 3, 2, 'Disponível'),
                          (55, 1, 1, 'Sem estoque'),
                          (58, 4, 1, 'Disponível');
                          
SELECT * FROM productRequest;

-- TABLE productStock(idPS_Product, idPS_Stock, ProdQuant,);
INSERT INTO productStock (idPS_Product, idPS_Stock, ProdQuant) VALUES
						(55, 1, 200),
                        (56, 2, 251),
                        (57, 1, 400),
                        (58, 2, 587);
                        
SELECT * FROM productStock;

-- TABLE productProvider(idPP_Product, idPP_Provider, ProdQuant);
INSERT INTO productProvider(idPP_Product, idPP_Provider, ProdQuant) VALUES
							(55, 4, 51),
                            (54, 1, 100),
							(53, 3, 151),
                            (52, 2, 54);
                            
SELECT * FROM productProvider;
