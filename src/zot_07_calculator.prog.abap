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

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
PARAMETERS: p_topla RADIOBUTTON GROUP rB1,
            p_cikar RADIOBUTTON GROUP rB1,
            p_carp  RADIOBUTTON GROUP rB1,
            p_bol   RADIOBUTTON GROUP rB1.
SELECTION-SCREEN END OF BLOCK b2.

DATA gv_result TYPE p DECIMALS 2.

gv_result = COND #( WHEN p_topla = 'X' THEN p_val1 + p_val2
                    WHEN p_cikar = 'X' THEN p_val1 - p_val2
                    WHEN p_carp = 'X' THEN  p_val1 * p_val2
                    WHEN p_bol = 'X' THEN p_val1 / p_val2 ).

cl_demo_output=>display( gv_result ).





*CATCH cx_sy_zerodivide.
*CATCH cx_sy_assign_cast_error.

* Tek komutla yazdırmak için değişkene atamak yerine sonucu doğrudan
* aşağıdaki gibi yazdırmaya çalıştım fakat syntax hatası verdi
*cl_demo_output=>display(  COND #( WHEN p_topla = 'X' THEN p_val1 + p_val2
*                                  WHEN p_cikar = 'X' THEN p_val1 - p_val2
*                                  WHEN p_carp = 'X' THEN  p_val1 * p_val2
*                                  WHEN p_bol = 'X' THEN p_val1 / p_val2 ) ).
