 
---- Categoria ---- 
INSERT INTO categoria VALUES ('Computers');
INSERT INTO categoria VALUES ('Smartphones');
INSERT INTO categoria VALUES ('Pre-cooked Meals');
INSERT INTO categoria VALUES ('Healthy');
INSERT INTO categoria VALUES ('Powders');
INSERT INTO categoria VALUES ('Energy Drinks');
INSERT INTO categoria VALUES ('Electronics');
INSERT INTO categoria VALUES ('Food');
INSERT INTO categoria VALUES ('Supplements');
 
---- Categoria Simples ---- 
INSERT INTO categoria_simples VALUES ('Computers');
INSERT INTO categoria_simples VALUES ('Smartphones');
INSERT INTO categoria_simples VALUES ('Pre-cooked Meals');
INSERT INTO categoria_simples VALUES ('Healthy');
INSERT INTO categoria_simples VALUES ('Powders');
INSERT INTO categoria_simples VALUES ('Energy Drinks');
 
---- Super Categoria ---- 
INSERT INTO super_categoria VALUES ('Electronics');
INSERT INTO super_categoria VALUES ('Food');
INSERT INTO super_categoria VALUES ('Supplements');
 
---- tem_outra ---- 
INSERT INTO tem_outra VALUES ('Electronics', 'Computers');
INSERT INTO tem_outra VALUES ('Electronics', 'Smartphones');
INSERT INTO tem_outra VALUES ('Food', 'Pre-cooked Meals');
INSERT INTO tem_outra VALUES ('Food', 'Healthy');
INSERT INTO tem_outra VALUES ('Supplements', 'Powders');
INSERT INTO tem_outra VALUES ('Supplements', 'Energy Drinks');
 
---- Produto ---- 
INSERT INTO produto VALUES ('7499448750431', 'Computers', 'DELL');
INSERT INTO produto VALUES ('8601139975576', 'Smartphones', 'Nokia');
INSERT INTO produto VALUES ('4040298751684', 'Pre-cooked Meals', 'Hamburguer');
INSERT INTO produto VALUES ('6466097307924', 'Healthy', 'Salad');
INSERT INTO produto VALUES ('3274673078338', 'Powders', 'Whey Protein');
INSERT INTO produto VALUES ('8042081738117', 'Energy Drinks', 'Red Bull');
INSERT INTO produto VALUES ('2662602572197', 'Computers', 'Mac');
INSERT INTO produto VALUES ('4832423897296', 'Smartphones', 'iPhone');
 
---- tem_categoria ---- 
INSERT INTO tem_categoria VALUES ('7499448750431', 'Computers');
INSERT INTO tem_categoria VALUES ('8601139975576', 'Smartphones');
INSERT INTO tem_categoria VALUES ('4040298751684', 'Pre-cooked Meals');
INSERT INTO tem_categoria VALUES ('6466097307924', 'Healthy');
INSERT INTO tem_categoria VALUES ('3274673078338', 'Powders');
INSERT INTO tem_categoria VALUES ('8042081738117', 'Energy Drinks');
INSERT INTO tem_categoria VALUES ('2662602572197', 'Computers');
INSERT INTO tem_categoria VALUES ('4832423897296', 'Smartphones');
 
---- IVM ---- 
INSERT INTO IVM VALUES ('1', 'Walmart Inc.');
INSERT INTO IVM VALUES ('2', 'Amazon.com Inc.');
INSERT INTO IVM VALUES ('3', 'Walmart Inc.');
INSERT INTO IVM VALUES ('4', 'Amazon.com Inc.');
 
---- Ponto de Retalho ---- 
INSERT INTO ponto_de_retalho VALUES ('Giant Food Stores', 'Lisboa', 'Lisboa');
INSERT INTO ponto_de_retalho VALUES ('Primo Space', 'Faro', 'Albufeira');
INSERT INTO ponto_de_retalho VALUES ('Dollar Tree', 'Lisboa', 'Cascais');
INSERT INTO ponto_de_retalho VALUES ('Ross Stores', 'Faro', 'Portimao');
INSERT INTO ponto_de_retalho VALUES ('Giant Eagle', 'Lisboa', 'Lisboa');
INSERT INTO ponto_de_retalho VALUES ('AutoZone', 'Faro', 'Albufeira');
 
---- instalada_em ---- 
INSERT INTO instalada_em VALUES ('1', 'Walmart Inc.', 'Giant Food Stores');
INSERT INTO instalada_em VALUES ('2', 'Amazon.com Inc.', 'Primo Space');
INSERT INTO instalada_em VALUES ('3', 'Walmart Inc.', 'Dollar Tree');
INSERT INTO instalada_em VALUES ('4', 'Amazon.com Inc.', 'Ross Stores');
 
