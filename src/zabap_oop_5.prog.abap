*&---------------------------------------------------------------------*
*& Report zabap_oop_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_oop_5.

CLASS lcl_animal DEFINITION.
  PUBLIC SECTION.
    METHODS:
      get_num_of_legs RETURNING VALUE(rv_legs) TYPE i,
      get_num_of_arms RETURNING VALUE(rv_arms) TYPE i.

    DATA: mv_legs TYPE i,
          mv_arms TYPE i.

ENDCLASS.

CLASS lcl_animal IMPLEMENTATION.

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

START-OF-SELECTION.

  DATA(animal1) = NEW lcl_animal( )->get_num_of_legs( ).
  DATA(animal2) = NEW lcl_animal( )->get_num_of_arms( ).
  DATA(catlegs) = NEW lcl_cat( )->get_num_of_legs( ).
  DATA(catarms) = NEW lcl_cat( )->get_num_of_arms( ).


  BREAK-POINT.
