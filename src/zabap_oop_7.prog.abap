*&---------------------------------------------------------------------*
*& Report zabap_oop_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_oop_7.

CLASS lcl_animal DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      get_num_of_legs ABSTRACT RETURNING VALUE(rv_legs) TYPE i, " interface gibidir
      get_num_of_arms RETURNING VALUE(rv_arms) TYPE i. " inheritance gibidir
    " CLASS-METHODS:
    " yyy ABSTRACT. " Static methods cannot be redefined, which means they cannot be declared "ABSTRACT".
    DATA:
      mv_legs TYPE i,
      mv_arms TYPE i.

ENDCLASS.

CLASS lcl_animal IMPLEMENTATION.
  METHOD get_num_of_arms. " diğer metot abstract old.için code completion yardımında görünmüyor.
    rv_arms = mv_arms.
  ENDMETHOD.

  " METHOD yyy.

  " ENDMETHOD.
ENDCLASS.

CLASS lcl_cat DEFINITION INHERITING FROM lcl_animal.

  PUBLIC SECTION.
    METHODS: constructor,
      " xxx ABSTRACT IMPORTING ddd type string, " Abstract methods can only be defined in abstract classes.
      get_num_of_legs REDEFINITION.

ENDCLASS.

CLASS lcl_cat IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    mv_arms = 0.
    mv_legs = 4.
  ENDMETHOD.

  METHOD get_num_of_legs.
    rv_legs = mv_legs.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_bird DEFINITION INHERITING FROM lcl_animal.

  PUBLIC SECTION.
    METHODS: constructor,
      " xxx ABSTRACT IMPORTING ddd type string, " Abstract methods can only be defined in abstract classes.
      get_num_of_legs REDEFINITION.

ENDCLASS.

CLASS lcl_bird IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    mv_arms = 2.
    mv_legs = 2.
  ENDMETHOD.

  METHOD get_num_of_legs.
    rv_legs = mv_legs.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  " data(animal) = new lcl_animal( )->get_num_of_legs( ). " Instances of the abstract class cannot be generated.
  DATA(catlegs) = NEW lcl_cat( )->get_num_of_legs( ).
  DATA(catarms) = NEW lcl_cat( )->get_num_of_arms( ).
  DATA(birdlegs) = NEW lcl_bird( )->get_num_of_legs( ).
  DATA(birdarms) = NEW lcl_bird( )->get_num_of_arms( ).


  BREAK-POINT.
