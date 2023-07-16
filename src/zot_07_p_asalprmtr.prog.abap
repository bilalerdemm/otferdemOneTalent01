*&---------------------------------------------------------------------*
*& Report zot_07_p_asalprmtr
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_07_p_asalprmtr.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_firstn  TYPE numc5 OBLIGATORY.
             " p_scndn TYPE numc5 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

IF p_firstn > 10000. "OR p_scndn > 10000.
  cl_demo_output=>display( 'Sayilariniz 10000den kucuk olmalidir' ).
ENDIF.

data : res type i.

res = p_firstn MOD 2.

if res = 0.

write : 'This is not a prime number'.

else.

write : p_firstn, 'is a prime number.'.

endif.
