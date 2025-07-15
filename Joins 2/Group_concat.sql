USE gestion_descargas;
select u.name as User_name, list.name as Lista_podcast_name, pod.nombre as podcast_name
from user as u, lista_descarga as list, podcast as pod
where list.User_user_id= u.user_id AND pod.podcast_id= list.lista_descarga_id;


select u.name, ld.name, p.nombre from user u, lista_descarga ld, detalle_descarga dd, podcast p
where u.user_id = ld.User_user_id
and ld.lista_descarga_id = dd.lista_descarga_id
and dd.podcast_id = p.podcast_id
and u.user_id=1;

select  e.nombre as nombre_estudiante, group_concat(a.nombre separator', ') as asignaturas,
c.id_colegio as id_colegio, c.nombre as nombre_colegio, c. ubicacion as cole_ubicacion
from colegio c 
right join estudiante e on e.id_colegio = c.id_colegio
right join asignatura_estudiante ae on e.id_estudiante= ae.id_estudiante
right join asignatura a on a.id_asignatura = ae.id_asignatura group by e.id_estudiante;

select c.nombre as nombre_colegio, group_concat(e.nombre separator', ') as estudiante
from colegio c
inner join estudiante e on c.id_colegio = e.id_colegio group by c.id_colegio;



