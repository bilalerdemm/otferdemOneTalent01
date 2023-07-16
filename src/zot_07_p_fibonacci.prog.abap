*&---------------------------------------------------------------------*
*& Report zot_07_p_fibonacci
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_07_p_fibonacci.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_maxno  TYPE numc5 OBLIGATORY,
              p_breakd TYPE numc1 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

IF p_maxno > 10000 OR p_breakd > 9.
  cl_demo_output=>display( 'Sayiniz 10000den kucuk ve  kirlim sayisi tek haneli olmalı' ).
ENDIF.
