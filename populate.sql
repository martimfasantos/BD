 
---- Categoria ---- 
INSERT INTO categoria VALUES ('Computers');
INSERT INTO categoria VALUES ('Smartphones');
INSERT INTO categoria VALUES ('Violence');
INSERT INTO categoria VALUES ('Lifestyle');
INSERT INTO categoria VALUES ('Filmes');
INSERT INTO categoria VALUES ('Music');
INSERT INTO categoria VALUES ('Pre-cooked');
INSERT INTO categoria VALUES ('Healthy');
INSERT INTO categoria VALUES ('Pet Food');
INSERT INTO categoria VALUES ('Pet Toys');
INSERT INTO categoria VALUES ('Electronics');
INSERT INTO categoria VALUES ('Video Games');
INSERT INTO categoria VALUES ('CDs & Vinyl');
INSERT INTO categoria VALUES ('Food');
INSERT INTO categoria VALUES ('Pet Supplies');
 
---- Categoria Simples ---- 
INSERT INTO categoria_simples VALUES ('Computers');
INSERT INTO categoria_simples VALUES ('Smartphones');
INSERT INTO categoria_simples VALUES ('Violence');
INSERT INTO categoria_simples VALUES ('Lifestyle');
INSERT INTO categoria_simples VALUES ('Filmes');
INSERT INTO categoria_simples VALUES ('Music');
INSERT INTO categoria_simples VALUES ('Pre-cooked');
INSERT INTO categoria_simples VALUES ('Healthy');
INSERT INTO categoria_simples VALUES ('Pet Food');
INSERT INTO categoria_simples VALUES ('Pet Toys');
 
---- Super Categoria ---- 
INSERT INTO super_categoria VALUES ('Electronics');
INSERT INTO super_categoria VALUES ('Video Games');
INSERT INTO super_categoria VALUES ('CDs & Vinyl');
INSERT INTO super_categoria VALUES ('Food');
INSERT INTO super_categoria VALUES ('Pet Supplies');
 
---- tem_outra ---- 
INSERT INTO tem_outra VALUES ('Electronics', 'Computers');
INSERT INTO tem_outra VALUES ('Electronics', 'Smartphones');
INSERT INTO tem_outra VALUES ('Video Games', 'Violence');
INSERT INTO tem_outra VALUES ('Video Games', 'Lifestyle');
INSERT INTO tem_outra VALUES ('CDs & Vinyl', 'Filmes');
INSERT INTO tem_outra VALUES ('CDs & Vinyl', 'Music');
INSERT INTO tem_outra VALUES ('Food', 'Pre-cooked');
INSERT INTO tem_outra VALUES ('Food', 'Healthy');
INSERT INTO tem_outra VALUES ('Pet Supplies', 'Pet Food');
INSERT INTO tem_outra VALUES ('Pet Supplies', 'Pet Toys');
 
---- Produto ---- 
INSERT INTO produto VALUES ('7499448750431', 'Computers', 'The European languages are members of the same family. Their separate existence is a myth. For scien');
INSERT INTO produto VALUES ('8601139975576', 'Smartphones', 'ce, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, ');
INSERT INTO produto VALUES ('4040298751684', 'Violence', 'their pronunciation and their most common words. Everyone realizes why a new common language would b');
INSERT INTO produto VALUES ('6466097307924', 'Lifestyle', 'e desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary t');
INSERT INTO produto VALUES ('3274673078338', 'Filmes', 'o have uniform grammar, pronunciation and more common words. If several languages coalesce, the gram');
INSERT INTO produto VALUES ('8042081738117', 'Music', 'mar of the resulting language is more simple and regular than that of the individual languages. The ');
INSERT INTO produto VALUES ('2662602572197', 'Pre-cooked', 'new common language will be more simple and regular than the existing European languages. It will be as simple as Occide');
INSERT INTO produto VALUES ('4832423897296', 'Healthy', 'ge friend of mine told me what Occidental is.The European languages are members of the same family. Their separate exist');
INSERT INTO produto VALUES ('3651163125788', 'Pet Food', 'mar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: on');
INSERT INTO produto VALUES ('5779017166430', 'Pet Toys', 'Now is the winter of our discontent. Made glorious summer by this sun of York. And all the clouds that lourd upon our house. In the deep bosom of the ocean buried.');
 
