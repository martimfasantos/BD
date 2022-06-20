import random
import sys

tabela = ["categoria", "categoria_simples", "super_categoria", "tem_outra", "produto", "tem_categoria", "IVM","ponto_de_retalho","instalada_em","prateleira", "planograma", "retalhista", "responsavel_por", "evento_reposicao"]

super_categoria = ["Electronics", "Food", "Supplements"]
categoria_simples = ["Computers", "Smartphones", "Pre-cooked Meals", "Healthy", "Powders", "Energy Drinks"]

# Produtos (8)
ean = ["7499448750431", "8601139975576", "4040298751684", "6466097307924" , "3274673078338" , "8042081738117", "2662602572197", "4832423897296" ]
descr = ["DELL", "Nokia", "Hamburguer", "Salad", "Whey Protein", "Red Bull", "Mac", "iPhone"]

# IVMs (4)
num_serie = [1, 2, 3, 4]
fabricante = ["Walmart Inc.", "Amazon.com Inc."]

# Pontos de retalho (6)
ponto_de_retalho = ["Giant Food Stores", "Primo Space", "Dollar Tree", "Ross Stores", "Giant Eagle", "AutoZone" ]
distrito = ["Lisboa", "Faro"]
concelho = ["Lisboa", "Albufeira", "Cascais", "Portimao"]

# Prateleiras (8)
nro = [1, 2, 3, 4, 5, 6, 7, 8]
altura = ["0.3", "0.7"]

# Planograma (8)
faces = [3, 4, 7, 10, 2, 9, 4, 5]
unidades = [100, 59, 45, 44, 40, 55, 23, 45]
loc = ["loc1", "loc2", "loc3", "loc4"]

# Retalhista (2)
tin = ["257399892", "257399823"]
retalhista = ["Michael Jackson", "Johnny Sins"]

# Evento de Reposição (80)
instante = ["2005-12-21 21:35:14", "2011-06-22 00:49:08", "2004-04-17 04:56:05", "2008-10-14 20:56:26", "2012-07-22 14:26:25", "2020-12-08 02:04:03", "2008-11-06 22:51:13", "2020-11-19 11:22:06", "2020-11-17 00:05:11", "2010-05-28 06:02:49"]
unidadesE = [43, 23, 42, 6, 28, 34, 21, 44, 10, 8]



f = open("populate.sql", "w")
sys.stdout = f 

print(' \n---- Categoria ---- ')
categoria = categoria_simples + super_categoria
for i in range(len(categoria)):
    print('INSERT INTO categoria VALUES (\'{nome}\');'.format(nome = categoria[i]))

print(' \n---- Categoria Simples ---- ')
for i in range(len(categoria_simples)):
    print('INSERT INTO categoria_simples VALUES (\'{nome}\');'.format(nome = categoria_simples[i]))

print(' \n---- Super Categoria ---- ')
for i in range(len(super_categoria)):
    print('INSERT INTO super_categoria VALUES (\'{nome}\');'.format(nome = super_categoria[i]))

print(' \n---- tem_outra ---- ')
for i in range(len(categoria_simples)):
    print('INSERT INTO tem_outra VALUES (\'{super_categoria}\', \'{categoria_simples}\');'.format(   super_categoria = super_categoria[int(i/2)],
                                                                                                    categoria_simples = categoria_simples[i]    ))

print(' \n---- Produto ---- ')
for i in range(len(ean)):
    print('INSERT INTO produto VALUES (\'{ean}\', \'{cat}\', \'{descr}\');'.format(  ean = ean[i],
                                                                                    cat = categoria_simples[i%len(categoria_simples)],
                                                                                    descr = descr[i]    ))

print(' \n---- tem_categoria ---- ')
for i in range(len(ean)):
    print('INSERT INTO tem_categoria VALUES (\'{ean}\', \'{nome}\');'.format(   ean = ean[i],
                                                                                nome = categoria_simples[i%len(categoria_simples)]     ))

