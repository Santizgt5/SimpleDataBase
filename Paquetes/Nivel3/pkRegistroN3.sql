CREATE OR REPLACE PACKAGE pkRegistroN3 as
function verificarCliente(cedula VARCHAR2) RETURN NUMBER;
procedure solicitudModificar(codigo varchar2, descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2);
procedure solicitudCrear(codigo varchar2, descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2);
procedure solicitudEliminar(codigo varchar2, descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2);

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

    
        procedure solicitudModificar(codigo varchar2, descripcion varchar2,cliente varchar2, funcionario varchar2, 
                producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2) is
        begin
                pkRegistro.solicitudModificar(codigo, descripcion, cliente, funcionario,  producto);

                coderror := 0; 
                mensaje := '';
    
                EXCEPTION
                WHEN OTHERS THEN 
                coderror := SQLCODE;
                mensaje := SQLERRM;
        end;

        procedure solicitudCrear(codigo varchar2, descripcion varchar2,cliente varchar2, funcionario varchar2, 
                producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2) is
        begin
                pkRegistro.solicitudCrear(codigo, descripcion, cliente, funcionario,  producto);

                coderror := 0; 
                mensaje := '';
    
                EXCEPTION
                WHEN OTHERS THEN 
                coderror := SQLCODE;
                mensaje := SQLERRM;
        end;

        procedure solicitudEliminar(codigo varchar2, descripcion varchar2,cliente varchar2, funcionario varchar2, 
                producto varchar2, coderror OUT NUMBER, mensaje OUT VARCHAR2) is
        begin
                pkRegistro.solicitudCrear(codigo, descripcion, cliente, funcionario,  producto);

                coderror := 0; 
                mensaje := '';
    
                EXCEPTION
                WHEN OTHERS THEN 
                coderror := SQLCODE;
                mensaje := SQLERRM;
        end;

end pkRegistroN3;
/