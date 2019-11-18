create or replace package Nivel1Solicitud as 
procedure agregarSolicitud(nombre varchar2,
        estado varchar2, descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2);
procedure actualizarDatos(codigoA int, codigoN int, nombre varchar2,
        estadoN varchar2, descripcionN varchar2,cliente varchar2, funcionario varchar2);
procedure eliminarDatos(codigoN int);
function buscarSolicitud(codigoN int) return varchar2;

end Nivel1Solicitud;
/

create or replace package body Nivel1Solicitud as
    --Metodo para agregar datos
    procedure agregarSolicitud(nombre varchar2,
        estado varchar2, descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2) is
    begin
        insert into solicitud values(SEQ_SOLICITUD.nextval, nombre, estado, descripcion, cliente, funcionario,producto);
    end;

    --Metodo para actualizar datos
    procedure actualizarDatos(codigoA int, codigoN int, nombre varchar2,
        estadoN varchar2, descripcionN varchar2,cliente varchar2, funcionario varchar2) is
    begin
        update solicitud
        set codigo = codigoN, nombretipo = nombre, estado = estadoN, descripcion = descripcionN, cliente_cedula = cliente, 
        funcionario_cedula = funcionario 
        where codigo = codigoA;
    end;

    --Metodo para eliminar datos
    procedure eliminarDatos(codigoN int) is
    begin
        delete from solicitud
        where codigo = codigoN;
    end;

    --Funcion para consultar
    function buscarSolicitud(codigoN int) return varchar2 is
        nombreN varchar2(30);
    begin 
        select nombretipo into nombreN
        from solicitud 
        where codigo = codigoN;
        return nombreN;
    end;
end Nivel1Solicitud;
/