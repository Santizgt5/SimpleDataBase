create or replace package Nivel1Cliente as 
procedure agregarCliente(cedula varchar2, nombre varchar2,
        nacimiento date, direccion varchar2,telefono varchar2, registro number);
procedure actualizarDatos(cedulaa varchar2, cedulaN varchar2, nombren varchar2,
        nacimiento date, direccionn varchar2,telefonon varchar2, registro number);
procedure eliminarDatos(cedulan varchar2);
function buscarCliente(cedulab varchar2) return varchar2;

end Nivel1Cliente;
/
create or replace package body Nivel1Cliente as
    --Metodo para agregar datos
    procedure agregarCliente(cedula varchar2, nombre varchar2,
        nacimiento date, direccion varchar2,telefono varchar2, registro number) is
    begin
        insert into cliente values(cedula, nombre, nacimiento, direccion, telefono, registro);
    end;

    --Metodo para actualizar datos
    procedure actualizarDatos(cedulaa varchar2, cedulaN varchar2, nombren varchar2,
        nacimiento date, direccionn varchar2,telefonon varchar2, registro number) is
    begin
        update cliente
        set cedula = cedulaN, nombre = nombren,fechanacimiento = nacimiento, direccion = direccion, telefono = telefonon, 
        registro_registro_id = registro 
        where cedula = cedulaa;
    end;

    --Metodo para eliminar datos
    procedure eliminarDatos(cedulan varchar2) is
    begin
        delete from cliente
        where cedula = cedulan;
    end;

    --Funcion para consultar
    function buscarCliente(cedulab varchar2) return varchar2 is
        nombreN varchar2(30);
    begin 
        select nombre into nombreN
        from cliente 
        where cedula = cedulab;
        return nombreN;
    end;
end Nivel1Cliente;
/