---- Prateleira ---- 
INSERT INTO prateleira VALUES ('1', '1', 'Walmart Inc.', '0.3', 'Computers');
INSERT INTO prateleira VALUES ('2', '2', 'Amazon.com Inc.', '0.7', 'Smartphones');
INSERT INTO prateleira VALUES ('3', '3', 'Walmart Inc.', '0.3', 'Pre-cooked Meals');
INSERT INTO prateleira VALUES ('4', '4', 'Amazon.com Inc.', '0.7', 'Healthy');
INSERT INTO prateleira VALUES ('5', '1', 'Walmart Inc.', '0.3', 'Powders');
INSERT INTO prateleira VALUES ('6', '2', 'Amazon.com Inc.', '0.7', 'Energy Drinks');
INSERT INTO prateleira VALUES ('7', '3', 'Walmart Inc.', '0.3', 'Computers');
INSERT INTO prateleira VALUES ('8', '4', 'Amazon.com Inc.', '0.7', 'Smartphones');
 
---- Planograma ---- 
INSERT INTO planograma VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '3', '100', 'loc1');
INSERT INTO planograma VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '4', '59', 'loc2');
INSERT INTO planograma VALUES ('4040298751684', '3', '3', 'Walmart Inc.', '7', '45', 'loc3');
INSERT INTO planograma VALUES ('6466097307924', '4', '4', 'Amazon.com Inc.', '10', '44', 'loc4');
INSERT INTO planograma VALUES ('3274673078338', '5', '1', 'Walmart Inc.', '2', '40', 'loc1');
INSERT INTO planograma VALUES ('8042081738117', '6', '2', 'Amazon.com Inc.', '9', '55', 'loc2');
INSERT INTO planograma VALUES ('2662602572197', '7', '3', 'Walmart Inc.', '4', '23', 'loc3');
INSERT INTO planograma VALUES ('4832423897296', '8', '4', 'Amazon.com Inc.', '5', '45', 'loc4');
 
---- Retalhista ---- 
INSERT INTO retalhista VALUES ('257399892', 'Michael Jackson');
INSERT INTO retalhista VALUES ('257399823', 'Johnny Sins');
 
---- responsavel_por ---- 
INSERT INTO responsavel_por VALUES ('Computers', '257399892', '1', 'Walmart Inc.');
INSERT INTO responsavel_por VALUES ('Smartphones', '257399823', '2', 'Amazon.com Inc.');
 
