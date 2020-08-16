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
select
*
from
vendedores
where
month(fec_nac) in (2,4,5,9)





