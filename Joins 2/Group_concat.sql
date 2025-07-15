USE educacion;

select  e.nombre as nombre_estudiante, group_concat(a.nombre separator', ') as asignaturas,
c.id_colegio as id_colegio, c.nombre as nombre_colegio, c. ubicacion as cole_ubicacion
from colegio c 
right join estudiante e on e.id_colegio = c.id_colegio
right join asignatura_estudiante ae on e.id_estudiante= ae.id_estudiante
right join asignatura a on a.id_asignatura = ae.id_asignatura group by e.id_estudiante;

select c.nombre as nombre_colegio, group_concat(e.nombre separator', ') as estudiante
from colegio c
inner join estudiante e on c.id_colegio = e.id_colegio group by c.id_colegio;



