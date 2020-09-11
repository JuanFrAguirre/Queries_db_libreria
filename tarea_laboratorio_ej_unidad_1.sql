-----------------------------------------------
--------------------------------ejercicio 1.1
-----------------------------1.1.1

use LIBRERIA_prueba

insert into articulos (
descripcion, pre_unitario
)
values
(
'Lapices Color largos * 12 u. Bic',
101.5
)

insert into articulos
(
descripcion, pre_unitario, observaciones
)
values
(
'Conjunto Geometrico Maped',
20.5,
'Regla, escuadra y transportador'
)

insert into articulos
(
descripcion,stock_minimo,pre_unitario,observaciones
)
values
(
'Repuesto Gloria Rayado',
120,
326.3,
'200 hojas'
)

insert into articulos
(
descripcion, pre_unitario, observaciones
)
values
(
'Repuesto Rivadavia',
465.9,
'260 hojas, margen reforzado'
)

-----------------------------------------------
-------------------------1.1.2
insert into vendedores
values
(
'Juan',
'Monti',
'Altoaguirre',
1245,
5,
4522122,
null,
null
)

insert into vendedores
values
(
'Rosa',
'Sena',
'Av. Velez Sarsfield',
25,
1,
null,
'rsena@hotmail.com',
'5/15/1968'
)

-----------------------------------------------
-----------------------1.1.3

insert into clientes
values
(
'Juan',
'Aguirre',
'9 de julio',
832,
1,
351351351,
'juan@aguirre.com'
)

insert into clientes
values
(
'Leon',
'Boller',
'25 de mayo',
238,
2,
351231231,
'leon@boller.com'
)

insert into clientes
values
(
'Keiri',
'Uiliams',
'24 de septiembre',
382,
5,
351321321,
'keiri@uiliams.com'
)

-----------------------------------------------
-----------------------------------------------
----------------------------------1.2

----------------------1.2.1
update 
articulos
set 
stock_minimo = 100
where 
cod_articulo = 28

----------------------1.2.2
update 
articulos
set 
descripcion = 'Repuesto Rivadavia cuadriculado',
observaciones = '48 hojas'
where cod_articulo= 31

----------------------1.2.3
update 
vendedores
set 
fec_nac = '10/10/1970',
[e-mail] = 'juan@monti.com'
where
cod_vendedor = 12

----------------------1.2.4
update
vendedores
set
nro_tel = 4522221,
calle = 'Av. Velez Sarsfield',
altura = 125,
cod_barrio = 1
where
cod_vendedor= 13

----------------------1.2.5
update
articulos
set 
pre_unitario = pre_unitario * 1.15
where 
pre_unitario < 20

----------------------1.2.6
update
articulos 
set 
pre_unitario = pre_unitario * 1.1
where
pre_unitario between 20 and 30

-----------------------------------------------
-----------------------------------------------
----------------------------------1.3

----------------------1.3.1
delete
vendedores
where 
ape_vendedor = 'Sena' and
nom_vendedor = 'Rosa'

----------------------1.3.2
delete
articulos
where 
descripcion = 'Repuesto Gloria Rayado'

----------------------1.3.3
delete
clientes
where
[e-mail] = 'leon@boller.com' or
[e-mail] = 'keiri@uiliams.com'

----------------------2.1
select
nom_cliente + ' ' + ape_cliente 'Nombre Completo',
calle,
altura,
cod_barrio,
nro_tel,
[e-mail]
from
clientes
where
nro_tel is not null
order by [Nombre Completo]

----------------------2.2
select
distinct
cod_articulo,
cantidad * pre_unitario 'Subtotal'
from
detalle_facturas
order by cod_articulo asc, Subtotal desc

select
*
from
detalle_facturas

----------------------2.3
select
cod_cliente 'CODIGO DE CLIENTE',
nom_cliente + ' ' + upper(ape_cliente) 'NOMBRE',
calle + ' ' + cast(altura as varchar) 'DIRECCION'
from
clientes
where
nom_cliente like 'c%'
and
ape_cliente like '%z'

----------------------2.4
select
cod_cliente 'CODIGO DE CLIENTE',
nom_cliente + ' ' + upper(ape_cliente) 'NOMBRE',
calle + ' ' + cast(altura as varchar) 'DIRECCION'
from
clientes
where
nom_cliente not like '[a-g]%'
and
ape_cliente like '[d-l]%'

----------------------2.5
select
*
from
articulos
where
pre_unitario < 40
and
observaciones is null
order by
descripcion desc,
pre_unitario desc

----------------------2.6
select
*
from
vendedores
where
nom_vendedor not like '%z%'
and
fec_nac > '1-1-1970'

----------------------2.7
select
*
from
facturas
where
fecha between '1-1-2007' and '1-5-2009'
and
cod_vendedor in (1,3,4)
or
fecha between '1-1-2010' and '1-5-2011'
and
cod_vendedor in (2,4)


----------------------2.8
select
*
from
detalle_facturas
where
(
pre_unitario >= 10
or
cod_articulo not in (2,5,6,8,10)
)
and
nro_factura between 50 and 100


----------------------2.9
select
*
from
articulos
where
(
stock_minimo > 10
or
pre_unitario < 20
)
and
descripcion not like '[p,r]%'

----------------------2.10
select cod_vendedor, nom_vendedor, ape_vendedor, calle, altura, cod_barrio, nro_tel, [e-mail], fec_nac
from
vendedores
where
month(fec_nac) in (2,4,5,9)

--------------------------
--EJERCICIO 3
--------------------------

--3.1
--Listado de vendedores y el barrio en el que viven
select
v.cod_vendedor 'Codigo de Vendedor',
v.nom_vendedor + ' ' + v.ape_vendedor 'Nombre Vendedor',
b.barrio 'Barrio'
from
vendedores v, 
barrios b
where
v.cod_barrio = b.cod_barrio

--3.2
--Liste número de factura, fecha de venta y vendedor (apellido y nombre), para los casos en que el código del cliente van del 2 al 6. Ordene por vendedor y fecha, ambas en forma descendente
select
f.nro_factura 'Nro de factura', 
f.fecha 'Fecha Venta', 
v.ape_vendedor + ' ' + v.nom_vendedor 'Nombre Completo'
from
vendedores v, 
facturas f
where
v.cod_vendedor = f.cod_vendedor 
and
f.cod_cliente in (2,3,4,5,6)
--f.cod_cliente between 2 and 6
order by
[Nombre Completo] desc,
[Fecha Venta] desc

--3.3
--Emitir un reporte con los datos de la factura del cliente y del vendedor de aquellas facturas confeccionadas entre el primero de febrero del 2008 y el primero de marzo del 2010 y que el apellido del cliente no contenga “C”
SELECT
facturas.nro_factura, 
facturas.fecha, 
facturas.cod_cliente, 
facturas.cod_vendedor, 
vendedores.nom_vendedor + ' ' + vendedores.ape_vendedor 'Nombre Vendedor'
FROM  
facturas,
vendedores,
clientes
where
facturas.cod_vendedor = vendedores.cod_vendedor
and
facturas.cod_cliente = clientes.cod_cliente
and
facturas.fecha between '2008/02/01' and '2010/03/01'
and
clientes.ape_cliente not like '%c%'