---- tem_categoria ---- 
INSERT INTO tem_categoria VALUES ('7499448750431', 'Computers');
INSERT INTO tem_categoria VALUES ('8601139975576', 'Smartphones');
INSERT INTO tem_categoria VALUES ('4040298751684', 'Violence');
INSERT INTO tem_categoria VALUES ('6466097307924', 'Lifestyle');
INSERT INTO tem_categoria VALUES ('3274673078338', 'Filmes');
INSERT INTO tem_categoria VALUES ('8042081738117', 'Music');
INSERT INTO tem_categoria VALUES ('2662602572197', 'Pre-cooked');
INSERT INTO tem_categoria VALUES ('4832423897296', 'Healthy');
INSERT INTO tem_categoria VALUES ('3651163125788', 'Pet Food');
INSERT INTO tem_categoria VALUES ('5779017166430', 'Pet Toys');
 
---- IVM ---- 
INSERT INTO IVM VALUES ('1', 'Walmart Inc.');
INSERT INTO IVM VALUES ('2', 'Amazon.com Inc.');
INSERT INTO IVM VALUES ('3', 'Costco Wholesale Corp.');
INSERT INTO IVM VALUES ('4', 'Walgreens Boots Alliance Inc.');
INSERT INTO IVM VALUES ('5', 'Walmart Inc.');
INSERT INTO IVM VALUES ('6', 'Amazon.com Inc.');
INSERT INTO IVM VALUES ('7', 'Costco Wholesale Corp.');
INSERT INTO IVM VALUES ('8', 'Walgreens Boots Alliance Inc.');
 
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
INSERT INTO instalada_em VALUES ('3', 'Costco Wholesale Corp.', 'Dollar Tree');
INSERT INTO instalada_em VALUES ('4', 'Walgreens Boots Alliance Inc.', 'Ross Stores');
INSERT INTO instalada_em VALUES ('5', 'Walmart Inc.', 'Giant Eagle');
INSERT INTO instalada_em VALUES ('6', 'Amazon.com Inc.', 'AutoZone');
INSERT INTO instalada_em VALUES ('7', 'Costco Wholesale Corp.', 'Giant Food Stores');
INSERT INTO instalada_em VALUES ('8', 'Walgreens Boots Alliance Inc.', 'Primo Space');
 
---- Prateleira ---- 
INSERT INTO prateleira VALUES ('1', '1', 'Walmart Inc.', '0.3', 'Computers');
INSERT INTO prateleira VALUES ('2', '2', 'Amazon.com Inc.', '0.7', 'Smartphones');
INSERT INTO prateleira VALUES ('3', '3', 'Costco Wholesale Corp.', '0.3', 'Violence');
INSERT INTO prateleira VALUES ('4', '4', 'Walgreens Boots Alliance Inc.', '0.7', 'Lifestyle');
INSERT INTO prateleira VALUES ('5', '5', 'Walmart Inc.', '0.3', 'Filmes');
INSERT INTO prateleira VALUES ('6', '6', 'Amazon.com Inc.', '0.7', 'Music');
INSERT INTO prateleira VALUES ('7', '7', 'Costco Wholesale Corp.', '0.3', 'Pre-cooked');
INSERT INTO prateleira VALUES ('8', '8', 'Walgreens Boots Alliance Inc.', '0.7', 'Healthy');
INSERT INTO prateleira VALUES ('9', '1', 'Walmart Inc.', '0.3', 'Pet Food');
INSERT INTO prateleira VALUES ('10', '2', 'Amazon.com Inc.', '0.7', 'Pet Toys');
 
