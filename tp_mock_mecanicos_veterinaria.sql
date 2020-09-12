-------------------------------------------------------------
-----------------PARCIALES PRACTICA
-------------------------------------------------------------

-----------------------------------
--Mecanicos / Mantenimientos

--1.1. Se quiere saber dentro del a�o en curso, cu�nto fue el total pagado en concepto de mantenimientos a cada mec�nico mensualmente, cu�nto fue lo m�s caro y lo m�s barato pero solo aquellos en los que la cantidad de mantenimientos haya superado los 10. Rotule
select
	sum(monto) 'Total Pagado', cod_mecanico Codigo, nom_mecanico 'Nombre Mecanico', month(fec_mantenim) Mes,
	max(monto) 'Mantenimiento mas caro', min(monto) 'Mantenimiento mas barato'
from
	mecanicos me join mantenimientos ma on me.cod_mecanico = ma.cod_mecanico
where
	year(ma.fec_mantenim) = year(getdate()) 
group by
	cod_mecanico, nom_mecanico, month(fec_mantenim)
having
	count(fec_mantenim) > 10
order by
	1,4

--1.2. Emitir un listado de mec�nicos que realizaron mantenimientos en los dos �ltimos meses de este a�o, a autos fiat, peugeot y chevrolet, cuyos responsables tienen tel�fonos o direcci�n conocidos y cuyo mantenimiento haya costado entre $1000 y $3000. Ordene por especialidad de mec�nico en forma descendente y luego por nombre
select
	cod_mecanico Codigo, nom_mecanico Mecanico, especialidad Especialidad, month(fec_mantenim) Mes
from
	mecanicos me join mantenimientos ma on me.cod_mecanico = ma.cod_mecanico
	join unidades u on u.cod_unidad = ma.cod_unidad
	join responsables r on r.cod_responsable = u.cod_responsable
where
	month(fec_mantenim) in (11,12) and year(fec_mantenim) = year(getdate()) and marca like '%[fiat,peugeot,chevrolet]%' 
	and (r.tel_responsable is not null or r.direccion is not null) and monto between 1000 and 3000
order by
	3 desc, 2

-- resuelto para los ultimos dos meses de este a�o (si los hay)
select
	cod_mecanico Codigo, nom_mecanico Mecanico, especialidad Especialidad, month(fec_mantenim) Mes
from
	mecanicos me join mantenimientos ma on me.cod_mecanico = ma.cod_mecanico
	join unidades u on u.cod_unidad = ma.cod_unidad
	join responsables r on r.cod_responsable = u.cod_responsable
where
	datediff(month,fec_mantenimiento,getdate())<=2 and	and marca like '%[fiat,peugeot,chevrolet]%'
	and (r.tel_responsable is not null or r.direccion is not null) and monto between 1000 and 3000
order by
	3 desc, 2

--1.3. �Cu�nto se pag� en concepto de mantenimientos el a�o pasado y cu�l fue el monto promedio de cada uno?
select
	sum(monto) 'Costo anual de mantenimientos', avg(monto) 'Monto Promedio', fec_mantenim 'Mantenimiento Fecha'
from
	mantenimientos m
where
	year(fec_mantenim) = year(getdate()) -1
group by
	fec_mantenim

--1.4. Se quiere emitir un listado de responsables de unidades y uno de mec�nicos pero que el resultado aparezca en una misma tabla, donde primero se muestren los responsables y luego los mec�nicos ordenados alfab�ticamente por nombre
select
	nombre 'Nombre', 'Responsable' Tipo
from
	responsables
union
select
	nom_mecanico, 'Mecanico'
from
	mecanicos
order by
	1 desc

--2.1. Se quiere saber en los seis �ltimos meses, cu�nto fue el total pagado en concepto de mantenimientos por cada mec�nico mensualmente y cu�ntos mantenimientos se hicieron, pero solo aquellos en los que el promedio mensual pagado haiga superado los $ 5000. Rotule
select
	year(fec_mantenim) A�o, month(fec_mantenim) Mes, sum(monto) 'Total Pagado', cod_mecanico Mecanico, count(*) Mantenimientos