--3.4
--Listar los datos de la factura, los del artículo y el importe (precio por cantidad); para las facturas emitidas en el 2009, 2010 y 2012 y la descripción no comience con “R”. Ordene por número de factura e importe, este en forma descendente. Rotule
select
f.nro_factura 'Nro de Factura',
f.fecha 'Fecha',
f.cod_vendedor 'Cod Vendedor',
f.cod_cliente 'Cod Cliente',
a.descripcion 'Descripcion',
a.observaciones 'Observaciones',
d.pre_unitario * d.cantidad 'Importe'
from
facturas f,
articulos a,
detalle_facturas d
where
f.nro_factura = d.nro_factura
and
a.cod_articulo = d.cod_articulo
and
year(f.fecha) in (2009,2010,2012)
and
a.descripcion not like 'r%'
order by
[Nro de Factura],
[Importe] desc

--3.5
--Se quiere saber qué artículos se vendieron, siempre que el precio al que fue vendido no esté entre $10 y $50. Rotule como: Código de Artículo, Descripción, Cantidad e Importe (El importe es el precio por la cantidad)
select
a.cod_articulo 'Codigo de Articulo',
a.descripcion 'Descripcion',
d.cantidad 'Cantidad',
d.cantidad * d.pre_unitario 'Importe'
from
articulos a,
detalle_facturas d
where 
d.cod_articulo = a.cod_articulo
and
(d.cantidad * d.pre_unitario) not between 10 and 50

--3.6
--Liste todos los datos de la factura (vendedor, cliente, artículo, incluidos los datos de la venta); emitidas a clientes con teléfonos o direcciones de e-mail conocidas de aquellas facturas cuyo importe haya sido superior a $250. Agregue rótulos presentación y ordene el listado para darle mejor presentación
select
f.nro_factura 'Nro Factura',
v.nom_vendedor + ' ' + v.ape_vendedor 'Vendedor',
c.nom_cliente + ' ' + c.ape_cliente 'Cliente',
a.descripcion 'Articulo',
f.fecha 'Fecha Venta',
d.cantidad * d.pre_unitario 'Importe'
from
facturas f,
clientes c,
detalle_facturas d,
articulos a,
vendedores v
where
f.cod_cliente = c.cod_cliente
and
f.nro_factura = d.nro_factura
and
d.cod_articulo = a.cod_articulo
and
v.cod_vendedor = f.cod_vendedor
and
(
c.nro_tel is not null 
or
c.[e-mail] is not null
)
and
(d.cantidad * d.pre_unitario) > 250
order by
[Nro Factura],
[Articulo]

--3.7
--Se quiere saber a qué cliente, de qué barrio, vendedor y en qué fecha se les vendió con los siguientes nros. de factura: 12, 18, 1, 3, 35, 26 y 29
select
c.nom_cliente + ' ' + c.ape_cliente 'Cliente',
b.barrio 'Barrio',
v.nom_vendedor + ' ' + v.ape_vendedor 'Vendedor',
f.fecha 'Fecha Venta'
from
clientes c,
barrios b,
vendedores v,
facturas f
where
f.cod_cliente = c.cod_cliente
and
c.cod_barrio = b.cod_barrio
and
f.cod_vendedor = v.cod_vendedor
and
f.nro_factura in (12,18,1,3,25,26,29)

--3.8
--Emitir un reporte para informar qué artículos se vendieron, en las facturas cuyos números no esté entre 17 y 136. Liste la descripción, cantidad e importe. Ordene por descripción y cantidad. No muestre las filas con valores duplicados
select
distinct
a.descripcion 'Articulo',
d.cantidad 'Cantidad',
d.pre_unitario * d.cantidad 'Importe'
from
articulos a,
facturas f,
detalle_facturas d
where
a.cod_articulo = d.cod_articulo
and
f.nro_factura = d.nro_factura
and
f.nro_factura not between 17 and 136
order by
Articulo,
Cantidad

--3.9
--Listar los datos de las facturas (cliente, artículo, incluidos los datos de la venta incluido el importe) emitidas a los clientes cuyos apellidos comiencen con letras que van de la “l” a “s” o los artículos vendidos que tengan descripciones que comiencen con las mismas letras. Ordenar el listado
select
f.nro_factura 'Nro Factura',
c.nom_cliente + ' ' + c.ape_cliente 'Cliente',
a.descripcion 'Articulo',
v.nom_vendedor + ' ' + v.ape_vendedor 'Vendedor',
d.pre_unitario * d.cantidad 'Importe',
f.fecha 'Fecha Venta'
from
facturas f,
clientes c,
articulos a,
detalle_facturas d,
vendedores v
where
c.cod_cliente = f.cod_cliente
and
v.cod_vendedor = f.cod_vendedor
and
a.cod_articulo = d.cod_articulo
and
d.nro_factura = f.nro_factura
and
(
c.ape_cliente like '[l-s]%'
or
a.descripcion like '[l-s]%'
)
order by
[Nro Factura]

--3.10
--Realizar un reporte de los artículos que se vendieron en lo que va del año. (Muestre los datos que sean significativos para el usuario del sistema usando rótulos para que sea más legible y que los artículos no se muestren repetidos)
select
distinct
a.descripcion 'Articulo',
f.fecha 'Fecha',
d.cantidad 'Cantidad',
d.cantidad * d.pre_unitario 'Importe'
from
articulos a,
detalle_facturas d,
facturas f
where
f.nro_factura = d.nro_factura
and
a.cod_articulo = d.cod_articulo
and
year(f.fecha) = year(getdate())

--3.11
--Se quiere saber a qué clientes se les vendió el año pasado, qué vendedor le realizó la venta, y qué artículos compró, siempre que el vendedor que les vendió sea menor de 35 años
select
distinct
c.nom_cliente + ' ' + c.ape_cliente 'Cliente',
v.nom_vendedor + ' ' + v.ape_vendedor 'Vendedor',
a.descripcion 'Articulo',
f.fecha 'Fecha'
from
clientes c,
facturas f,
detalle_facturas d,
articulos a,
vendedores v
where
c.cod_cliente = f.cod_cliente
and
f.nro_factura = d.nro_factura
and
a.cod_articulo = d.cod_articulo
and
v.cod_vendedor = f.cod_vendedor
and
year(f.fecha) = year(getdate()) - 1
and
year(v.fec_nac) < year(f.fecha) -35

