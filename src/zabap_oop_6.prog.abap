*&---------------------------------------------------------------------*
*& Report zabap_oop_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_oop_6.

INTERFACE lif_animal.

  METHODS:
    get_num_of_arms RETURNING VALUE(rv_arms) TYPE i,
    get_num_of_legs RETURNING VALUE(rv_legs) TYPE i.

  DATA:
    mv_arms TYPE i,
    mv_legs TYPE i.

ENDINTERFACE.

CLASS lcl_cat DEFINITION.
  PUBLIC SECTION.
    METHODS:
      constructor.

    INTERFACES: lif_animal. " interface i bir class içinde tanımladıysak interface in tüm metodlarını kullanmak zorundayız
ENDCLASS.

CLASS lcl_cat IMPLEMENTATION.
  METHOD constructor.
    lif_animal~mv_arms = 0.
    lif_animal~mv_legs = 4.
  ENDMETHOD.

  METHOD lif_animal~get_num_of_arms.
    rv_arms = lif_animal~mv_arms.
  ENDMETHOD.

  METHOD lif_animal~get_num_of_legs.
    rv_legs = lif_animal~mv_legs.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_bird DEFINITION.
  PUBLIC SECTION.
    METHODS:
      constructor.

    INTERFACES: lif_animal. " interface i bir class içinde tanımladıysak interface in tüm metodlarını kullanmak zorundayız
ENDCLASS.

CLASS lcl_bird IMPLEMENTATION.
  METHOD constructor.
    lif_animal~mv_arms = 2.
    lif_animal~mv_legs = 2.
  ENDMETHOD.

  METHOD lif_animal~get_num_of_arms.
    rv_arms = lif_animal~mv_arms.
  ENDMETHOD.

  METHOD lif_animal~get_num_of_legs.
    rv_legs = lif_animal~mv_legs.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  DATA(catarms) = NEW lcl_cat( )->lif_animal~get_num_of_arms( ).
  DATA(catlegs) = NEW lcl_cat( )->lif_animal~get_num_of_legs( ).
  DATA(birdarms) = NEW lcl_bird( )->lif_animal~get_num_of_arms( ).
  DATA(birdlegs) = NEW lcl_bird( )->lif_animal~get_num_of_legs( ).



  BREAK-POINT.