from
	mantenimientos m
where
	datediff(month,fec_mantenim,getdate()) <= 6
group by
	cod_mecanico, month(fec_mantenim), year(fec_mantenim)
having
	avg(monto) > 5000
order by
	1,2

--2.2. Emitir un listado de mec�nicos que realizaron en el a�o en curso, mantenimientos a autos modelos 2011, 2012 y 2015, que hayan sido comprados entre el 2010 y el 2016 y no que tengan detalle de mantenimiento o que el tipo de mantenimiento haya sido �preventivo�. Ordene por fecha de mantenimiento descendente y alfab�ticamente por nombre de responsable
select
	me.cod_mecanico 'Codigo Mecanico', nom_mecanico Mecanico, cod_responsable 'Codigo Responsable',
	nombre Responsable, fec_mantenim Fecha
from
	mecanicos me join mantenimientos ma on me.cod_mecanico = ma.cod_mecanico
	join unidades u on ma.cod_unidad = u.cod_unidad
	join responsables r on r.cod_responsable = u.cod_responsable
where
	year(fec_mantenim) = year(getdate()) and u.modelo in (2011,2012,2015) and year(fec_compra) between 2010 and 2016 and (detalle is null or tipo_mantenim like '%preventivo%') 
order by
	5 desc, 4

---------------------------------
-- Veterinaria

--1.1. Realice un listado de mascotas y m�dicos veterinarios que atendieron en los �ltimos dos a�os cuyos due�os no vivan en la calle Pe�a (que la direcci�n no contenga "Pe�a"), ni tampoco en la calle Moreno, y que no contenga fecha de pr�xima consulta. Ordene por fecha de consulta en forma ascendente y nombre de mascota en forma descendente. Rotule. Para la composici�n de las tablas utilice Join.
select
	ma.cod_mascota 'Codigo Mascota', nom_mascota 'Nombre Mascota', me.cod_medico 'Codigo Medico',
	me.nom_medico 'Nombre Medico', fec_consulta 'Fecha de Consulta'
from 
	mascotas ma join consultas c on ma.cod_mascota = c.cod_mascota
	join medicos me on me.cod_medico = c.cod_medico
	join duenos d on d.cod_duenos = ma.cod_duenos
where
	datediff(year, fec_consulta, getdate()) <= 2 and
	--fec_consulta >= dateadd(year, -2, getdate()) and
	dir_dueno not like '%pe_a%' and dir_dueno not like '%moreno%' and fec_prox is null
order by
	5, 2 desc

--1.2. Se quiere saber la cantidad de consultas, el total y el promedio del importe pagado por due�o por a�o desde el 2006 al 2013 y donde el importe total pagado sea superior a $ 1000.
select
	count(*) 'Cantidad de consultas', sum(importe) 'Importe Total', avg(importe) 'Importe Promedio', cod_dueno 'Codigo Dueno', year(fec_consulta) A�o
from
	consultas c join mascotas ma on ma.cod_mascotas = c.cod_mascotas
where
	year(fec_consulta) between 2006 and 2013
group by
	cod_dueno, year(fec_consulta)
having
	sum(importe) > 1000

--1.3. �Cu�nto se recaud� en concepto de consultas el mes pasado? Adem�s, �cu�ntas consultas se realizaron y cu�l fue la consulta m�s cara y la m�s barata?
select
	sum(importe) 'Importe Total', count(*) 'Cantidad Consultas', max(importe) 'Consulta Mas Cara', 
	min(importe) 'Consulta Mas Barata'
from
	consultas
where
	month(fec_consulta) = month(dateadd(month, -1, getdate())) and 
	year(fec_consulta) = year(dateadd(month, -1, getdate()))