--3.12
--El usuario de este sistema necesita ver el listado de facturas, de aquellos artículos cuyos precios unitarios a los que fueron vendidos estén entre 50 y 100 y de aquellos vendedores cuyo apellido no comience con letras que van de la “l” a la “m”. Ordenado por vendedor, fecha e importe
select
a.descripcion 'Articulo',
v.nom_vendedor + ' ' + v.ape_vendedor 'Vendedor',
f.fecha 'Fecha',
d.pre_unitario * d.cantidad 'Importe'
from
facturas f,
articulos a,
detalle_facturas d,
vendedores v
where
a.cod_articulo = d.cod_articulo
and
v.cod_vendedor = f.cod_vendedor
and
f.nro_factura = d.nro_factura
and
d.pre_unitario between 50 and 100
and
v.ape_vendedor not like '[l-m]%'
order by
Vendedor,
Fecha,
Importe

--3.13
--Se desea emitir un listado de clientes que compraron en enero, además saber qué compraron cuánto gastaron (mostrar los datos en forma conveniente)
select
c.nom_cliente + ' ' + c.ape_cliente 'Cliente',
a.descripcion 'Articulo Comprado',
d.pre_unitario * d.cantidad 'Importe',
f.fecha 'Fecha'
from
clientes c,
facturas f,
detalle_facturas d,
articulos a
where
c.cod_cliente = f.cod_cliente
and
d.nro_factura = f.nro_factura
and
a.cod_articulo = d.cod_articulo
and
month(f.fecha) = 1
order by
Fecha

--3.14
--Emitir un reporte de artículos vendidos en el 2010 a qué precios se vendieron y qué precio tienen hoy
select
a.descripcion 'Articulo',
f.fecha 'Fecha de Venta',
d.pre_unitario 'Precio al momento de la venta',
a.pre_unitario 'Precio actual',
d.cantidad * d.pre_unitario 'Importe'
from
articulos a,
facturas f,
detalle_facturas d
where
f.nro_factura = d.nro_factura
and
a.cod_articulo = d.cod_articulo
and
year(f.fecha) = 2010

--3.15
--Listar los vendedores que hace 10 años les vendieron a clientes cuyos nombres o apellidos comienzan con "C"
select
v.nom_vendedor + ' ' + v.ape_vendedor 'Vendedor',
f.fecha 'Fecha Venta'
from
vendedores v,
facturas f,
clientes c
where
v.cod_vendedor = f.cod_vendedor
and
c.cod_cliente = f.cod_cliente
and
year(f.fecha) = year(getdate()) - 10
and
(
c.nom_cliente like 'c%'
or
c.ape_cliente like 'c%'
)

--3.16
--El encargado de la librería necesita tener información sobre los artículos que se vendían a menos de $ 10 antes del 2015. Mostrar los datos que se consideren relevantes para el encargado, rotular y ordenar
select
f.nro_factura 'Nro Factura',
a.descripcion 'Articulo',
d.pre_unitario 'Precio Unitario al momento de la Venta',
f.fecha 'Fecha de Venta'
from
articulos a,
detalle_facturas d,
facturas f
where
a.cod_articulo = d.cod_articulo
and
d.nro_factura = f.nro_factura
and
d.pre_unitario < 10
and
year(f.fecha) < 2015
order by
[Nro Factura]


---------------------------------------------------------------------------------
------------------------------------- 4
---------------------------------------------------------------------------------


--4.7 Se quiere saber la cantidad de ventas que hizo el vendedor de código 3
select
	count(distinct f.nro_factura)
from
	facturas f
where
	cod_vendedor = 3

--4.8 ¿Cuál fue la fecha de la primera y última venta que se realizó en este negocio?
select
	cast(min(f.fecha) as date) 'Primera Venta',
	cast(max(f.fecha) as date) 'Ultima Venta'
from
	facturas f

--4.9 Mostrar la siguiente información respecto a la factura nro.: 450: cantidad total de unidades vendidas, la cantidad de
--artículos diferentes vendidos y el importe total
select
	sum(d.cantidad) 'Cantidad total unidades vendidas',
	count(distinct d.cod_articulo) 'Cantidad de articulos diferentes vendidos',
	sum(d.pre_unitario*d.cantidad) 'Importe total'
from
	detalle_facturas d
where
	d.nro_factura = 450

--4.10 ¿Cuál fue la cantidad total de unidades vendidas, importe total y el importe promedio para vendedores cuyos nombres comienzan con letras que van de la “d” a la “l”?
select
	sum(d.cantidad) 'Cantidad total unidades vendidas',
	sum(d.pre_unitario * d.cantidad) 'Importe total',
	cast(round(avg(d.pre_unitario * d.cantidad),2) as decimal (10,2)) 'Importe promedio por detalle',
	cast(round(sum (d.cantidad * d.pre_unitario) / count(distinct d.nro_factura),2)as decimal (10,2)) 'Importe promedio por factura',
	cast(round(sum(d.cantidad * d.pre_unitario) / sum(d.cantidad),2) as decimal (10,2)) 'Importe promedio por articulo'
from
	facturas f,
	vendedores v,
	detalle_facturas d
where
	f.cod_vendedor = v.cod_vendedor
	and
	f.nro_factura = d.nro_factura
	and
	v.nom_vendedor like '[d-l]%'

--4.11 Se quiere saber el importe total vendido, el promedio del importe vendido y la cantidad total de artículos vendidos para el cliente Roque Paez
select
	sum(d.cantidad*d.pre_unitario) 'Importe total vendido',
	cast(round(avg(d.pre_unitario * d.cantidad),2) as decimal (10,2)) 'Importe promedio por detalle',
	cast(round(sum (d.cantidad * d.pre_unitario) / count(distinct d.nro_factura),2)as decimal (10,2)) 'Importe promedio por factura',
	cast(round(sum(d.cantidad * d.pre_unitario) / sum(d.cantidad),2) as decimal (10,2)) 'Importe promedio por articulo',
	sum(d.cantidad) 'Cantidad total de articulos vendidos'
from
	detalle_facturas d,
	clientes c,
	facturas f
where
	d.nro_factura = f.nro_factura
	and
	c.cod_cliente = f.cod_cliente
	and
	c.nom_cliente like 'Roque'
	and
	c.ape_cliente like 'Paez'

--4.12 Mostrar la fecha de la primera venta, la cantidad total vendida y el importe total vendido para los artículos que empiecen con “C”
select
	cast(min(f.fecha) as date) 'Fecha Primera Venta',
	sum(d.cantidad) 'Cantidad Total Vendida',
	sum(d.cantidad * d.pre_unitario) 'Importe Total Vendido'
from
	facturas f,
	detalle_facturas d,
	articulos a
where
	f.nro_factura = d.nro_factura
	and
	d.cod_articulo = a.cod_articulo
	and
	a.descripcion like '[c]%'

--4.13 Se quiere saber la cantidad total de artículos vendidos y el importe total vendido para el periodo del 15/06/2011 al 15/06/2017
select
	sum(d.cantidad) 'Cantidad Total Articulos',
	sum(d.cantidad * d.pre_unitario) 'Importe Total'
from
	detalle_facturas d,
	facturas f
where
	d.nro_factura = f.nro_factura
	and
	f.fecha between '2011/06/15' and '2017/06/15'
	
