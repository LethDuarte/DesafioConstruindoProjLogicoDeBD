USE ecommerce;

-- Quantos pedidos foram feitos por cada cliente?
SELECT * FROM clients;

SELECT * FROM request;

SELECT concat(Fname, ' ', Lname) as Nome_Completo, CPF, count(idRequest) as Pedidos FROM clients, request GROUP BY Nome_Completo;
SELECT concat(Fname, ' ', Lname) as Nome_Completo, CPF, idRequest as Pedidos FROM clients, request;

-- Algum vendedor também é fornecedor?
SELECT * FROM provider;
SELECT * FROM seller;

SELECT provider.CNPJ as Foncedor, seller.CNPJ as Vendedor FROM provider, seller WHERE provider.CNPJ = seller.CNPJ;

-- Relação de produtos fornecedores e estoques;
SELECT * FROM provider;
SELECT * FROM product;
SELECT * FROM productProvider;

SELECT * FROM stock;
SELECT * FROM productStock;

SELECT CNPJ, ProvRealName, ProdName, concat(stock.Street, ' ', stock.Compl, ' ', stock.District, ' ', stock.City, ' ', stock.State) as Endereço, idStock FROM provider, product, productProvider, stock;


-- Relação de nomes dos fornecedores e nomes dos produtos;
SELECT idProvider, CNPJ, ProvRealName, idPP_Provider, idPP_Product, ProdQuant, ProdName FROM provider, product, productProvider;

