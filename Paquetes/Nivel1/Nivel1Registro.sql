create or replace package Nivel1Registro as 
procedure agregarRegistro(fechaI date, fechaF varchar2,idr number);
procedure actualizarDatos(fechaI date, fechaF date, idr number);
procedure eliminarDatos(idN varchar2);
function buscarRegistro(idN varchar2) return varchar2;
end Nivel1Registro;
/
create or replace package body Nivel1Registro as
    --Metodo para agregar datos
    procedure agregarRegistro(fechaI date, fechaF varchar2,
        idr number) is
    begin
        insert into registro values(fechaI, fechaF, idr);
    end;


    --Metodo para actualizar datos
    procedure actualizarDatos(fechaI date, fechaF date, idr number) is
    begin
        update registro
        set fechainicio = fechaI, fechafin = fechaF
        where registro_id = idr;
    end;


    --Metodo para eliminar datos
    procedure eliminarDatos(idN varchar2) is
    begin
        delete from registro
        where registro_id = idN;
    end;


    --Funcion para consultar
    function buscarRegistro(idN varchar2) return varchar2 is
    fechaI varchar2(30);
    begin 
        select fechainicio into fechaI
        from registro 
        where registro_id = idN;
        return fechaI;
    end;
end Nivel1Registro;
/