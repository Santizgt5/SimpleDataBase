create or replace package Nivel1Funcionario as 
procedure agregarFuncionario(cedula varchar2, nombre varchar2,
        nacimiento varchar2, direccion varchar2, telefono varchar2);
procedure actualizarDatos(cedulaA varchar2, cedulaN varchar2,nombreN varchar2,
        nacimiento varchar2, direccionN varchar2, telefonoN varchar2);
procedure eliminarDatos(cedulaN varchar2);
function buscarFuncionario(cedulaN varchar2) return varchar2;

end Nivel1Funcionario;
/
create or replace package body Nivel1Funcionario as
    --Metodo para agregar datos
    procedure agregarFuncionario(cedula varchar2, nombre varchar2,
        nacimiento varchar2, direccion varchar2, telefono varchar2) is
    begin
        insert into funcionario values(cedula, nombre, nacimiento, direccion, telefono);
    end;

    --Metodo para actualizar datos
    procedure actualizarDatos(cedulaA varchar2, cedulaN varchar2,nombreN varchar2,
        nacimiento varchar2, direccionN varchar2, telefonoN varchar2) is
    begin
        update funcionario
        set cedula = cedulaN, nombre = nombreN, fechanacimiento = nacimiento, direccion = direccionN, telefono = telefonoN
        where cedula = cedulaA;
    end;

    --Metodo para eliminar datoss
    procedure eliminarDatos(cedulaN varchar2) is
    begiN
        delete from funcionario
        where cedula = cedulaN;
    end;

    --Funcion para consultar
    function buscarFuncionario(cedulaN varchar2) return varchar2 is
        nombreN varchar2(30);
    begin 
        select nombre into nombreN
        from funcionario 
        where cedula = cedulaN;
        return nombreN;
    end;
end Nivel1Funcionario;
/