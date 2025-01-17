CLASS zcl_main_anc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_main_anc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lo_customer_manager TYPE REF TO zcl_customer_manager_anc, " Objeto gestor de clientes
          lv_status_code      TYPE i,                          " Código de estado
          lt_clientes         TYPE TABLE OF ztcustomer_anc,    " Tabla de clientes
          ls_cliente          TYPE ztcustomer_anc,             " Estructura para cliente
          lv_message          TYPE string.                     " Mensaje para salida

    CREATE OBJECT lo_customer_manager.

    lv_message = 'Insertando registros en la tabla de clientes...'.
    out->write( lv_message ).

    " Insertar cliente 1
    lo_customer_manager->delete_customer( EXPORTING id = 'CLIENTE001' IMPORTING check_code = lv_status_code ).
    lo_customer_manager->add_customer( EXPORTING id = 'CLIENTE001'
                                                 name = 'Rosa de Castro'
                                                 activo = 'X'
                                       IMPORTING check_code = lv_status_code ).
    IF lv_status_code = 0.
      lv_message = 'Registro CLIENTE001 agregado correctamente.'.
    ELSE.
      lv_message = 'Error al agregar CLIENTE001.'.
    ENDIF.
    out->write( lv_message ).

    " Insertar cliente 2
    lo_customer_manager->delete_customer( EXPORTING id = 'CLIENTE002' IMPORTING check_code = lv_status_code ).
    lo_customer_manager->add_customer( EXPORTING id = 'CLIENTE002'
                                                 name = 'Federico Torres'
                                                 activo = ' '
                                       IMPORTING check_code = lv_status_code ).
    IF lv_status_code = 0.
      lv_message = 'Registro CLIENTE002 agregado correctamente.'.
    ELSE.
      lv_message = 'Error al agregar CLIENTE002.'.
    ENDIF.
    out->write( lv_message ).

    " Insertar cliente 3
    lo_customer_manager->delete_customer( EXPORTING id = 'CLIENTE003' IMPORTING check_code = lv_status_code ).
    lo_customer_manager->add_customer( EXPORTING id = 'CLIENTE003'
                                                 name = 'Pantoja'
                                                 activo = 'X'
                                       IMPORTING check_code = lv_status_code ).
    IF lv_status_code = 0.
      lv_message = 'Registro CLIENTE003 agregado correctamente.'.
    ELSE.
      lv_message = 'Error al agregar CLIENTE003.'.
    ENDIF.
    out->write( lv_message ).

    " Insertar cliente 4
    lo_customer_manager->delete_customer( EXPORTING id = 'CLIENTE004' IMPORTING check_code = lv_status_code ).
    lo_customer_manager->add_customer( EXPORTING id = 'CLIENTE004'
                                                 name = 'Carmen de Mairena'
                                                 activo = ' '
                                       IMPORTING check_code = lv_status_code ).
    IF lv_status_code = 0.
      lv_message = 'Registro CLIENTE004 agregado correctamente.'.
    ELSE.
      lv_message = 'Error al agregar CLIENTE004.'.
    ENDIF.
    out->write( lv_message ).

    lv_message = 'Actualizando registros en la tabla...'.
    out->write( lv_message ).

    " Actualizar cliente 2
    lo_customer_manager->update_customer( EXPORTING id = 'CLIENTE002'
                                                    name = 'Mónica Naranjo'
                                                    activo = 'X'
                                          IMPORTING check_code = lv_status_code ).
    IF lv_status_code = 0.
      lv_message = 'Registro CLIENTE002 actualizado correctamente.'.
    ELSE.
      lv_message = 'Error al actualizar CLIENTE002.'.
    ENDIF.
    out->write( lv_message ).

    " Actualizar cliente 3
    lo_customer_manager->update_customer( EXPORTING id = 'CLIENTE003'
                                                    name = 'Rocío Jurado'
                                                    activo = ' '
                                          IMPORTING check_code = lv_status_code ).
    IF lv_status_code = 0.
      lv_message = 'Registro CLIENTE003 actualizado correctamente.'.
    ELSE.
      lv_message = 'Error al actualizar CLIENTE003.'.
    ENDIF.
    out->write( lv_message ).

    lv_message = 'Eliminando registros de la tabla...'.
    out->write( lv_message ).

    " Eliminar cliente 4
    lo_customer_manager->delete_customer( EXPORTING id = 'CLIENTE004'
                                          IMPORTING check_code = lv_status_code ).
    IF lv_status_code = 0.
      lv_message = 'Registro CLIENTE004 eliminado correctamente.'.
    ELSE.
      lv_message = 'Error al eliminar CLIENTE004.'.
    ENDIF.
    out->write( lv_message ).

    lv_message = 'Consultando registros en la tabla...'.
    out->write( lv_message ).

    " Consultar TODOS los registros
    SELECT * FROM ztcustomer_anc INTO TABLE @lt_clientes.

    LOOP AT lt_clientes INTO ls_cliente.
      lv_message = |ID: { ls_cliente-customer_id }, Nombre: { ls_cliente-customer_name }, Activo: { ls_cliente-customer_activo }|.
      out->write( lv_message ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
