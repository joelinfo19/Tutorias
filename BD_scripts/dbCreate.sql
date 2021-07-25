CREATE DATABASE Tutorias
drop table Estudiante
create table Estudiante(
	IdEstudiante int identity(1,1) ,
	CodEstudiante as ('AL'+right('00'+convert(varchar,IdEstudiante),(2))),
	Nombres varchar(20),
	Apellidos varchar(20),
	SemestreActivo varchar(12),
	Estudiante varchar(6),
	EscuelaProfesional varchar (20),
	codigoEP varchar(5),
	AIngreso varchar(12),
	PRIMARY KEY (IdEstudiante)
);
go
--drop table Estudiante
go
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
go
drop proc SP_INSERTARESTUDIANTE
go
CREATE PROC SP_BUSCARESTUDIANTE
@BUSCAR varchar(20)
as
select * from Estudiante
where Nombres like @BUSCAR + '%'
---PROCEDIMIENTO ALMACENADO INSERTAR ESTUDIANTE
create proc SP_INSERTARESTUDIANTE
@NOMBRES varchar(20),
@APELLIDOS varchar(20),
@ESCUELAPROFESIONAL varchar(20),
@SEMESTREACTIVO varchar(12),
@ESTUDIANTE varchar(6),
@CODIGOEP varchar(5),
@AINGRESO varchar(12)
as 
insert into Estudiante values (@NOMBRES,@APELLIDOS,@SEMESTREACTIVO,@ESTUDIANTE,@ESCUELAPROFESIONAL,@CODIGOEP,@AINGRESO)
GO
---PROCEDIMIENTO ALMACENADO EDITARESTUDIANTE
DROP PROC SP_EDITARESTUDIANTE
GO
create proc SP_EDITARESTUDIANTE
@NOMBRES varchar(20),
@APELLIDOS varchar(20),
@ESCUELAPROFESIONAL varchar(20),
@SEMESTREACTIVO varchar(12),
@ESTUDIANTE varchar(6),
@CODIGOEP varchar(5),
@AINGRESO varchar(12)
as 
update Estudiante set Nombres=@NOMBRES,Apellidos=@APELLIDOS,SemestreActivo=@SemestreActivo, EscuelaProfesional=@ESCUELAPROFESIONAL,codigoEP=@CODIGOEP,
AIngreso=@AINGRESO
where Estudiante =@ESTUDIANTE
GO
--------------------------------------------
drop proc SP_ELIMINARESTUDIANTE
go
---PROCEDIMIENTO ALMACENADO ELiminarESTUDIANTE
CREATE PROC SP_ELIMINARESTUDIANTE
@ESTUDIANTE varchar(6)
as 
delete Estudiante
Where Estudiante =@ESTUDIANTE
----Listing Student
go
EXEC SP_LISTARESTUDIANTE
go
create proc SP_LISTARESTUDIANTE
as
select Estudiante,Nombres,Apellidos,SemestreActivo,EscuelaProfesional,codigoEP,AIngreso from Estudiante
--- Search students
go
drop proc SP_BUSCARESTUDIANTE
go
create proc SP_BUSCARESTUDIANTE
@BUSCAR nvarchar(20)
as
select Estudiante,Nombres,Apellidos,SemestreActivo,EscuelaProfesional,codigoEP,AIngreso
from Estudiante
where Nombres like @BUSCAR + '%'


--drop procedure SP_BUSCARESTUDIANTE
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

exec SP_LISTARDOCENTE

drop procedure SP_LISTARDOCENTE






drop procedure SP_ELIMINARDOCENTE




select * from Docente
select * from Estudiante
exec SP_BUSCARDOCENTE 'a'
exec SP_LISTARESTUDIANTE
exec SP_INSERTARDOCENTE 'pepe','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas'
exec SP_EDITARDOCENTE 3,'adriana','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas'

insert into Docente values ('juan','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas')
insert into Docente values ('joel','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas')
insert into Docente values ('adriana','martinez','magister','Informatica,mecanica,electrica y electronica','Ing Informatica y de Sistemas')

ALTER TABLE Docente
ALTER COLUMN Facultad varchar(60);
ALTER TABLE Docente
ALTER COLUMN IdDocente int identity(1,1);
DELETE FROM Docente WHERE Nombres='adriana';]
drop table Docente


select * from Estudiante
exec SP_LISTARESTUDIANTE