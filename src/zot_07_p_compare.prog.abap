*&---------------------------------------------------------------------*
*& Report zot_07_p_compare
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_07_p_compare.

TYPES: BEGIN OF ty_imports,
         import TYPE c LENGTH 6,
       END OF ty_imports.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_word1 TYPE c LENGTH 6,
              p_word2 TYPE c LENGTH 6,
              p_word3 TYPE c LENGTH 6,
              p_word4 TYPE c LENGTH 6,
              p_word5 TYPE c LENGTH 6.
SELECTION-SCREEN END OF BLOCK b1.

DATA: gt_imports TYPE TABLE OF ty_imports.
DATA gv_result TYPE string.
"START-OF-SELECTION.

AT SELECTION-SCREEN.

  gv_result = COND #( WHEN strlen( p_word1 ) NE 6 THEN 'En az 6 tane harf giriniz.'
                      WHEN strlen( p_word2 ) NE 6 THEN 'En az 6 tane harf giriniz.'
                      WHEN strlen( p_word3 ) NE 6 THEN 'En az 6 tane harf giriniz.'
                      WHEN strlen( p_word4 ) NE 6 THEN 'En az 6 tane harf giriniz.'
                      WHEN strlen( p_word5 ) NE 6 THEN 'En az 6 tane harf giriniz.' ).

  IF gv_result IS NOT INITIAL.
    MESSAGE gv_result TYPE 'E' DISPLAY LIKE 'I'.
  ENDIF.


  gt_imports = VALUE #( BASE  gt_imports ( import = p_word1 )
                                         ( import = p_word2 )
                                         ( import = p_word3 )
                                         ( import = p_word4 )
                                         ( import = p_word5 )  ).

  cl_demo_output=>write(  gt_imports ).
  cl_demo_output=>display( ).
