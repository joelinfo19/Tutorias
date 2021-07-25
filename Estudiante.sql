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

CREATE PROC SP_ELIMINARESTUDIANTE
@ESTUDIANTE varchar(6)
as 
delete Estudiante
Where Estudiante =@ESTUDIANTE

go
create proc SP_LISTARESTUDIANTE
as
select Estudiante,Nombres,Apellidos,SemestreActivo,EscuelaProfesional,codigoEP,AIngreso from Estudiante

go
create proc SP_BUSCARESTUDIANTE
@BUSCAR nvarchar(20)
as
select Estudiante,Nombres,Apellidos,SemestreActivo,EscuelaProfesional,codigoEP,AIngreso
from Estudiante
where Nombres like @BUSCAR + '%'