--1.4. Realice los siguientes movimientos
--a. Dar de alta a un nuevo m�dico
--b. El due�o n�mero 123 actualiz� los datos referidos a la direcci�n y a su tel�fono.
--c. Se cometi� un cometi� un error al registrar una consulta de la mascota nro. 35 y del m�dico nro. 3 realizada el d�a de ayer. Debe eliminar dicho registro.
a.	insert into medicos values(
	7236, 'Tadeo Bustamante', 957654, 3515515151
)
b.	update duenos
	set dir_dueno = '9 de julio 822 (soy manu)', tel_dueno = 3515151515
	where cod_dueno = 123

c.	delete [from] consultas 
	where cod_mascota = 35 and cod_medico = 3 and (year(fec_consulta) = year(dateadd(day,-1,getdate())) and 
	month(fec_consulta) = month(dateadd(day,-1,getdate())) and day(fec_consulta) = day(dateadd(day,-1,getdate()))) or
	datediff(hours, fec_consulta, getdate()) < 24 )


---------------------------------
--de nuevo los mecanicos

--2.1 Se quiere saber por cada unidad cu�nto fue el monto total pagado por a�o, adem�s cu�ndo se le realiz� el primer y el �ltimo mantenimiento y cu�ntos han sido realizados a estos veh�culos en ese per�odo de tiempo. Siempre que el promedio del monto haya sido superior a los $ 2.000.
select
	year(fec_manenim) Anio, cod_unidad Unidad, sum(monto) 'Monto Total', min(fec_mantenim) 'Primer Mantenim' ,max(fec_mantenim) 'Ulitmo Mantenim', 
	count(*) 'Cantidad de mantenimientos '
from
	mantenimientos m
group by
	cod_unidad, year(fec_mantenim)
having
	avg(monto) > 2000


--2.2. Emitir un listado con los datos unidades, incluido el nombre del responsable, los mantenimientos realizados a dichas unidades y el mec�nico encargado de las mismas. Pero solo aquellos donde el responsable tenga tel�fono conocido y los mec�nicos tengan especialidad diesel o gas. Ordene por fecha de mantenimiento en forma ascendente y nombre de responsable en forma descendente. Rotule. Para la composici�n de las tablas utilice Join.
select
	u.cod_unidad 'Codigo Unidad', marca + space(2) + modelo 'Descripcion Unidad', fec_compra 'Fecha Compra', nombre Responsable, nom_mecanico Mecanico, fec_mantenim 'Fecha Mantenimiento'
from
	responsables r join unidades u on r.cod_responsable = u.cod_responsable
	join mantenimientos ma on ma.cod_unidad = u.cod_unidad
	join mecanicos me on me.cod_mecanico = ma.cod_mecanico
where
	tel_responsable is not null and especialidad like '%[diesel, gas]%'
order by
	6, 4 desc

--2.3. �Cu�nto fue el monto total gastado en mantenimientos el mes pasado? Adem�s, �cu�ntos mantenimientos se realizaron y cu�l fue el m�s caro y el m�s barato?
select
	sum(monto) 'Monto Total', min(monto) 'Monto mas barato' ,max(monto) 'Monto mas caro', 
	count(*) 'Cantidad de mantenimientos'
from
	mantenimientos m
where
	year(fec_mantenim) = year(dateadd(month,-1,getdate())) and month(fec_mantenim) = month(dateadd(month,-1,getdate()))

--2.4. Realice los siguientes movimientos
--d. Dar de alta a un nuevo mec�nico (cod_mecanico es identity)
--e. El responsable n�mero 123 actualiz� los datos referidos a la direcci�n y a su tel�fono
--f. Se cometi� un cometi� un error al registrar el veh�culo nro. 35. Debe eliminar dicho registro

d. insert into mecanicos values(
	'Leon Boller', 'San Martin esq. Dean Funes', 3519099900,'gomeria'
)

e. update responsables
	set direccion = 'al lado axcasfdasf', tel_responsable = 123154252342
	where cod_responsable = 123

f. delete from unidades
	where cod_unidad = 35