*&---------------------------------------------------------------------*
*& Report zabap_oop_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_oop_3.

CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    METHODS:
      constructor,
      do_process IMPORTING iv_per_id   TYPE char12
                           iv_per_name TYPE char20
                           iv_per_age  TYPE numc2.
    CLASS-METHODS:
      class_constructor,
      inc_num.


    DATA:
      mv_per_id   TYPE char12,
      mv_per_name TYPE char20.

    CLASS-DATA: mv_per_age        TYPE numc2, " static data definition
                mv_counter        TYPE int4,
                mv_static_counter TYPE int4.
ENDCLASS.

CLASS lcl_main IMPLEMENTATION.
  METHOD constructor.
  ENDMETHOD.

  METHOD class_constructor.
    mv_counter += 1.
  ENDMETHOD.

  METHOD do_process.
    mv_per_id = iv_per_id.
    mv_per_name = iv_per_name.
    mv_per_age = iv_per_age.
  ENDMETHOD.

  METHOD inc_num.
    mv_static_counter += 1.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA(temp_cl) = NEW lcl_main( ).
  DATA(temp_cl2) = NEW lcl_main( ).

  temp_cl->do_process(
    EXPORTING
      iv_per_id   = '1000000001'
      iv_per_name = 'Muhammed'
      iv_per_age  = '22'
  ).
  temp_cl->do_process(
    EXPORTING
      iv_per_id   = '1000000002'
      iv_per_name = 'Furkan'
      iv_per_age  = '25'
  ).
  temp_cl->do_process(
    EXPORTING
      iv_per_id   = '1000000003'
      iv_per_name = 'Cem'
      iv_per_age  = '33'
  ).

  DATA(age) = temp_cl->mv_per_age.
  DATA(counter) = temp_cl->mv_counter.

  temp_cl->inc_num( ).
  temp_cl->inc_num( ).
  temp_cl->inc_num( ).
  temp_cl->inc_num( ).
  temp_cl->inc_num( ).
  temp_cl->inc_num( ).
  temp_cl->inc_num( ).
  temp_cl->inc_num( ).
  temp_cl->inc_num( ).
  temp_cl->inc_num( ).
  temp_cl2->inc_num( ).
  temp_cl2->inc_num( ).
  temp_cl2->inc_num( ).
  temp_cl->inc_num( ).
  temp_cl->inc_num( ).
  temp_cl->inc_num( ).

  DATA(cntr) = temp_cl->mv_static_counter.


  BREAK-POINT.
