# -*- coding: utf-8 -*-
"""
Created on Sun May 31 03:50:55 2020

@author: bocal
"""

import mysql.connector
import pandas as pd
import numpy as numpy
import webbrowser
import datetime
import dateutil.parser

dbConnect ={
    'host':'localhost',
    'user':'root',
    'password':'n0m3l0',
    'database':'agenciam'
}
conexion = mysql.connector.connect(**dbConnect)
cursor = conexion.cursor()

sql2 = "Select MAX(id_product) from mproduct"
cursor.execute(sql2)
mmax = cursor.fetchall()

numM=0
for var in mmax:
    numM=var[0]

ahora=datetime.datetime.now().date()
difmes= ahora - datetime.timedelta(days=30)
difqui = ahora - datetime.timedelta(days=15)
difsem = ahora - datetime.timedelta(days=7)

sql = "Select FKprod, Fech_compr from Historial, Ventas where FKnum_vent=num_vent"
cursor.execute(sql)
resultados = cursor.fetchall()

df=pd.DataFrame()
arregloMen=[]
for datos in resultados:
    if datos[1]>=difmes:
        valores=datos[0]
        arregloMen.append(valores)
    else:
        pass
    
df['mangas']=arregloMen
datafi=pd.crosstab(df['mangas'], columns = 'fi')
lista=sorted(df['mangas'].unique())
datafi['mangas']=lista
print(lista)
print(datafi)

datosG=""
i=1
while i<=numM:
    datosG=datosG+"{x:'idM: "+str(datafi['mangas'].loc[i])+"', y:"+str(datafi['fi'].loc[i])+", z:"+str(i)+"},\n"
    i=i+1
print(datosG)

#este es quincenal
df=pd.DataFrame()
arregloQui=[]
for datos in resultados:
    if datos[1]>=difqui:
        valores=datos[0]
        arregloQui.append(valores)
    else:
        pass
    
df['mangas']=arregloQui
datafi=pd.crosstab(df['mangas'], columns = 'fi')
lista=sorted(df['mangas'].unique())
datafi['mangas']=lista
print(lista)
print(datafi)

datosQ=""
j=1
while j<=numM:
    datosQ=datosQ+"{x:'idM: "+str(datafi['mangas'].loc[j])+"', y:"+str(datafi['fi'].loc[j])+", z:"+str(j)+"},\n"
    j=j+1
print(datosQ)
    
#este es semanal
df=pd.DataFrame()
arregloSem=[]
for datos in resultados:
    if datos[1]>=difsem:
        valores=datos[0]
        arregloSem.append(valores)
    else:
        pass
    
df['mangas']=arregloQui
datafi=pd.crosstab(df['mangas'], columns = 'fi')
lista=sorted(df['mangas'].unique())
datafi['mangas']=lista
print(lista)
print(datafi)

datosS=""
k=1
while k<=numM:
    datosS=datosS+"{x:'idM: "+str(datafi['mangas'].loc[k])+"', y:"+str(datafi['fi'].loc[k])+", z:"+str(k)+"},\n"
    k=k+1
print(datosS)

f = open('GraficasJ.html','w')

mensaje = """<html>
<head>
<meta charset="utf-8">
<title>Graficas</title>
<style type="text/css">
table td {
  text-align: center;
}
.contenedor{
   width: 1000px;
   margin-left:5rem;
   margin-top:3rem;
}
.datos{
   width:90px;
   text-align:center;
}
</style>
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>

<link rel='stylesheet' type='text/css' href='css/morris.css'>  

<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js'></script>

<script src='http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js'></script>

<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js' integrity='sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM' crossorigin='anonymous'></script> 

<script src='js/morris.min.js'></script>

<script>    

function grafica1(){
  new Morris.Bar({
  element: 'graph',
  data: ["""+datosG+"""],
  xkey: 'x',
  ykeys: ['y'],
  labels: ['Cantidad: '],
  axes:false,
  resize:false,
  barColors:['#A23E48']
  });
  new Morris.Bar({
  element: 'graph2',
  data: ["""+datosQ+"""],
  xkey: 'x',
  ykeys: ['y'],
  labels: ['Cantidad: '],
  axes:false,
  resize:false,
  barColors:['#A23E48']
  });
  new Morris.Bar({
  element: 'graph3',
  data: ["""+datosS+"""],
  xkey: 'x',
  ykeys: ['y'],
  labels: ['Cantidad: '],
  axes:false,
  resize:false,
  barColors:['#A23E48']
  });
}
</script>
</head>
<body onload='grafica1()'>
<div class='contenedor'>
<h1>Mangas comprados</<h1><br><br>
<h3>Grafica mensual</h3><div id='graph'></div>
<h3>Grafica quincenal</h3><div id='graph2'></div>
<h3>Grafica semanal</h3><div id='graph3'></div>
<a href="SesionAdmin.jsp">Regresar</a>
</div>
</body>
</html>"""

f.write(mensaje)
f.close()

webbrowser.open_new_tab('GraficasJ.html')

    
    