--4.14 Se quiere saber la cantidad de veces y la última vez que vino el cliente de apellido Abarca y cuánto gastó en total
select
	count(distinct f.nro_factura) 'Cantidad de veces',
	cast(max(f.fecha) as date) 'Fecha Ultima Visita',
	sum(d.cantidad * d.pre_unitario) 'Importe Total'
from
	facturas f,
	clientes c,
	detalle_facturas d
where
	f.cod_cliente = c.cod_cliente
	and
	f.nro_factura = d.nro_factura
	and
	c.ape_cliente like 'Abarca'

--4.15 Mostrar el importe total y el promedio del importe para los clientes cuya dirección de mail es conocida
select
	sum(d.cantidad * d.pre_unitario) 'Importe Total',
	cast(round(avg(d.pre_unitario * d.cantidad),2) as decimal(10,3)) 'Importe promedio por detalle',
	cast(round(sum (d.cantidad * d.pre_unitario) / count(distinct d.nro_factura),2)as decimal (10,2)) 'Importe promedio por factura',
	cast(round(sum(d.cantidad * d.pre_unitario) / sum(d.cantidad),2) as decimal (10,2)) 'Importe promedio por articulo'
from
	detalle_facturas d,
	facturas f,
	clientes c
where
	d.nro_factura = f.nro_factura
	and
	f.cod_cliente = c.cod_cliente
	and
	c.[e-mail] is not null

--4.16 Obtener la siguiente información: el importe total vendido y el importe promedio vendido para números de factura que no sean los siguientes: 13, 5, 17, 33, 24
select
	format(sum(d.pre_unitario * d.cantidad), 'c', 'en-us') 'Importe Total',
	format(cast(round(avg(d.pre_unitario * d.cantidad),2) as decimal(10,3)), 'c', 'en-us') 'Importe promedio por detalle',
	format(cast(round(sum (d.cantidad * d.pre_unitario) / count(distinct d.nro_factura),2)as decimal (10,2)), 'c', 'en-us') 'Importe promedio por factura',
	format(cast(round(sum(d.cantidad * d.pre_unitario) / sum(d.cantidad),2) as decimal (10,2)), 'c', 'en-us') 'Importe promedio por articulo'
from
	detalle_facturas d
where
	d.nro_factura not in (13,5,17,33,24)

---------------------------------------------------------------------------------
------------------------------------- 5
---------------------------------------------------------------------------------

--5.2 Por cada factura emitida mostrar la cantidad total de artículos vendidos (suma de las cantidades vendidas), la cantidad ítems que tiene cada factura en el detalle (cantidad de registros de detalles) y el Importe total de la facturación de este año
select
	f.nro_factura Factura,
	sum(d.cantidad) 'Cantidad Total',
	count(d.cantidad) 'Cantidad Items por Detalle',
	format(sum(d.cantidad*d.pre_unitario),'c','en-us') 'Importe Total'
from
	facturas f,
	detalle_facturas d
where
	f.nro_factura = d.nro_factura
	and
	year(f.fecha) = year(getdate())
group by
	f.nro_factura

--5.3 Se quiere saber en este negocio, cuánto se factura:a.Diariamente b.Mensualmente c.Anualmente
--Diario
select
	year(f.fecha) 'Año',
	month(f.fecha) Mes,
	day(f.fecha) Dia,
	sum(d.cantidad*d.pre_unitario) 'Total Diario'
from
	facturas f,
	detalle_facturas d
where
	f.nro_factura = d.nro_factura
group by
	day(f.fecha),
	month(f.fecha),
	year(f.fecha)
order by
	1,
	2,
	3

--Mensual
select
	year(f.fecha) 'Año',
	month(f.fecha) Mes,
	sum(d.cantidad*d.pre_unitario) 'Total Mensual'
from
	facturas f,
	detalle_facturas d
where
	f.nro_factura = d.nro_factura
group by
	month(f.fecha),
	year(f.fecha)
order by
	1,
	2

--Anual
select
	year(f.fecha) 'Año',
	sum(d.cantidad*d.pre_unitario) 'Total Diario'
from
	facturas f,
	detalle_facturas d
where
	f.nro_factura = d.nro_factura
group by
	year(f.fecha)
order by
	1

--5.4 Emitir  un  listado  de  la cantidad  de  facturas  confeccionadas  diariamente,  correspondiente  a  los  meses  que  no  sean enero, julio ni diciembre. Ordene por la cantidad de facturas en forma descendente y fecha
select
	year(f.fecha) 'Año',
	month(f.fecha) Mes,
	day(f.fecha) Dia,
	count(f.nro_factura) 'Cantidad de Facturas'
from
	facturas f
where 
	month(f.fecha) not in (1,7,12)
group by
	year(f.fecha),
	month(f.fecha),
	day(f.fecha)
order by
	4 desc,
	1,
	2,
	3

--5.5 Se quiere saber la cantidad y el importe promedio vendido por fecha y cliente, para códigos de vendedor superiores a 2. Ordene por fecha y cliente
select
	sum(d.cantidad) 'Cantidad Vendida',
	format(cast(round(avg(d.pre_unitario * d.cantidad),2) as decimal(10,3)), 'c', 'en-us') 'Importe promedio por detalle',
	format(cast(round(sum (d.cantidad * d.pre_unitario) / count(distinct d.nro_factura),2)as decimal (10,2)), 'c', 'en-us') 'Importe promedio por factura',
	format(cast(round(sum(d.cantidad * d.pre_unitario) / sum(d.cantidad),2) as decimal (10,2)), 'c', 'en-us') 'Importe promedio por articulo',
	format((f.fecha), 'D', 'en-gb') Fecha,
	c.nom_cliente + space(2) + c.ape_cliente Cliente
from
	facturas f,
	detalle_facturas d,
	clientes c
where
	f.nro_factura = d.nro_factura
	and
	f.cod_cliente = c.cod_cliente
	and
	f.cod_vendedor > 2
group by
	format((f.fecha),'D', 'en-gb'),
	c.nom_cliente + space(2) + c.ape_cliente
order by
	3,
	4

--5.6 Se quiere saber el importe promedio vendido y la cantidad total vendida por fecha y artículo, para códigos de cliente inferior a 3. Ordene por fecha y artículo
select
	avg(d.pre_unitario*d.cantidad) 'Importe promedio por detalle',
	sum(d.cantidad) 'Cantidad total Vendida',
	f.fecha Fecha,
	a.descripcion Articulo
from
	facturas f,
	detalle_facturas d,
	articulos a
where
	f.nro_factura = d.nro_factura
	and
	a.cod_articulo = d.cod_articulo
	and
	f.cod_cliente < 3
group by
	f.fecha,
	a.descripcion
order by
	3,
	4

--5.7 Listar la cantidad total vendida, el importe total vendido y el importe promedio total vendido por número de factura, siempre que la fecha no oscile entre el 13/2/2007 y el 13/7/2010
select
	f.nro_factura 'Numero Factura',
	sum(d.cantidad) 'Cantidad Total Vendida',
	sum(d.cantidad*d.pre_unitario) 'Importe Total',
	avg(d.cantidad*d.pre_unitario) 'Importe Promedio por detalle' --,
	--sum(d.cantidad * d.pre_unitario) / count(distinct f.nro_factura) '?'
