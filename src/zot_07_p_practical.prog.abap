*&---------------------------------------------------------------------*
*& Report zot_07_p_practical
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_07_p_practical.
**********************************************************************
** FONKSIYON CAGIRMAK VE DENEMEK ICIN

*DATA: lv_number1 TYPE i VALUE 10,
*      lv_number2 TYPE i VALUE 5,
*      lv_op      TYPE c VALUE '*'.
" lv_result  TYPE i.
*
*CALL FUNCTION 'ZOT_07_DO_MATH_OPS'
*  EXPORTING
*    iv_number1   = lv_number1
*    iv_number2   = lv_number2
*    iv_operation = lv_op
*  IMPORTING
*    ev_result    = lv_result
*  .
*
* cl_demo_output=>write( |{ lv_number1 } x { lv_number2 } = { lv_result }| ).
* cl_demo_output=>display( ).
*
** cl_demo_output=>write( |{ lv_number1 } + { lv_number2 } = { lv_result }| ).
** cl_demo_output=>write( |{ lv_number1 } - { lv_number2 } = { lv_result }| ).
** cl_demo_output=>write( |{ lv_number1 } / { lv_number2 } = { lv_result }| ).

** FONKSIYON CAGIRMAK VE DENEMEK ICIN
**********************************************************************



**********************************************************************
** CLASS VE METHOD

*DATA(lo_math_op) = NEW zcl_ot_07_math_operations( ).
*lo_math_op->calculate_result(
*  EXPORTING
*    iv_number1   = lv_number1
*    iv_number2   = lv_number2
*    iv_operation = lv_op
*  IMPORTING
*    ev_result    = DATA(lv_result)
*).
*
* cl_demo_output=>write( |{ lv_number1 } x { lv_number2 } = { lv_result }| ).
* cl_demo_output=>display( ).

** CLASS VE METHOD
**********************************************************************





**********************************************************************
* TYPES / INTERNAL TABLE

*TYPES: gty_tip TYPE c LENGTH 12.
*
*TYPES: BEGIN OF gty_komplex,
*         alan1 TYPE c LENGTH 10,
*         alan2 TYPE c LENGTH 12,
*         alan3 TYPE i,
*       END OF gty_komplex.
*
*TYPES: BEGIN OF gty_student,
*         name  TYPE c LENGTH 10,
*         age   TYPE i,
*         id    TYPE c LENGTH 10,
*         bolum TYPE c LENGTH 20,
*       END OF gty_student.
*
*DATA: gv_alan1   TYPE  gty_tip,
*      gs_komplex TYPE  gty_komplex,
*      gv_alan2   TYPE gty_komplex-alan2,
*      gt_komplex TYPE TABLE OF gty_komplex.
*
*gv_alan1 = 'HELLO WORLD'.
*
*gs_komplex-alan1 = 'ONE'.
*gs_komplex-alan2 = 'TALENT'.
*gs_komplex-alan3 = 23.
*
*gt_komplex = VALUE #( ( alan1 = 'Bilal Furkan'
*                        alan2 = 'Erdem'
*                        alan3 = 01 )
*                      ( alan1 = 'Atiba'
*                        alan2 = 'Erdem'
*                        alan3 = 02 )
*                      ( alan1 = 'Oner'
*                        alan2 = 'Ozturk'
*                        alan3 = 03 ) ).
*
*APPEND VALUE #( alan1 = 'Mario'
*                alan2 = 'Gomez'
*                alan3 = 04 ) TO gt_komplex.
*
*APPEND VALUE #( alan1 = 'Vincent'
*                alan2 = 'Aboubakar'
*                alan3 = 05 ) TO gt_komplex.
*
*APPEND gs_komplex TO gt_komplex.
*
*gs_komplex-alan1 = 'Senol'.
*gs_komplex-alan2 = 'Gunes'.
*gs_komplex-alan3 = 06.
*APPEND gs_komplex TO gt_komplex.
*
*CLEAR gs_komplex.
*
*gs_komplex = VALUE #( alan1 = 'Oguzhan' alan2 = 'Ozyakup' alan3 = 07 ).
*APPEND gs_komplex TO gt_komplex.
*
*
*cl_demo_output=>write( gs_komplex ).
*
*cl_demo_output=>display( ).


* TYPES / INTERNAL TABLE
**********************************************************************




**********************************************************************
* SELECTION SCREEN - RADIO BUTTON


*SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
*  PARAMETERS: p_val1 TYPE i,
*              p_val2 TYPE i.
*SELECTION-SCREEN END OF BLOCK b1.
*
*SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
*  PARAMETERS: p_topla RADIOBUTTON GROUP g1,
*              p_cikar RADIOBUTTON GROUP g1,
*              p_carp  RADIOBUTTON GROUP g1,
*              p_bol   RADIOBUTTON GROUP g1.
*SELECTION-SCREEN END OF BLOCK b2.
*
*START-OF-SELECTION.


* SELECTION SCREEN - RADIO BUTTON
**********************************************************************






**********************************************************************



* KENDİME SORU WORD3 TEK KARAKTER OLMASINA RAGMEN UZUNLUGUNA NEDEN 2 SONUCUNU VERIYOR
*DATA: INT TYPE I,
*      WORD1(20) VALUE '12345',
*      WORD2(20),
*      WORD3(20) VALUE ' 4 '.
*
*INT = STRLEN( WORD1 ). WRITE INT.
*
*INT = STRLEN( WORD2 ). WRITE / INT.
*
*INT = STRLEN( WORD3 ). WRITE / INT.

DATA: lv_num TYPE i.

DO 50 TIMES.
  lv_num = lv_num + 2.
  WRITE: / lv_num.
  IF lv_num = 20.
    EXIT.
  ENDIF.
ENDDO.