---- Evento de Reposicao ---- 
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2005-12-21 21:35:14', '43', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2005-12-21 21:35:14', '43', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Walmart Inc.', '2005-12-21 21:35:14', '43', '257399892');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Amazon.com Inc.', '2005-12-21 21:35:14', '43', '257399823');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '1', 'Walmart Inc.', '2005-12-21 21:35:14', '43', '257399892');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '2', 'Amazon.com Inc.', '2005-12-21 21:35:14', '43', '257399823');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '3', 'Walmart Inc.', '2005-12-21 21:35:14', '43', '257399892');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '4', 'Amazon.com Inc.', '2005-12-21 21:35:14', '43', '257399823');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2011-06-22 00:49:08', '23', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2011-06-22 00:49:08', '23', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Walmart Inc.', '2011-06-22 00:49:08', '23', '257399892');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Amazon.com Inc.', '2011-06-22 00:49:08', '23', '257399823');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '1', 'Walmart Inc.', '2011-06-22 00:49:08', '23', '257399892');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '2', 'Amazon.com Inc.', '2011-06-22 00:49:08', '23', '257399823');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '3', 'Walmart Inc.', '2011-06-22 00:49:08', '23', '257399892');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '4', 'Amazon.com Inc.', '2011-06-22 00:49:08', '23', '257399823');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2004-04-17 04:56:05', '42', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2004-04-17 04:56:05', '42', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Walmart Inc.', '2004-04-17 04:56:05', '42', '257399892');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Amazon.com Inc.', '2004-04-17 04:56:05', '42', '257399823');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '1', 'Walmart Inc.', '2004-04-17 04:56:05', '42', '257399892');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '2', 'Amazon.com Inc.', '2004-04-17 04:56:05', '42', '257399823');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '3', 'Walmart Inc.', '2004-04-17 04:56:05', '42', '257399892');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '4', 'Amazon.com Inc.', '2004-04-17 04:56:05', '42', '257399823');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2008-10-14 20:56:26', '6', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2008-10-14 20:56:26', '6', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Walmart Inc.', '2008-10-14 20:56:26', '6', '257399892');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Amazon.com Inc.', '2008-10-14 20:56:26', '6', '257399823');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '1', 'Walmart Inc.', '2008-10-14 20:56:26', '6', '257399892');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '2', 'Amazon.com Inc.', '2008-10-14 20:56:26', '6', '257399823');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '3', 'Walmart Inc.', '2008-10-14 20:56:26', '6', '257399892');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '4', 'Amazon.com Inc.', '2008-10-14 20:56:26', '6', '257399823');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2012-07-22 14:26:25', '28', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2012-07-22 14:26:25', '28', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Walmart Inc.', '2012-07-22 14:26:25', '28', '257399892');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Amazon.com Inc.', '2012-07-22 14:26:25', '28', '257399823');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '1', 'Walmart Inc.', '2012-07-22 14:26:25', '28', '257399892');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '2', 'Amazon.com Inc.', '2012-07-22 14:26:25', '28', '257399823');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '3', 'Walmart Inc.', '2012-07-22 14:26:25', '28', '257399892');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '4', 'Amazon.com Inc.', '2012-07-22 14:26:25', '28', '257399823');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2020-12-08 02:04:03', '34', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2020-12-08 02:04:03', '34', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Walmart Inc.', '2020-12-08 02:04:03', '34', '257399892');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Amazon.com Inc.', '2020-12-08 02:04:03', '34', '257399823');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '1', 'Walmart Inc.', '2020-12-08 02:04:03', '34', '257399892');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '2', 'Amazon.com Inc.', '2020-12-08 02:04:03', '34', '257399823');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '3', 'Walmart Inc.', '2020-12-08 02:04:03', '34', '257399892');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '4', 'Amazon.com Inc.', '2020-12-08 02:04:03', '34', '257399823');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2008-11-06 22:51:13', '21', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2008-11-06 22:51:13', '21', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Walmart Inc.', '2008-11-06 22:51:13', '21', '257399892');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Amazon.com Inc.', '2008-11-06 22:51:13', '21', '257399823');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '1', 'Walmart Inc.', '2008-11-06 22:51:13', '21', '257399892');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '2', 'Amazon.com Inc.', '2008-11-06 22:51:13', '21', '257399823');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '3', 'Walmart Inc.', '2008-11-06 22:51:13', '21', '257399892');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '4', 'Amazon.com Inc.', '2008-11-06 22:51:13', '21', '257399823');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2020-11-19 11:22:06', '44', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2020-11-19 11:22:06', '44', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Walmart Inc.', '2020-11-19 11:22:06', '44', '257399892');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Amazon.com Inc.', '2020-11-19 11:22:06', '44', '257399823');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '1', 'Walmart Inc.', '2020-11-19 11:22:06', '44', '257399892');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '2', 'Amazon.com Inc.', '2020-11-19 11:22:06', '44', '257399823');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '3', 'Walmart Inc.', '2020-11-19 11:22:06', '44', '257399892');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '4', 'Amazon.com Inc.', '2020-11-19 11:22:06', '44', '257399823');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2020-11-17 00:05:11', '10', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2020-11-17 00:05:11', '10', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Walmart Inc.', '2020-11-17 00:05:11', '10', '257399892');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Amazon.com Inc.', '2020-11-17 00:05:11', '10', '257399823');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '1', 'Walmart Inc.', '2020-11-17 00:05:11', '10', '257399892');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '2', 'Amazon.com Inc.', '2020-11-17 00:05:11', '10', '257399823');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '3', 'Walmart Inc.', '2020-11-17 00:05:11', '10', '257399892');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '4', 'Amazon.com Inc.', '2020-11-17 00:05:11', '10', '257399823');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2010-05-28 06:02:49', '8', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2010-05-28 06:02:49', '8', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Walmart Inc.', '2010-05-28 06:02:49', '8', '257399892');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Amazon.com Inc.', '2010-05-28 06:02:49', '8', '257399823');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '1', 'Walmart Inc.', '2010-05-28 06:02:49', '8', '257399892');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '2', 'Amazon.com Inc.', '2010-05-28 06:02:49', '8', '257399823');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '3', 'Walmart Inc.', '2010-05-28 06:02:49', '8', '257399892');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '4', 'Amazon.com Inc.', '2010-05-28 06:02:49', '8', '257399823');