from
	facturas f,
	detalle_facturas d
where
	f.nro_factura = d.nro_factura
	and
	fecha not between '2007-02-12' and '2010-07-13'
group by
	f.nro_factura

--5.8 Emitir  un  reporte  que  muestre  la  fecha  de  la  primer  y  última  venta  y  el  importe  comprado  por  cliente.  Rotule  como CLIENTE, PRIMER VENTA, ÚLTIMA VENTA, IMPORTE
select
	cast(min(f.fecha) as date) 'PRIMER VENTA',
	cast(max(f.fecha) as date) 'ULTIMA VENTA',
	sum(d.cantidad*d.pre_unitario) IMPORTE,
	c.nom_cliente + space(2) + c.ape_cliente CLIENTE
from
	facturas f,
	detalle_facturas d,
	clientes c
where
	f.nro_factura = d.nro_factura
	and
	f.cod_cliente = c.cod_cliente
group by
	c.nom_cliente + space(2) + c.ape_cliente

--5.9 Se quiere saber el importe total vendido, la cantidad total vendida y el precio unitario promedio por cliente y artículo, siempre que el nombre del cliente comience con letras que van de la “a” a la “m”. Ordene por cliente, precio unitario promedio en forma descendente y artículo. Rotule como IMPORTE TOTAL, CANTIDAD TOTAL, PRECIO PROMEDIO
select
	sum(d.pre_unitario*d.cantidad) 'IMPORTE TOTAL',
	sum(d.cantidad) 'CANTIDAD TOTAL',
	--avg(d.pre_unitario) 'PRECIO PROMEDIO', esto seria el precio promedio POR DETALLE
	--asi deberia ser para Promedio
	sum(d.pre_unitario*d.cantidad) / sum(d.cantidad) 'PRECIO PROMEDIO',
	c.ape_cliente + space(2) + c.nom_cliente Cliente,
	a.descripcion Articulo
from
	facturas f,
	detalle_facturas d,
	clientes c,
	articulos a
where
	f.nro_factura = d.nro_factura
	and
	c.cod_cliente = f.cod_cliente
	and
	a.cod_articulo = d.cod_articulo
	and
	c.nom_cliente like '[a-m]%'
group by
	c.ape_cliente + space(2) + c.nom_cliente,
	a.descripcion
order by
	4,
	3 desc,
	5

--5.10 Se quiere saber la cantidad de facturas y la fecha la primer y última factura por vendedor y cliente, para números de factura que oscilan entre 5 y 30. Ordene por vendedor, cantidad de ventas en forma descendente y cliente
select
	count(distinct f.nro_factura) 'Cantidad de Facturas',
	cast(min(f.fecha) as date) 'Primer Venta',
	cast(max(f.fecha) as date) 'Ultima Venta',
	v.nom_vendedor + space(2) + v.ape_vendedor Vendedor,
	c.nom_cliente + space(2) + c.ape_cliente Cliente
from
	facturas f,
	vendedores v,
	clientes c
where
	f.cod_cliente = c.cod_cliente
	and
	f.cod_vendedor = v.cod_vendedor
	and
	f.nro_factura between 5 and 30
group by
	v.nom_vendedor + space(2) + v.ape_vendedor,
	c.nom_cliente + space(2) + c.ape_cliente
order by
	4,
	1 desc,
	5

---------------------------------------------------------------------------------
------------------------------------- 6
---------------------------------------------------------------------------------


--6.3 Se quiere saber la fecha de la primera venta, la cantidad total vendida y el importe total vendido por vendedor para los casos en que el promedio de la cantidad vendida sea inferior o igual a 56
select
	format(min(f.fecha), 'D', 'en-gb') 'Primer Venta',
	sum(d.cantidad) 'Cantidad Total',
	format(sum(d.pre_unitario * d.cantidad),'c','en-us') 'Importe Total',
	v.ape_vendedor + space(2) + v.nom_vendedor Vendedor
from
	facturas f,
	detalle_facturas d,
	vendedores v
where
	f.nro_factura = d.nro_factura
	and
	f.cod_vendedor = v.cod_vendedor
group by
	v.ape_vendedor + space(2) + v.nom_vendedor
having
	avg(d.cantidad) <= 56

--6.4 Se necesita un listado que informe sobre el monto máximo, mínimo y total que gastó en esta librería cada cliente el año pasado, pero solo donde el importe total gastado por esos clientes esté entre 300 y 800
select
	format(max(d.pre_unitario * d.cantidad),'c','en-us') 'Monto Maximo',
	format(min(d.pre_unitario * d.cantidad),'c','en-us') 'Monto Minimo',
	format(sum(d.pre_unitario * d.cantidad),'c','en-us') 'Total Gastado',
	c.nom_cliente + space(2) + c.ape_cliente Cliente
from
	detalle_facturas d,
	facturas f,
	clientes c
where
	d.nro_factura = f.nro_factura
	and
	c.cod_cliente = f.cod_cliente
	and
	year(f.fecha) = year(getdate()) - 1
group by
	c.nom_cliente + space(2) + c.ape_cliente
having
	sum(d.pre_unitario * d.cantidad) between 300 and 2000 --con esta cantidad pedida (300 800), no presenta registros, pero la consulta funciona con otros datos en el having

--6.5. Muestre la cantidad facturas diarias por vendedor; para los casos en que esa cantidad sea 2 o más
select
	v.ape_vendedor + space(2) + v.nom_vendedor Vendedor,
	year(f.fecha) 'Año',
	month(f.fecha) Mes,
	day(f.fecha) Dia,
	count(f.nro_factura) 'Cantidad Facturas'
from
	facturas f,
	vendedores v
where
	f.cod_vendedor = v.cod_vendedor
group by
	year(f.fecha),
	month(f.fecha),
	day(f.fecha),
	v.ape_vendedor + space(2) + v.nom_vendedor
having
	count(f.nro_factura) >= 3 --cambie de 2 a 3 como para ver resultados mas precisos, pero con 2 tambien funciona
order by
	1,
	2,
	3,
	4

--6.6 Desde la administración se solicita un reporte que muestre el precio promedio, el importe total y el promedio del importe vendido por artículo que no comiencen con “c”, que su cantidad total vendida sea 100 o más o que ese importe total vendido sea superior a 700
select
	a.descripcion Articulo,
	format(cast(round(avg(d.pre_unitario),2)as decimal(10,2)), 'c', 'en-us') 'Precio Promedio',
	format(sum(d.pre_unitario * d.cantidad), 'c', 'en-us') 'Importe Total',
	format(cast(round(sum (d.cantidad * d.pre_unitario) / count(distinct d.nro_factura),2)as decimal (10,2)), 'c', 'en-us') 'Importe promedio por factura',
	format(cast(round(avg(d.pre_unitario*d.cantidad),2)as decimal (10,2)), 'c', 'en-us') 'Importe promedio por detalle',
	format(cast(round(sum(d.cantidad * d.pre_unitario) / sum(d.cantidad),2) as decimal (10,2)), 'c', 'en-us') 'Importe promedio por articulo'
