*&---------------------------------------------------------------------*
*& Report zabap_oop_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_oop_4.

CLASS lcl_animal DEFINITION.
  PUBLIC SECTION.
    METHODS:
      constructor,
      get_num_of_legs RETURNING VALUE(rv_legs) TYPE i,
      get_num_of_arms RETURNING VALUE(rv_arms) TYPE i.
    CLASS-METHODS:
      class_constructor.

    DATA: mv_legs TYPE i,
          mv_arms TYPE i.

ENDCLASS.

CLASS lcl_animal IMPLEMENTATION.
  METHOD constructor.

  ENDMETHOD.

  METHOD class_constructor.

  ENDMETHOD.

  METHOD get_num_of_legs.
    rv_legs = mv_legs.

  ENDMETHOD.

  METHOD get_num_of_arms.
    rv_arms = mv_arms.
  ENDMETHOD.

ENDCLASS.

CLASS lcl_cat DEFINITION INHERITING FROM lcl_animal.
  PUBLIC SECTION.
    METHODS:
      constructor.
ENDCLASS.

CLASS lcl_cat IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    mv_legs = 4.
    mv_arms = 0.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_bird DEFINITION INHERITING FROM lcl_animal.
  PUBLIC SECTION.
    METHODS:
      constructor.
ENDCLASS.

CLASS lcl_bird IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    mv_legs = 2.
    mv_arms = 2.
  ENDMETHOD.
ENDCLASS.


START-OF-SELECTION.

  DATA(catlegs) = NEW lcl_cat( )->get_num_of_legs( ).
  DATA(catarms) = NEW lcl_cat( )->get_num_of_arms( ).
  DATA(birdlegs) = NEW lcl_bird( )->get_num_of_legs( ).
  DATA(birdarms) = NEW lcl_bird( )->get_num_of_arms( ).

  BREAK-POINT.
