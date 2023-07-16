*&---------------------------------------------------------------------*
*& Report zot_07_p_siraliornek
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_07_p_siraliornek.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_maxno  TYPE numc3 OBLIGATORY,
              p_breakd TYPE numc1 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

IF p_maxno > 100 OR p_breakd > 9.
  cl_demo_output=>display( 'Sayiniz 100den kucuk ve  kirlim sayisi tek haneli olmalı' ).
ENDIF.


DATA: gv_no  TYPE i,
      gv_brk TYPE i.

DO p_maxno TIMES.

  gv_no = gv_no + 1.

  IF gv_brk < p_breakd.
    WRITE: gv_no.

  ELSE.
    WRITE / gv_no.  CLEAR: gv_brk.

  ENDIF.

  gv_brk = gv_brk + 1.

ENDDO.
