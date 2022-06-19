
import random
import sys

tabela = ["categoria", "categoria_simples", "super_categoria", "tem_outra", "produto", "tem_categoria", "IVM","ponto_de_retalho","instalada_em","prateleira", "planograma", "retalhista", "responsavel_por", "evento_reposicao"]

super_categoria = ["Electronics", "Video Games", "CDs & Vinyl", "Food", "Pet Supplies"]
categoria_simples = ["Computers", "Smartphones", "Violence", "Lifestyle", "Filmes", "Music", "Pre-cooked", "Healthy", "Pet Food", "Pet Toys"]

# Produtos (10)
ean = ["7499448750431", "8601139975576", "4040298751684", "6466097307924" , "3274673078338" , "8042081738117", "2662602572197", "4832423897296" , "3651163125788" , "5779017166430" ]
descr = ["The European languages are members of the same family. Their separate existence is a myth. For scien",
        "ce, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, ",
        "their pronunciation and their most common words. Everyone realizes why a new common language would b",
        "e desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary t",
        "o have uniform grammar, pronunciation and more common words. If several languages coalesce, the gram",
        "mar of the resulting language is more simple and regular than that of the individual languages. The ",
        "new common language will be more simple and regular than the existing European languages. It will be as simple as Occide",
        "ge friend of mine told me what Occidental is.The European languages are members of the same family. Their separate exist",
        "mar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: on",
        "Now is the winter of our discontent. Made glorious summer by this sun of York. And all the clouds that lour'd upon our house. In the deep bosom of the ocean buried.",
        "I, that am rudely stamp'd, and want love's majesty. To strut before a wanton ambling nymph; I, that am curtail'd of this fair proportion,",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam at nisl diam. Vestibulum malesuada justo a dui consectetur malesuada."]

# IVMs (8)
num_serie = ["Ti7qtULz", "mnmDXFPUk", "VciCY2S", "Np2vty4", "x7wtnVNkL", "DTYURRKH", "MViAm8bM", "REhxLwu4"]
fabricante = ["Walmart Inc.", "Amazon.com Inc.", "Costco Wholesale Corp.", "Walgreens Boots Alliance Inc."]

# Pontos de retalho (6)
ponto_de_retalho = ["Giant Food Stores", "Primo Space" ]
distrito = ["Lisboa", "Faro"]
concelho = ["Lisboa", "Albufeira", "Cascais", "Portimao"]

# Prateleiras (10)
nro = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
altura = ["0.3", "0.7"]

# Planograma (10)
faces = [3, 4, 7, 10, 2, 9, 4, 5, 1, 1]
unidades = [100, 30, 45, 9, 40, 55, 23, 45, 86, 10]
loc = ["loc1", "loc2", "loc3", "loc4", "loc5"]

# Retalhista (5)
tin = ["257399892", "257399823", "257391213", "257199892", "257399456"]
retalhista = ["Verizon Wireless", "Kohl's", "Dollar General", "Sears Holdings", "Menard"]

# Evento de Reposição (20)
instante = ["2005-12-21 21:35:14", "2011-06-22 00:49:08", "2004-04-17 04:56:05", "2008-10-14 20:56:26", "2012-07-22 14:26:25", "2020-12-08 02:04:03", "2008-11-06 22:51:13", "2020-11-19 11:22:06", "2020-11-17 00:05:11", "2010-05-28 06:02:49"]
unidadesE = [90, 50, 42, 6, 78, 34, 21, 44, 79, 8]



f = open("populate.sql", "w")
sys.stdout = f 

print(" \n---- Categoria ---- ")
categoria = categoria_simples + super_categoria
for i in range(15):
    print("INSERT INTO categoria VALUES (\"{nome}\")".format(nome = categoria[i]))

print(" \n---- Categoria Simples ---- ")
for i in range(10):
    print("INSERT INTO categoria_simples VALUES (\"{nome}\")".format(nome = categoria_simples[i]))

print(" \n---- Super Categoria ---- ")
for i in range(5):
    print("INSERT INTO super_categoria VALUES (\"{nome}\")".format(nome = super_categoria[i]))

print(" \n---- tem_outra ---- ")
for i in range(10):
    print("INSERT INTO tem_outra VALUES (\"{super_categoria}\", \"{categoria_simples}\")".format(   super_categoria = super_categoria[int(i/2)],
                                                                                                    categoria_simples = categoria_simples[i]    ))

print(" \n---- Super Categoria ---- ")
for i in range(5):
    print("INSERT INTO super_categoria VALUES (\"{nome}\")".format(nome = super_categoria[i]))

print(" \n---- Produto ---- ")
for i in range(10):
    print("INSERT INTO produto VALUES (\"{ean}\", \"{cat}\", \"{descr}\")".format(  ean = ean[i],
                                                                                    cat = categoria_simples[i],
                                                                                    descr = descr[i]    ))

print(" \n---- tem_categoria ---- ")
for i in range(10):
    print("INSERT INTO tem_categoria VALUES (\"{ean}\", \"{nome}\")".format(    ean = ean[i],
                                                                                nome = categoria_simples[i]     ))

print(" \n---- IVM ---- ")
for i in range(8):
    print("INSERT INTO IVM VALUES (\"{num_serie}\", \"{fabricante}\")".format(  num_serie = num_serie[i],
                                                                                fabricante = fabricante[i%len(fabricante)]  ))
                                                        
print(" \n---- Ponto de Retalho ---- ")
for i in range(6):
    print("INSERT INTO ponto_de_retalho VALUES (\"{nome}\", \"{distrito}\", \"{concelho}\")".format(    nome = ponto_de_retalho[i%len(ponto_de_retalho)],
                                                                                                        distrito = distrito[i%len(distrito)],
                                                                                                        concelho = concelho[i%len(concelho)]    ))

print(" \n---- instalada_em ---- ")
for i in range(8):
    print("INSERT INTO instalada_em VALUES (\"{num_serie}\", \"{fabricante}\", \"{local}\")".format(    num_serie = num_serie[i],
                                                                                                        fabricante = fabricante[i%len(fabricante)],
                                                                                                        local = ponto_de_retalho[i%len(ponto_de_retalho)]   ))

print(" \n---- Prateleira ---- ")
for i in range(10):
    print("INSERT INTO prateleira VALUES (\"{nro}\", \"{num_serie}\", \"{fabricante}\", \"{altura}\", \"{nome}\")".format(  nro = nro[i],
                                                                                                                            num_serie = num_serie[i%len(num_serie)],
                                                                                                                            fabricante = fabricante[i%len(fabricante)],
                                                                                                                            altura = altura[i%len(altura)],
                                                                                                                            nome = categoria_simples[i]     ))

print(" \n---- Planograma ---- ")
for i in range(10):
    print("INSERT INTO planograma VALUES (\"{ean}\", \"{nro}\", \"{num_serie}\", \"{fabricante}\", \"{faces}\", \"{unidades}\", \"{loc}\")".format( ean = ean[i],
                                                                                                                                                    nro = nro[i],
                                                                                                                                                    num_serie = num_serie[i%len(num_serie)],
                                                                                                                                                    fabricante = fabricante[i%len(fabricante)],
                                                                                                                                                    faces = faces[i%len(faces)],
                                                                                                                                                    unidades = unidades[i%len(unidades)],
                                                                                                                                                    loc = loc[i%len(loc)]   ))

print(" \n---- Retalhista ---- ")
for i in range(5):
    print("INSERT INTO retalhista VALUES (\"{tin}\", \"{nome}\")".format(   tin = tin[i],
                                                                            nome = retalhista[i]    ))

print(" \n---- responsavel_por ---- ")
for i in range(5):
    print("INSERT INTO responsavel_por VALUES (\"{nome_cat}\", \"{tin}\", \"{num_serie}\", \"{fabricante}\")".format(   nome_cat = categoria_simples[i],
                                                                                                                        tin = tin[i],
                                                                                                                        num_serie = num_serie[i%len(num_serie)],
                                                                                                                        fabricante = fabricante[i%len(fabricante)]  ))

print(" \n---- Evento de Reposicao ---- ")
for i in range(20):
    for j in range(10):
        print("INSERT INTO evento_reposicao VALUES (\"{ean}\", \"{nro}\", \"{num_serie}\", \"{fabricante}\", \"{instante}\", \"{unidades}\", \"{tin}\")".format(    ean = ean[i%len(ean)],
                                                                                                                                                                    nro = nro[j],
                                                                                                                                                                    num_serie = num_serie[i%len(num_serie)],
                                                                                                                                                                    fabricante = fabricante[i%len(fabricante)],
                                                                                                                                                                    instante = instante[j%len(instante)],
                                                                                                                                                                    unidades = unidadesE[j%len(unidadesE)],
                                                                                                                                                                    tin = tin[i%len(tin)]   ))
