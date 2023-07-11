*&---------------------------------------------------------------------*
*& Report zot_07_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_07_calculator.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_val1 TYPE i,
              p_val2 TYPE i.
SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_topla RADIOBUTTON GROUP rB1,
              p_cikar RADIOBUTTON GROUP rB1,
              p_carp  RADIOBUTTON GROUP rB1,
              p_bol   RADIOBUTTON GROUP rB1.
SELECTION-SCREEN END OF BLOCK b2.
DATA gv_result TYPE p DECIMALS 2.

IF p_topla = 'X'.
  gv_result = p_val1 + p_val2.
  cl_demo_output=>display( gv_result ).
ELSEIF p_cikar = 'X'.
  gv_result = p_val1 - p_val2.
  cl_demo_output=>display( gv_result ).
ELSEIF p_carp = 'X'.
  gv_result = p_val1 * p_val2.
  cl_demo_output=>display( gv_result ).
ELSEIF p_bol = 'X'.
  gv_result = p_val1 / p_val2.
  cl_demo_output=>display( gv_result ).
ENDIF.

*cl_demo_output⇒ write ( gv_result ).