---- Planograma ---- 
INSERT INTO planograma VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '3', '100', 'loc1');
INSERT INTO planograma VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '4', '30', 'loc2');
INSERT INTO planograma VALUES ('4040298751684', '3', '3', 'Costco Wholesale Corp.', '7', '45', 'loc3');
INSERT INTO planograma VALUES ('6466097307924', '4', '4', 'Walgreens Boots Alliance Inc.', '10', '9', 'loc4');
INSERT INTO planograma VALUES ('3274673078338', '5', '5', 'Walmart Inc.', '2', '40', 'loc5');
INSERT INTO planograma VALUES ('8042081738117', '6', '6', 'Amazon.com Inc.', '9', '55', 'loc1');
INSERT INTO planograma VALUES ('2662602572197', '7', '7', 'Costco Wholesale Corp.', '4', '23', 'loc2');
INSERT INTO planograma VALUES ('4832423897296', '8', '8', 'Walgreens Boots Alliance Inc.', '5', '45', 'loc3');
INSERT INTO planograma VALUES ('3651163125788', '9', '1', 'Walmart Inc.', '1', '86', 'loc4');
INSERT INTO planograma VALUES ('5779017166430', '10', '2', 'Amazon.com Inc.', '1', '10', 'loc5');
 
---- Retalhista ---- 
INSERT INTO retalhista VALUES ('257399892', 'Verizon Wireless');
INSERT INTO retalhista VALUES ('257399823', 'Kohls');
INSERT INTO retalhista VALUES ('257391213', 'Dollar General');
INSERT INTO retalhista VALUES ('257199892', 'Sears Holdings');
INSERT INTO retalhista VALUES ('257399456', 'Menard');
 
---- responsavel_por ---- 
INSERT INTO responsavel_por VALUES ('Computers', '257399892', '1', 'Walmart Inc.');
INSERT INTO responsavel_por VALUES ('Smartphones', '257399823', '2', 'Amazon.com Inc.');
INSERT INTO responsavel_por VALUES ('Violence', '257391213', '3', 'Costco Wholesale Corp.');
INSERT INTO responsavel_por VALUES ('Lifestyle', '257199892', '4', 'Walgreens Boots Alliance Inc.');
INSERT INTO responsavel_por VALUES ('Filmes', '257399456', '5', 'Walmart Inc.');
 