from
	detalle_facturas d,
	articulos a
where
	d.cod_articulo = a.cod_articulo
	and
	a.descripcion not like 'c%'
group by
	a.descripcion
having
	sum(d.cantidad) >= 100
	or
	sum(d.pre_unitario * d.cantidad) > 700


--6.7 Muestre en un listado la cantidad total de artículos vendidos, el importe total y la fecha de la primer y última venta por cada cliente, para lo números de factura que no sean los siguientes: 2, 12, 20, 17, 30 y que el promedio de la cantidad vendida oscile entre 2 y 6
select
	sum(d.cantidad) 'Cantidad Total Articulos',
	format(sum(d.cantidad * d.pre_unitario), 'c', 'en-us') 'Importe Total',
	format(min(f.fecha), 'D', 'es-es') 'Primer Venta',
	format(max(f.fecha), 'D', 'es-es') 'Ultima Venta',
	c.ape_cliente + space(2) + c.nom_cliente Cliente
from
	detalle_facturas d,
	facturas f,
	clientes c
where
	f.nro_factura = d.nro_factura
	and
	f.cod_cliente = c.cod_cliente
	and
	f.nro_factura not in (2,12,20,17,30)
group by
	c.ape_cliente + space(2) + c.nom_cliente
having
	avg(d.cantidad) between 2 and 20 --con la cantidad pedida (entre 2 y 6), no presenta registros, pero la consulta funciona con otros datos en el having

--6.8 Emitir un listado que muestre la cantidad total de artículos vendidos, el importe total vendido y el promedio del importe vendido por vendedor y por cliente; para los casos en que el importe total vendido esté entre 200 y 600 y para códigos de cliente que oscilen entre 1 y 5
select
	v.ape_vendedor + space(2) + v.nom_vendedor Vendedor,
	c.nom_cliente + space(2) + c.ape_cliente Cliente,
	sum(d.cantidad) 'Cantidad Articulos Vendidos',
	format(sum(d.pre_unitario * d.cantidad), 'c', 'en-us') 'Importe Total',
	format(cast(round(sum (d.cantidad * d.pre_unitario) / count(distinct d.nro_factura),2)as decimal (10,2)), 'c', 'en-us') 'Importe promedio por factura',
	format(cast(round(avg(d.pre_unitario*d.cantidad),2)as decimal (10,2)), 'c', 'en-us') 'Importe promedio por detalle',
	format(cast(round(sum(d.cantidad * d.pre_unitario) / sum(d.cantidad),2) as decimal (10,2)), 'c', 'en-us') 'Importe promedio por articulo'
from
	detalle_facturas d,
	facturas f,
	vendedores v,
	clientes c
where
	f.nro_factura = d.nro_factura
	and
	v.cod_vendedor = f.cod_vendedor
	and
	c.cod_cliente = f.cod_cliente
	and
	c.cod_cliente between 1 and 5
group by
	v.ape_vendedor + space(2) + v.nom_vendedor,
	c.nom_cliente + space(2) + c.ape_cliente
having
	sum(d.pre_unitario * d.cantidad) between 200 and 5000 --con esta cantidad pedida (600), no presenta registros, pero la consulta funciona con otros datos en el having
order by
	4

--6.9 ¿Cuáles son los vendedores cuyo promedio de facturación el mes pasado supera los $ 800?
select
	v.ape_vendedor + space(2) + v.nom_vendedor Vendedor,
	format(cast(round(sum (d.cantidad * d.pre_unitario) / count(distinct d.nro_factura),2)as decimal (10,2)), 'c', 'en-us') 'Importe promedio por factura',
	format(cast(round(avg(d.pre_unitario*d.cantidad),2)as decimal (10,2)), 'c', 'en-us') 'Importe promedio por detalle',
	format(cast(round(sum(d.cantidad * d.pre_unitario) / sum(d.cantidad),2) as decimal (10,2)), 'c', 'en-us') 'Importe promedio por articulo'
	--,cast(month(f.fecha) as date) Mes
from
	facturas f,
	detalle_facturas d,
	vendedores v
where
	f.nro_factura = d.nro_factura
	and
	f.cod_vendedor = v.cod_vendedor
	and
	month(f.fecha) = month(getdate()) - 1
	and
	year(f.fecha) = year(getdate())
group by
	v.ape_vendedor + space(2) + v.nom_vendedor
having
	sum (d.cantidad * d.pre_unitario) / count(distinct d.nro_factura) > 800 --por factura
	--cast(round(avg(d.pre_unitario*d.cantidad),2)as decimal (10,2)) > 800 --por detalle
	--cast(round(sum(d.cantidad * d.pre_unitario) / sum(d.cantidad),2) as decimal (10,2)) > 800 --por articulo

--6.10 ¿Cuánto le vendió cada vendedor a cada cliente el año pasado siempre que la cantidad de facturas emitidas (por cada vendedor a cada cliente) sea menor a 5?
select
	v.ape_vendedor + space(2) + v.nom_vendedor Vendedor,
	c.nom_cliente + space(2) + c.ape_cliente Cliente,
	format(sum(d.pre_unitario * d.cantidad), 'c', 'en-us') 'Importe Total Anual'
from
	vendedores v,
	clientes c,
	facturas f,
	detalle_facturas d
where
	v.cod_vendedor = f.cod_vendedor
	and
	c.cod_cliente = f.cod_cliente
	and
	f.nro_factura = d.nro_factura
	and
	year(f.fecha) = year(getdate()) - 1
group by
	v.ape_vendedor + space(2) + v.nom_vendedor,
	c.nom_cliente + space(2) + c.ape_cliente
having
	count(distinct f.nro_factura) < 5

---------------------------------------------------------------------------------
------------------------------------- 7
---------------------------------------------------------------------------------

--7.1 Se quiere saber qué vendedores y clientes hay en la empresa; para los casos en que su teléfono y dirección de e-mail sean conocidos. Se deberá visualizar el código, nombre y si se trata de un cliente o de un vendedor. Ordene por la columna tercera y segunda
select
	cod_cliente Codigo, nom_cliente + space(2) + ape_cliente Nombre, 'Cliente' Tipo
from
	clientes c
where
	nro_tel is not null
	and
	[e-mail] is not null
union all
select
	cod_vendedor, nom_vendedor + space(2) + ape_vendedor, 'Vendedor'
from
	vendedores v
where
	nro_tel is not null
	and
	[e-mail] is not null
order by
	3,
	2

--7.2 Emitir un listado donde se muestren qué artículos, clientes y vendedores hay en la empresa. Determine los campos a mostrar y su ordenamiento
select
	'Articulos' Tipo,
	cod_articulo 'Codigo',
	descripcion 'Descripcion/Nombre'
from
	articulos
union all
select
	'Clientes',
	cod_cliente,
	nom_cliente + space(2) + ape_cliente
from
	clientes
