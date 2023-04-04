*&---------------------------------------------------------------------*
*& Report zabap_oop_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_oop_1.

PARAMETERS: p_num1 TYPE int4,
            p_num2 TYPE int4.

DATA: gv_sum TYPE int4.

" CLASS lcl_main DEFINITION DEFERRED. " eski yöntem create object yapsaydık bunu kullanmak gerekecekti
CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    METHODS: sum_numbers RETURNING VALUE(mv_sum) TYPE int4.

    DATA: mv_sum TYPE int4.
ENDCLASS.

CLASS lcl_main IMPLEMENTATION.
  METHOD sum_numbers.
    mv_sum = p_num1 + p_num2.
  ENDMETHOD.
ENDCLASS.


CLASS lcl_main2 DEFINITION.
  PUBLIC SECTION.

    DATA: rv_res TYPE p LENGTH 4 DECIMALS 2.
    METHODS: sum_numbers
      IMPORTING iv_num1 TYPE int4
                iv_num2 TYPE int4
      EXPORTING ev_res  TYPE int4,

      sub_numbers
        IMPORTING iv_nu2 TYPE int4
        CHANGING  cv_res TYPE int4,

      divide_numbers
        IMPORTING iv_n1         TYPE int4
                  iv_n2         TYPE int4
        RETURNING VALUE(rv_res) LIKE rv_res.

ENDCLASS.

CLASS lcl_main2 IMPLEMENTATION.
  METHOD sum_numbers.
    ev_res = iv_num1 + iv_num2.
  ENDMETHOD.

  METHOD sub_numbers.
    cv_res = cv_res - iv_nu2.
  ENDMETHOD.

  METHOD divide_numbers.
    rv_res = iv_n1 / iv_n2.
  ENDMETHOD.
ENDCLASS.



START-OF-SELECTION.

  DATA(temp_cl) = NEW lcl_main( ).

*  WRITE: temp_cl->sum_numbers( ).

  DATA(temp_cl1) = NEW lcl_main2( ).

  temp_cl1->sum_numbers(
   EXPORTING
     iv_num1 = p_num1
     iv_num2 = p_num2
   IMPORTING
     ev_res  = gv_sum
 ).

  temp_cl1->sub_numbers(
    EXPORTING
      iv_nu2 = p_num1
    CHANGING
      cv_res = p_num2
  ).

  DATA(rv_res) = temp_cl1->divide_numbers(
    EXPORTING
      iv_n1  = p_num1
      iv_n2  = p_num2
  ).
  BREAK-POINT.
