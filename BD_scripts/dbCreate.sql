CREATE DATABASE Tutorias
create table Estudiante(
	IdEstudiante int identity(1,1) not null ,
	CodEstudiante as ('AL'+right('00'+convert(varchar,IdEstudiante),(2))),
	Nombres varchar(20),
	Apellidos varchar(20),
	Escuela varchar (20),
	PRIMARY KEY (IdEstudiante)
);
create table Docente(
	IdDocente int identity(1,1),
	Nombres varchar(20),
	Apellidos varchar(20),
	TituloAcademico varchar (20),
	Facultad varchar(60),
	EscuelaProfesional varchar(60),
	PRIMARY KEY (IdDocente)
);


insert into Estudiante
values ('lucero','quispe','informatica')
insert into Estudiante
values ('Maria','Fernandez','informatica')
--drop table Estudiante
select * from Estudiante
--------------------------------------------
---PROCEDIMIENTO ALMACENADO BUSCARESTUDIANTE
CREATE PROC SP_BUSCARESTUDIANTE
@BUSCAR varchar(20)
as
select * from Estudiante
where Nombres like @BUSCAR + '%'
---PROCEDIMIENTO ALMACENADO INSERTAR ESTUDIANTE
create proc SP_INSERTARESTUDIANTE
@NOMBRES varchar(20),
@APELLIDOS varchar(20),
@ESCUELA varchar(20)
as 
insert into Estudiante values (@NOMBRES,@APELLIDOS,@ESCUELA)

---PROCEDIMIENTO ALMACENADO EDITARESTUDIANTE

create proc SP_EDITARESTUDIANTE
@IDESTUDIANTE varchar(20),
@NOMBRES varchar(20),
@APELLIDOS varchar(20),
@ESCUELA varchar(20)
as 
update Estudiante set Nombres=@NOMBRES,Apellidos=@APELLIDOS,Escuela=@ESCUELA
where IdEstudiante =@IDESTUDIANTE
---PROCEDIMIENTO ALMACENADO ELiminarESTUDIANTE
CREATE PROC SP_ELIMINARESTUDIANTE
@IDESTUDIANTE int
as 
delete Estudiante
Where IdEstudiante=@IDESTUDIANTE
----Listing Student
create proc SP_LISTARESTUDIANTE
as
select top 100 
Estudiante.IdEstudiante,
Estudiante.CodEstudiante,
Estudiante.Nombres,
Estudiante.Apellidos,
Estudiante.Escuela
from Estudiante
order by IdEstudiante asc
select * from Estudiante
--- Search students
create proc SP_BUSCARESTUDIANTE
@BUSCAR nvarchar(20)
as
select top 100 
Estudiante.IdEstudiante,
Estudiante.CodEstudiante,
Estudiante.Nombres,
Estudiante.Apellidos,
Estudiante.Escuela
from Estudiante
order by IdEstudiante asc, 
where Nombres like @BUSCAR + '%'
---------------------------------
---Procedimientos almacenados para Docente
----Stored Procedures for search Docente
CREATE PROC SP_BUSCARDOCENTE
@BUSCAR varchar(20)
as
select * from Docente
where Nombres like @BUSCAR + '%'
---Stored Procedures for insert Docente
create proc SP_INSERTARDOCENTE
@NOMBRES varchar(20),
@APELLIDOS varchar(20),
@TITULO varchar(20),
@FACULTAD varchar(60),
@EPROFESIONAL varchar(60)
as
insert into Docente values(@NOMBRES,@APELLIDOS,@TITULO,@FACULTAD,@EPROFESIONAL)
------- Stored Procedures for update Docente
create proc SP_EDITARDOCENTE
@IDDOCENTE int,
@NOMBRES varchar(20),
@APELLIDOS varchar(20),
@TITULO varchar(20),
@FACULTAD varchar(60),
@EPROFESIONAL varchar(60)
as 
update Docente set Nombres=@NOMBRES,Apellidos=@APELLIDOS,TituloAcademico=@TITULO,Facultad=@FACULTAD,EscuelaProfesional=@EPROFESIONAL
where IdDocente =@IDDOCENTE
---------Stored Procedures for delete docente
create proc SP_ELIMINARDOCENTE
@IDDOCENTE int
as
delete Docente
where IdDocente=@IDDOCENTE
------Stored Procedured for listing Docente
create proc SP_LISTARDOCENTE
as
select top 100 
Docente.IdDocente,
Docente.Nombres,
Docente.Apellidos,
Docente.TituloAcademico,
Docente.Facultad,
Docente.EscuelaProfesional
from Docente
order by IdDocente asc
select * from Docente

--exec SP_LISTARDOCENTE

--drop procedure SP_LISTARDOCENTE






--drop procedure SP_ELIMINARDOCENTE




--select * from Docente
--select * from Estudiante
--exec SP_BUSCARDOCENTE 'a'
--exec SP_LISTARESTUDIANTE
--exec SP_INSERTARDOCENTE 'pepe','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas'
--exec SP_EDITARDOCENTE 3,'adriana','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas'

--insert into Docente values ('juan','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas')
--insert into Docente values ('joel','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas')
--insert into Docente values ('adriana','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas')

--ALTER TABLE Docente
--ALTER COLUMN Facultad varchar(60);
--ALTER TABLE Docente
--ALTER COLUMN IdDocente int identity(1,1);
--DELETE FROM Docente WHERE Nombres='adriana';]
--drop table Docente