print(' \n---- IVM ---- ')
for i in range(len(num_serie)):
    print('INSERT INTO IVM VALUES (\'{num_serie}\', \'{fabricante}\');'.format(  num_serie = num_serie[i],
                                                                                fabricante = fabricante[i%len(fabricante)]  ))
                                                        
print(' \n---- Ponto de Retalho ---- ')
for i in range(len(ponto_de_retalho)):
    print('INSERT INTO ponto_de_retalho VALUES (\'{nome}\', \'{distrito}\', \'{concelho}\');'.format(    nome = ponto_de_retalho[i],
                                                                                                        distrito = distrito[i%len(distrito)],
                                                                                                        concelho = concelho[i%len(concelho)]    ))

print(' \n---- instalada_em ---- ')
for i in range(len(num_serie)):
    print('INSERT INTO instalada_em VALUES (\'{num_serie}\', \'{fabricante}\', \'{local}\');'.format(    num_serie = num_serie[i],
                                                                                                        fabricante = fabricante[i%len(fabricante)],
                                                                                                        local = ponto_de_retalho[i%len(ponto_de_retalho)]   ))

print(' \n---- Prateleira ---- ')
for i in range(len(nro)):
    print('INSERT INTO prateleira VALUES (\'{nro}\', \'{num_serie}\', \'{fabricante}\', \'{altura}\', \'{nome}\');'.format(  nro = nro[i],
                                                                                                                            num_serie = num_serie[i%len(num_serie)],
                                                                                                                            fabricante = fabricante[i%len(fabricante)],
                                                                                                                            altura = altura[i%len(altura)],
                                                                                                                            nome = categoria_simples[i%len(categoria_simples)]     ))

print(' \n---- Planograma ---- ')
for i in range(len(ean)):
    print('INSERT INTO planograma VALUES (\'{ean}\', \'{nro}\', \'{num_serie}\', \'{fabricante}\', \'{faces}\', \'{unidades}\', \'{loc}\');'.format( ean = ean[i],
                                                                                                                                                    nro = nro[i],
                                                                                                                                                    num_serie = num_serie[i%len(num_serie)],
                                                                                                                                                    fabricante = fabricante[i%len(fabricante)],
                                                                                                                                                    faces = faces[i%len(faces)],
                                                                                                                                                    unidades = unidades[i%len(unidades)],
                                                                                                                                                    loc = loc[i%len(loc)]   ))

print(' \n---- Retalhista ---- ')
for i in range(len(tin)):
    print('INSERT INTO retalhista VALUES (\'{tin}\', \'{nome}\');'.format(   tin = tin[i],
                                                                            nome = retalhista[i]    ))

print(' \n---- responsavel_por ---- ')
for i in range(len(fabricante)):
    print('INSERT INTO responsavel_por VALUES (\'{nome_cat}\', \'{tin}\', \'{num_serie}\', \'{fabricante}\');'.format(  nome_cat = categoria_simples[i],
                                                                                                                        tin = tin[i%len(tin)],
                                                                                                                        num_serie = num_serie[i%len(num_serie)],
                                                                                                                        fabricante = fabricante[i%len(fabricante)]  ))

print(' \n---- Evento de Reposicao ---- ')
for i in range(len(instante)):
    for j in range(len(ean)):
        print('INSERT INTO evento_reposicao VALUES (\'{ean}\', \'{nro}\', \'{num_serie}\', \'{fabricante}\', \'{instante}\', \'{unidades}\', \'{tin}\');'.format(   ean = ean[j],
                                                                                                                                                                    nro = nro[j],
                                                                                                                                                                    num_serie = num_serie[j%len(num_serie)],
                                                                                                                                                                    fabricante = fabricante[j%len(fabricante)],
                                                                                                                                                                    instante = instante[i],
                                                                                                                                                                    unidades = unidadesE[i%len(unidadesE)],
                                                                                                                                                                    tin = tin[j%len(tin)]   ))