union all
select
	'Vendedores',
	cod_vendedor,
	nom_vendedor + space(2) + ape_vendedor
from
	vendedores
order by
	1,
	2,
	3

--7.3 Se quiere saber las direcciones (incluido el barrio) tanto de clientes como de vendedores. Para el caso de los vendedores, códigos entre 3 y 12. En ambos casos las direcciones deberán ser conocidas. Rotule como NOMBRE, DIRECCION, BARRIO, INTEGRANTE (en donde indicará si es cliente o vendedor). Ordenado por la primera y la última columna
select
	nom_cliente + space(2) + ape_cliente 'Nombre',
	c.calle + space(2) + cast(c.altura as varchar) 'Direccion',
	b.barrio 'Barrio',
	'Cliente' Integrante
from
	clientes c,
	barrios b 
where
	c.cod_barrio = b.cod_barrio
	and
	c.calle is not null
	and
	c.altura is not null
union all
select
	nom_vendedor + space(2) + ape_vendedor,
	v.calle + space(2) + cast(v.altura as varchar),
	b.barrio,
	'Vendedor'
from
	vendedores v,
	barrios b
where
	v.cod_barrio = b.cod_barrio
	and
	v.calle is not null
	and
	v.altura is not null
	and
	v.cod_vendedor between 3 and 12
order by
	1,
	4

--7.4 Ídem al ejercicio anterior, sólo que además del código, identifique de donde obtiene la información (de qué tabla se obtienen los datos)
select
	nom_cliente + space(2) + ape_cliente 'Nombre',
	c.calle + space(2) + cast(c.altura as varchar) 'Direccion',
	b.barrio 'Barrio',
	c.cod_cliente 'Codigo',
	'Tabla Clientes' Integrante
from
	clientes c,
	barrios b 
where
	c.cod_barrio = b.cod_barrio
	and
	c.calle is not null
	and
	c.altura is not null
union all
select
	nom_vendedor + space(2) + ape_vendedor,
	v.calle + space(2) + cast(v.altura as varchar),
	b.barrio,
	v.cod_vendedor,
	'Tabla Vendedores'
from
	vendedores v,
	barrios b
where
	v.cod_barrio = b.cod_barrio
	and
	v.calle is not null
	and
	v.altura is not null
	and
	v.cod_vendedor between 3 and 12
order by
	1,
	4

--7.5 Listar todos los artículos que están a la venta cuyo precio unitario oscile entre 10 y 50; también se quieren listar los artículos que fueron comprados por los clientes cuyos apellidos comiencen con “M” o con “P”
select
	'Articulo a la Venta' Tipo,	
	a.descripcion Descripcion,
	format(a.pre_unitario, 'C', 'en-us') Precio,
	'' Cliente
from
	articulos a
where
	a.pre_unitario between 10 and 50
union             
select
	'Articulo Vendido',
	a.descripcion HOLA,
	format(d.pre_unitario, 'C', 'en-us'),
	c.ape_cliente + space(2) + c.nom_cliente
from
	detalle_facturas d
	join articulos a on d.cod_articulo = a.cod_articulo
	join facturas f on d.nro_factura = f.nro_factura
	join clientes c on f.cod_cliente = c.cod_cliente
where
	c.ape_cliente like '[m,p]%'

--7.6 El encargado del negocio quiere saber cuánto fue la facturación del año pasado. Por otro lado cuánto es la facturación del mes pasado, la de este mes y la de hoy (Cada pedido en una consulta distinta, y puede unirla en una sola tabla de resultado)--1era tablaselect
	'Año Pasado' Periodo,
	case 
		when sum(d.cantidad * d.pre_unitario) is not null 
		then (format(sum(d.cantidad * d.pre_unitario),'c','en-us'))
		else '$ 0'
	end as 'Facturacion'
from
	facturas f
	join detalle_facturas d on f.nro_factura = d.nro_factura
where
	year(f.fecha) in (year(dateadd(year,-1,getdate())))
	--year(f.fecha) = year(getdate())-1
	union
--2da tabla
select
	'Mes Pasado',
	case 
		when sum(d.cantidad * d.pre_unitario) is not null 
		then (format(sum(d.cantidad * d.pre_unitario),'c','en-us'))
		else '$ 0'
	end as 'Facturacion'
from
	facturas f
	join detalle_facturas d on f.nro_factura = d.nro_factura
where
	month(f.fecha) = month(dateadd(month, -1, getdate()))
	and
	year(f.fecha) = year(dateadd(month, -1, getdate()))
	union
--3era tabla
select
	'Este Mes',
	case 
		when sum(d.cantidad * d.pre_unitario) is not null 
		then (format(sum(d.cantidad * d.pre_unitario),'c','en-us'))
		else '$ 0'
	end as 'Facturacion'
from
	facturas f
	join detalle_facturas d on f.nro_factura = d.nro_factura
where
	month(f.fecha) = month(getdate())
	and
	year(f.fecha) = year(getdate())
	union
--4ta tabla
select
	'Hoy',
	case 
		when sum(d.cantidad * d.pre_unitario) is not null 
		then (format(sum(d.cantidad * d.pre_unitario),'c','en-us'))
		else '$ 0'
	end as 'Facturacion'
from
	facturas f
	join detalle_facturas d on f.nro_factura = d.nro_factura
where
	month(f.fecha) = month(getdate())
	and
	year(f.fecha) = year(getdate())
	and
	day(f.fecha) = day(getdate())
		union
--5ta tabla
select
	'Dia de mañana del año que viene' as Lapso,
	case
		when sum(df.cantidad * df.pre_unitario) is not null
		then format(sum(df.cantidad * df.pre_unitario), 'c', 'en-us')
		else '$ 0'
	end	as 'Facturacion'
from
	facturas f inner join detalle_facturas df on f.nro_factura = df.nro_factura
where
	year(fecha) = year(dateadd(year,+1,getdate()))
	and
	month(fecha) = month(getdate())
	and
	day(fecha) = day(dateadd(day,0,getdate()))
order by
	1,2

---------------------------------------------------------------------------------
------------------------------------- 8
---------------------------------------------------------------------------------

--8.1 Genere un reporte con los datos de la facturación (datos de las facturas incluidos los del vendedor y cliente) de los años 2006, 2007, 2009 y 2012


--8.2 Liste los datos de la facturación, de los artículos y de la venta de las facturas correspondientes al mes pasado


--8.3 Emita un listado con los datos del vendedor y las ventas que ha realizado en lo que va del año. Muestre los vendedores aun así no tengan ventas registradas en el año solicitado


--8.4 Liste descripción, cantidad e importe; aun para aquellos artículos que no registran ventas


--8.5 Genere un reporte con los datos de la facturación (datos de las facturas incluidos los del vendedor y cliente) y de la venta (incluido el importe); para las ventas de febrero y marzo de los años 2006 y 2007 y siempre que el artículo empiece con letras que van de la “a” a la “m”. Ordene por fecha, cliente y artículo


