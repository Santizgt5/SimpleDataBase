CREATE OR REPLACE PACKAGE pkRegistro as
procedure verificarCliente(cedula varchar2);
FUNCTION is_number(p_string IN VARCHAR2) RETURN INT;
procedure solicitudModificar(codigo varchar2, descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2);
procedure solicitudCrear(codigo varchar2, descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2);
procedure solicitudEliminar(codigo varchar2, descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2);

END pkRegistro;
/
CREATE OR REPLACE PACKAGE BODY pkRegistro as

    procedure verificarCliente(cedula varchar2) is
        vClient varchar2(30);
    begin
    vClient := Nivel1Cliente.buscarCliente(cedula);
    if vClient = NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'El cliente no esta registrado');
    end if;
    end;

    FUNCTION is_number (p_string IN VARCHAR2) RETURN INT IS
        v_new_num NUMBER;
    BEGIN
        v_new_num := TO_NUMBER(p_string);
        RETURN 1;
    EXCEPTION
    WHEN VALUE_ERROR THEN
        RETURN 0;
    END is_number;    

    --Metodo para crear solicitud de tipo modificar
    procedure solicitudModificar(codigo varchar2,descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2) is
        vClient varchar2(30);
    begin
    if is_number(codigo) = 1 then
        vClient := Nivel1Cliente.buscarCliente(cliente);
        if vClient = NULL THEN
          RAISE_APPLICATION_ERROR(-20001, 'El cliente no está registrado en la base de datos.');
        else
            Nivel1Solicitud.agregarSolicitud(codigo, 'Modificar', 'Pendiente', descripcion, cliente, funcionario, producto);
        end if;
    else
       RAISE_APPLICATION_ERROR(-20001, 'Codigo invalido.');
    end if;

        EXCEPTION
        WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(SQLCODE,SQLERRM );

    end;

    --Metodo para crear solicitud de tipo crear
    procedure solicitudCrear(codigo varchar2,descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2) is
        vClient varchar2(30);
    begin
    if is_number(codigo) = 1 then
        vClient := Nivel1Cliente.buscarCliente(cliente);
        if vClient = NULL then 
           RAISE_APPLICATION_ERROR(-20001, 'El cliente no está registrado en la base de datos.');
        else
            Nivel1Solicitud.agregarSolicitud(codigo, 'Crear', 'Pendiente', descripcion, cliente, funcionario, producto);
        end if;
    else
        RAISE_APPLICATION_ERROR(-20001, 'Codigo invalido.');
    end if;

        EXCEPTION
        WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(SQLCODE,SQLERRM);

    end;
        
    --Metodo para crear solicitud de tipo eliminar    
    procedure solicitudEliminar(codigo varchar2,descripcion varchar2,cliente varchar2, funcionario varchar2, producto varchar2) is
        vClient varchar2(30);
    begin
    if is_number(codigo) = 1 then
        vClient := Nivel1Cliente.buscarCliente(cliente);
        if vClient = NULL then 
            RAISE_APPLICATION_ERROR(-20001, 'El cliente no está registrado en la base de datos.');
        else
            Nivel1Solicitud.agregarSolicitud(codigo, 'Eliminar', 'Pendiente', descripcion, cliente, funcionario, producto);
        end if;
    else
       RAISE_APPLICATION_ERROR(-20001, 'Codigo invalido.');
    end if;

        EXCEPTION
        WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(SQLCODE,SQLERRM );
    end;


        
end pkRegistro;
/