---- Evento de Reposicao ---- 
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2005-12-21 21:35:14', '90', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2005-12-21 21:35:14', '90', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Costco Wholesale Corp.', '2005-12-21 21:35:14', '90', '257391213');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Walgreens Boots Alliance Inc.', '2005-12-21 21:35:14', '90', '257199892');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '5', 'Walmart Inc.', '2005-12-21 21:35:14', '90', '257399456');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '6', 'Amazon.com Inc.', '2005-12-21 21:35:14', '90', '257399892');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '7', 'Costco Wholesale Corp.', '2005-12-21 21:35:14', '90', '257399823');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '8', 'Walgreens Boots Alliance Inc.', '2005-12-21 21:35:14', '90', '257391213');
INSERT INTO evento_reposicao VALUES ('3651163125788', '9', '1', 'Walmart Inc.', '2005-12-21 21:35:14', '90', '257199892');
INSERT INTO evento_reposicao VALUES ('5779017166430', '10', '2', 'Amazon.com Inc.', '2005-12-21 21:35:14', '90', '257399456');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2011-06-22 00:49:08', '50', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2011-06-22 00:49:08', '50', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Costco Wholesale Corp.', '2011-06-22 00:49:08', '50', '257391213');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Walgreens Boots Alliance Inc.', '2011-06-22 00:49:08', '50', '257199892');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '5', 'Walmart Inc.', '2011-06-22 00:49:08', '50', '257399456');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '6', 'Amazon.com Inc.', '2011-06-22 00:49:08', '50', '257399892');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '7', 'Costco Wholesale Corp.', '2011-06-22 00:49:08', '50', '257399823');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '8', 'Walgreens Boots Alliance Inc.', '2011-06-22 00:49:08', '50', '257391213');
INSERT INTO evento_reposicao VALUES ('3651163125788', '9', '1', 'Walmart Inc.', '2011-06-22 00:49:08', '50', '257199892');
INSERT INTO evento_reposicao VALUES ('5779017166430', '10', '2', 'Amazon.com Inc.', '2011-06-22 00:49:08', '50', '257399456');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2004-04-17 04:56:05', '42', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2004-04-17 04:56:05', '42', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Costco Wholesale Corp.', '2004-04-17 04:56:05', '42', '257391213');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Walgreens Boots Alliance Inc.', '2004-04-17 04:56:05', '42', '257199892');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '5', 'Walmart Inc.', '2004-04-17 04:56:05', '42', '257399456');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '6', 'Amazon.com Inc.', '2004-04-17 04:56:05', '42', '257399892');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '7', 'Costco Wholesale Corp.', '2004-04-17 04:56:05', '42', '257399823');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '8', 'Walgreens Boots Alliance Inc.', '2004-04-17 04:56:05', '42', '257391213');
INSERT INTO evento_reposicao VALUES ('3651163125788', '9', '1', 'Walmart Inc.', '2004-04-17 04:56:05', '42', '257199892');
INSERT INTO evento_reposicao VALUES ('5779017166430', '10', '2', 'Amazon.com Inc.', '2004-04-17 04:56:05', '42', '257399456');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2008-10-14 20:56:26', '6', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2008-10-14 20:56:26', '6', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Costco Wholesale Corp.', '2008-10-14 20:56:26', '6', '257391213');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Walgreens Boots Alliance Inc.', '2008-10-14 20:56:26', '6', '257199892');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '5', 'Walmart Inc.', '2008-10-14 20:56:26', '6', '257399456');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '6', 'Amazon.com Inc.', '2008-10-14 20:56:26', '6', '257399892');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '7', 'Costco Wholesale Corp.', '2008-10-14 20:56:26', '6', '257399823');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '8', 'Walgreens Boots Alliance Inc.', '2008-10-14 20:56:26', '6', '257391213');
INSERT INTO evento_reposicao VALUES ('3651163125788', '9', '1', 'Walmart Inc.', '2008-10-14 20:56:26', '6', '257199892');
INSERT INTO evento_reposicao VALUES ('5779017166430', '10', '2', 'Amazon.com Inc.', '2008-10-14 20:56:26', '6', '257399456');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2012-07-22 14:26:25', '78', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2012-07-22 14:26:25', '78', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Costco Wholesale Corp.', '2012-07-22 14:26:25', '78', '257391213');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Walgreens Boots Alliance Inc.', '2012-07-22 14:26:25', '78', '257199892');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '5', 'Walmart Inc.', '2012-07-22 14:26:25', '78', '257399456');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '6', 'Amazon.com Inc.', '2012-07-22 14:26:25', '78', '257399892');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '7', 'Costco Wholesale Corp.', '2012-07-22 14:26:25', '78', '257399823');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '8', 'Walgreens Boots Alliance Inc.', '2012-07-22 14:26:25', '78', '257391213');
INSERT INTO evento_reposicao VALUES ('3651163125788', '9', '1', 'Walmart Inc.', '2012-07-22 14:26:25', '78', '257199892');
INSERT INTO evento_reposicao VALUES ('5779017166430', '10', '2', 'Amazon.com Inc.', '2012-07-22 14:26:25', '78', '257399456');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2020-12-08 02:04:03', '34', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2020-12-08 02:04:03', '34', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Costco Wholesale Corp.', '2020-12-08 02:04:03', '34', '257391213');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Walgreens Boots Alliance Inc.', '2020-12-08 02:04:03', '34', '257199892');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '5', 'Walmart Inc.', '2020-12-08 02:04:03', '34', '257399456');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '6', 'Amazon.com Inc.', '2020-12-08 02:04:03', '34', '257399892');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '7', 'Costco Wholesale Corp.', '2020-12-08 02:04:03', '34', '257399823');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '8', 'Walgreens Boots Alliance Inc.', '2020-12-08 02:04:03', '34', '257391213');
INSERT INTO evento_reposicao VALUES ('3651163125788', '9', '1', 'Walmart Inc.', '2020-12-08 02:04:03', '34', '257199892');
INSERT INTO evento_reposicao VALUES ('5779017166430', '10', '2', 'Amazon.com Inc.', '2020-12-08 02:04:03', '34', '257399456');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2008-11-06 22:51:13', '21', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2008-11-06 22:51:13', '21', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Costco Wholesale Corp.', '2008-11-06 22:51:13', '21', '257391213');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Walgreens Boots Alliance Inc.', '2008-11-06 22:51:13', '21', '257199892');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '5', 'Walmart Inc.', '2008-11-06 22:51:13', '21', '257399456');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '6', 'Amazon.com Inc.', '2008-11-06 22:51:13', '21', '257399892');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '7', 'Costco Wholesale Corp.', '2008-11-06 22:51:13', '21', '257399823');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '8', 'Walgreens Boots Alliance Inc.', '2008-11-06 22:51:13', '21', '257391213');
INSERT INTO evento_reposicao VALUES ('3651163125788', '9', '1', 'Walmart Inc.', '2008-11-06 22:51:13', '21', '257199892');
INSERT INTO evento_reposicao VALUES ('5779017166430', '10', '2', 'Amazon.com Inc.', '2008-11-06 22:51:13', '21', '257399456');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2020-11-19 11:22:06', '44', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2020-11-19 11:22:06', '44', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Costco Wholesale Corp.', '2020-11-19 11:22:06', '44', '257391213');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Walgreens Boots Alliance Inc.', '2020-11-19 11:22:06', '44', '257199892');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '5', 'Walmart Inc.', '2020-11-19 11:22:06', '44', '257399456');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '6', 'Amazon.com Inc.', '2020-11-19 11:22:06', '44', '257399892');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '7', 'Costco Wholesale Corp.', '2020-11-19 11:22:06', '44', '257399823');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '8', 'Walgreens Boots Alliance Inc.', '2020-11-19 11:22:06', '44', '257391213');
INSERT INTO evento_reposicao VALUES ('3651163125788', '9', '1', 'Walmart Inc.', '2020-11-19 11:22:06', '44', '257199892');
INSERT INTO evento_reposicao VALUES ('5779017166430', '10', '2', 'Amazon.com Inc.', '2020-11-19 11:22:06', '44', '257399456');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2020-11-17 00:05:11', '79', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2020-11-17 00:05:11', '79', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Costco Wholesale Corp.', '2020-11-17 00:05:11', '79', '257391213');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Walgreens Boots Alliance Inc.', '2020-11-17 00:05:11', '79', '257199892');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '5', 'Walmart Inc.', '2020-11-17 00:05:11', '79', '257399456');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '6', 'Amazon.com Inc.', '2020-11-17 00:05:11', '79', '257399892');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '7', 'Costco Wholesale Corp.', '2020-11-17 00:05:11', '79', '257399823');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '8', 'Walgreens Boots Alliance Inc.', '2020-11-17 00:05:11', '79', '257391213');
INSERT INTO evento_reposicao VALUES ('3651163125788', '9', '1', 'Walmart Inc.', '2020-11-17 00:05:11', '79', '257199892');
INSERT INTO evento_reposicao VALUES ('5779017166430', '10', '2', 'Amazon.com Inc.', '2020-11-17 00:05:11', '79', '257399456');
INSERT INTO evento_reposicao VALUES ('7499448750431', '1', '1', 'Walmart Inc.', '2010-05-28 06:02:49', '8', '257399892');
INSERT INTO evento_reposicao VALUES ('8601139975576', '2', '2', 'Amazon.com Inc.', '2010-05-28 06:02:49', '8', '257399823');
INSERT INTO evento_reposicao VALUES ('4040298751684', '3', '3', 'Costco Wholesale Corp.', '2010-05-28 06:02:49', '8', '257391213');
INSERT INTO evento_reposicao VALUES ('6466097307924', '4', '4', 'Walgreens Boots Alliance Inc.', '2010-05-28 06:02:49', '8', '257199892');
INSERT INTO evento_reposicao VALUES ('3274673078338', '5', '5', 'Walmart Inc.', '2010-05-28 06:02:49', '8', '257399456');
INSERT INTO evento_reposicao VALUES ('8042081738117', '6', '6', 'Amazon.com Inc.', '2010-05-28 06:02:49', '8', '257399892');
INSERT INTO evento_reposicao VALUES ('2662602572197', '7', '7', 'Costco Wholesale Corp.', '2010-05-28 06:02:49', '8', '257399823');
INSERT INTO evento_reposicao VALUES ('4832423897296', '8', '8', 'Walgreens Boots Alliance Inc.', '2010-05-28 06:02:49', '8', '257391213');
INSERT INTO evento_reposicao VALUES ('3651163125788', '9', '1', 'Walmart Inc.', '2010-05-28 06:02:49', '8', '257199892');
INSERT INTO evento_reposicao VALUES ('5779017166430', '10', '2', 'Amazon.com Inc.', '2010-05-28 06:02:49', '8', '257399456');
