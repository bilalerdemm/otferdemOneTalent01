*&---------------------------------------------------------------------*
*& Report zot_07_p_sqlpract
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_07_p_sqlpract.

DATA gv_banfn TYPE eban-banfn.      "Global bir degisken

DATA gs_eban TYPE eban.             "Global bir structre

DATA gt_eban TYPE TABLE OF eban.    "Eban tablosu tipinde bir
"global itab

START-OF-SELECTION.

  "Bana,eban tablosundan; field'i banfn olan, ve banfn'si
  "bos olmayan ilk veriyi getirir misin ?

*SELECT SINGLE banfn
*FROM eban
*WHERE banfn NE @space
*into @gv_banfn.
*
*cl_demo_output=>write( gv_banfn ).
*cl_demo_output=>display( ).


*
*"Bana fieldi matnr olan ve matnr degeri 5 ten buyuk olan
*"ilk degeri getirir misin
*SELECT SINGLE matnr
*FROM eban
*WHERE matnr > 5
*INTO @gv_banfn.
*
*cl_demo_output=>write( gv_banfn ).
*cl_demo_output=>display( ).

*  SELECT SINGLE banfn
*  FROM eban
*  WHERE bsart EQ 'NB'
*  INTO @gv_banfn.
*
*  SELECT SINGLE loekz
*  FROM eban
*  WHERE banfn = '10000023'
*    AND bnfpo = '0020'
*  INTO @DATA(lv_loekz).

SELECT DISTINCT banfn
FROM eban
WHERE bsart > 2
INTO @gv_banfn.
WRITE :/ gv_banfn.
ENDSELECT.

*  SELECT SINGLE loekz
*    FROM eban
*    WHERE banfn = '0010000023'
*    AND bnfpo = '0020'
*    INTO @lv_loekz.
*
*  IF sy-subrc = 0.
*    WRITE :/ lv_loekz.
*  ELSE.
*    WRITE :/ 'Error'.
*  ENDIF.