--8.6 Liste código de cliente, nombre, fecha y factura para las ventas del año 2007. Muestre los clientes hayan comprado o no en ese año


--8.7 Se quiere saber los artículos que compro la cliente Elvira López en lo que va del año. Liste artículo, observaciones e importe


--8.8 Se quiere saber los artículos que compraron los clientes cuyos apellidos empiezan con “p”. Liste cliente, articulo, cantidad e importe. Ordene por cliente y artículo, este en forma descendente. Rotule como CLIENTE, ARTICULO, CANTIDAD, IMPORTE


--------------------------------------------------------------------------------------
------------------------------------- CLASES
--------------------------------------------------------------------------------------

--Cuantas facturas realizo este negocio?
select
	count(fa.nro_factura)
from
	facturas fa
select
	c.nom_cliente+space(2)+c.ape_cliente 'Nombre Cliente',
	ba_ve.barrio 'Barrio Cliente',
	v.nom_vendedor+space(2)+v.ape_vendedor 'Nombre Vendedor',
	ba_cl.barrio 'Barrio Vendedor'
from
	vendedores v,
	clientes c,
	barrios ba_ve,
	barrios ba_cl
where
	v.cod_barrio = ba_ve.cod_barrio
	and
	c.cod_barrio = ba_cl.cod_barrio


--cuantas fact se vendieron este año? y el pasado? y el 2018?
select
	COUNT(f.nro_factura) 'Cant facturas este año'
from
	facturas f
where
	year(f.fecha) = year(getdate())
--110

select
	COUNT(f.nro_factura) 'Cant facturas año pasado'
from
	facturas f
where
	year(f.fecha) = year(getdate())-1
--118

select
	COUNT(f.nro_factura) 'Cant facturas 2018'
from
	facturas f
where
	year(f.fecha) = 2018
--127

select
	year(f.fecha) 'Año',
	COUNT(f.nro_factura) 'Cant facturas 2018'
from
	facturas f
where
	year(f.fecha) = year(getdate())-1
	or
	year(f.fecha) = 2018
	or
	year(f.fecha) = year(getdate())
group by year(f.fecha)

--cuantas facturas hizo el vendedor 1 por año?

select
	year(f.fecha) ' Año',
	count(f.nro_factura) 'Cantidad facturas',
	v.ape_vendedor 'Apellido vendedor'
from
	facturas f,
	vendedores v
where
	v.cod_vendedor = f.cod_vendedor
	and
	f.cod_vendedor = 1
group by
	year(f.fecha),
	v.ape_vendedor

-- cuantas facturas hicieron cada uno de los vendedores(por vendedor), por año?
select
	v.cod_vendedor 'Codigo Vendedor', 
	ape_vendedor +space(2)+ nom_vendedor 'Nombre Vendedor',
	year(fecha) 'Año', 
	count(*) 'cantidad de facturas'
from 
	facturas f, vendedores v
where 
	f.cod_vendedor = v.cod_vendedor
group by 
	v.cod_vendedor,
	ape_vendedor +space(2)+ nom_vendedor,
	year(fecha)

--Cuanto facturo cada vendedor mensualmente este a;o? mostrar solo los que facutraron menos de $1000

select
	f.cod_vendedor,
	ape_vendedor+' '+nom_vendedor Vendedor,
	month(fecha) Mes,
	sum(cantidad*pre_unitario) Total
from 
	detalle_facturas d, 
	facturas f, 
	vendedores v
where d.nro_factura = f.nro_factura 
	and 
	f.cod_vendedor = v.cod_vendedor 
	and 
	year(fecha) = year(getdate())
group by 
	f.cod_vendedor, 
	ape_vendedor+' '+nom_vendedor, 
	month(fecha)
having 
	sum(cantidad*pre_unitario) < 1000
order by 
	f.cod_vendedor, mes


--Cuanto facturo cada vendedor mensualmente este a;o? mostrar solo los que hicieron menos de 2 facturas

select
	f.cod_vendedor,
	ape_vendedor+' '+nom_vendedor Vendedor,
	month(fecha) Mes,
	sum(cantidad*pre_unitario) Total,
	count(distinct d.nro_factura) 'Cantidad de facturas'
from 
	detalle_facturas d, 
	facturas f, 
	vendedores v
where d.nro_factura = f.nro_factura 
	and 
	f.cod_vendedor = v.cod_vendedor 
	and 
	year(fecha) = year(getdate())
group by 
	f.cod_vendedor, 
	ape_vendedor+' '+nom_vendedor, 
	month(fecha)
having 
	count(distinct d.nro_factura) < 2
order by 
	f.cod_vendedor, mes

--listado de vendedores y clientes en la misma tabla de resultados
select
	cod_cliente Codigo, 
	ape_cliente Apellido, 
	nom_cliente Nombre, 
	'Cliente' Tipo
from
	clientes
union 
select 
	cod_vendedor, 
	ape_vendedor, 
	nom_vendedor,
	'Vendedor'
from
	vendedores

--listado de vendedores y clientes en la misma tabla de resultados, ordenados por vendedores y despues por clientes, alfabeticamente por apellido y nombre
select
	cod_cliente Codigo, 
	ape_cliente Apellido, 
	nom_cliente Nombre, 
	'Cliente' Tipo
from
	clientes
union 
select 
	cod_vendedor, 
	ape_vendedor, 
	nom_vendedor,
	'Vendedor'
from
	vendedores
order by
	4 desc,
	2,
	3

--se quiere mostrar nro, y el subtotal de cada detalle de la factura 17 y el importe total
select
	'Detalle' Descripcion,
	d.nro_factura 'Nro. Factura',
	str(d.cod_articulo) 'Articulo',
	d.cantidad * d.pre_unitario 'Total'
from 
	detalle_facturas d
where
	d.nro_factura = 17
union
select
	'Total General',
	d.nro_factura,
	'',
	sum(d.cantidad * d.pre_unitario)
from
	detalle_facturas d
where
	d.nro_factura = 17
group by d.nro_factura

--listar los codigos de vendederoes y los codigos de clientes
select
	ape_cliente Apellido,
	'Cliente' Tipo
from
	clientes
union all
select 
	ape_vendedor,
	'Vendedor'
from
	vendedores
order by
	1

--listar los articulos que compraron los clientes del 1 al 5
select
distinct 
	descripcion
from
	clientes c 
	join
	facturas f on c.cod_cliente = f.cod_cliente
	join
	detalle_facturas d on f.nro_factura = d.nro_factura
	join
	articulos a on d.cod_articulo = a.cod_articulo
where
	c.cod_cliente between 1 and 5

--listar los clientes que compraron
select
distinct
	c.cod_cliente,
	ape_cliente
from
	facturas f join clientes c on f.cod_cliente = c.cod_cliente

--cuantos clientes hay?
select 
	*
from
	clientes

--listar los clientes con sus facturas y los clientes aunque no tengan facturas
select
	c.cod_cliente,
	c.ape_cliente,
	f.nro_factura
from
	facturas f 
	right join clientes c on f.cod_cliente = c.cod_cliente
order by 
	3





