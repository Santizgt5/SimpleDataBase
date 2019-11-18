CREATE OR REPLACE PACKAGE pkRegistroN3 as
function verificarCliente(cedula VARCHAR2) RETURN NUMBER;
procedure solicitudModificar(descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2);
procedure solicitudCrear(descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2);
procedure solicitudEliminar(descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2);
function registrarCliente(cedula varchar2, nombre varchar2,nacimiento date, direccion varchar2,telefono varchar2) return number;
procedure registrarSolicitud(descripcion varchar2,cliente varchar2, funcionario varchar2,producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2, tipo varchar2);
END pkRegistroN3;
/

CREATE OR REPLACE PACKAGE BODY pkRegistroN3 as

        function verificarCliente(cedula varchar2) return number is
          vError number;
        begin
                pkRegistro.verificarCliente(cedula);
                return 0;  

                EXCEPTION
                WHEN OTHERS THEN
                vError := SQLCODE;
                return vError;
        END;

    
        procedure solicitudModificar(descripcion varchar2,cliente varchar2, funcionario varchar2, 
                producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2) is
        begin
                pkRegistro.solicitudModificar(descripcion, cliente, funcionario,  producto);

                coderror := 0; 
                mensaje := '';
    
                EXCEPTION
                WHEN OTHERS THEN 
                coderror := SQLCODE;
                mensaje := SQLERRM;
        end;

        procedure solicitudCrear(descripcion varchar2,cliente varchar2, funcionario varchar2, 
                producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2) is
        begin
                pkRegistro.solicitudCrear(descripcion, cliente, funcionario,  producto);

                coderror := 0; 
                mensaje := '';
    
                EXCEPTION
                WHEN OTHERS THEN 
                coderror := SQLCODE;
                mensaje := SQLERRM;
        end;

        procedure solicitudEliminar(descripcion varchar2,cliente varchar2, funcionario varchar2, 
                producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2) is
        begin
                pkRegistro.solicitudEliminar(descripcion, cliente, funcionario,  producto);

                coderror := 0; 
                mensaje := '';
    
                EXCEPTION
                WHEN OTHERS THEN 
                coderror := SQLCODE;
                mensaje := SQLERRM;
        end;

        function registrarCliente(cedula varchar2, nombre varchar2,nacimiento date, direccion varchar2,telefono varchar2) return number IS
                vError number;
        BEGIN
             pkRegistro.registrarCliente(cedula, nombre, nacimiento, direccion,telefono);
             return 0;
                
                EXCEPTION
                WHEN OTHERS THEN
                vError := SQLCODE;
                return vError;
        end;

        procedure registrarSolicitud(descripcion varchar2,cliente varchar2, funcionario varchar2, 
                producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2, tipo varchar2) is
        begin
        if tipo = 'Modificar' THEN
                solicitudModificar(descripcion,cliente, funcionario,producto,coderror,mensaje);
        end if;
        if tipo = 'Crear' THEN
                solicitudCrear(descripcion,cliente, funcionario,producto,coderror,mensaje);
        end if;
        if tipo = 'Cancelar' THEN
                solicitudEliminar(descripcion,cliente, funcionario,producto,coderror,mensaje);
        end if;

        end;

end pkRegistroN3;
/