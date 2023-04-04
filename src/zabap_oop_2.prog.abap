*&---------------------------------------------------------------------*
*& Report zabap_oop_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_oop_2.

PARAMETERS: p_num1 TYPE int4,
            p_num2 TYPE int4.

" CLASS lcl_main DEFINITION DEFERRED. " eski yöntem create object yapsaydık bunu kullanmak gerekecekti
CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    DATA:
      mv_num1 TYPE i,
      mv_num2 TYPE i,
      mv_res  TYPE i.
    METHODS:    constructor IMPORTING iv_num1 TYPE i
                                      iv_num2 TYPE i,
      sum_numbers RETURNING VALUE(mv_res) LIKE mv_res.


ENDCLASS.

CLASS lcl_main IMPLEMENTATION.
  METHOD constructor.
    me->mv_num1 = iv_num1. " me mv_num1 in bu class a ait olduğunu gösterir.
    me->mv_num2 = iv_num2.
  ENDMETHOD.
  METHOD sum_numbers.
    mv_res = mv_num1 + mv_num2.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  DATA(temp_cl) = NEW lcl_main(
    iv_num1 = p_num1
    iv_num2 = p_num2
  ).

  DATA(sum_resu) = temp_cl->sum_numbers( ).


  BREAK-POINT.
