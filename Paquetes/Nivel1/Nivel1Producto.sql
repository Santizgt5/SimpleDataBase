create or replace package Nivel1Producto as 
procedure agregarProducto(codigo varchar2, nombre varchar2,
        descripcion varchar2, registro number);
procedure actualizarDatos(codigoA varchar2, codigoN varchar2, nombre varchar2,
        descripcionN varchar2, registro number);
procedure eliminarDatos(codigoN varchar2);
function buscarProducto(codigoN varchar2) return varchar2;

end Nivel1Producto;
/
create or replace package body Nivel1Producto as
    --Metodo para agregar datos
    procedure agregarProducto(codigo varchar2, nombre varchar2,
        descripcion varchar2, registro number) is
    begin
        insert into producto values(codigo, nombre, descripcion, registro);
    end;


    --Metodo para actualizar datos
    procedure actualizarDatos(codigoA varchar2, codigoN varchar2, nombre varchar2,
        descripcionN varchar2, registro number) is
    begin
        update producto
        set codigo = codigoN, nombretipo = nombre, descripcion = descripcionN, 
        registro_registro_id = registro 
        where codigo = codigoA;
    end;


    --Metodo para eliminar datos
    procedure eliminarDatos(codigoN varchar2) is
    begin
        delete from producto
        where codigo = codigoN;
    end;


    --Funcion para consultar
    function buscarProducto(codigoN varchar2) return varchar2 is
    nombreN varchar2(30);
    begin 
        select nombretipo into nombreN
        from producto 
        where codigo = codigoN;
        return nombreN;
    end;
end Nivel1Producto;
/