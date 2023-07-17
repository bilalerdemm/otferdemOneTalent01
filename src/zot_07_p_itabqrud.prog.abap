*&---------------------------------------------------------------------*
*& Report zot_07_p_itabqrud
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_07_p_itabqrud.
TYPES: BEGIN OF lty_material,
         matnr TYPE matnr,      "Malzeme ID
         maktx TYPE maktx,      "Malzeme Aciklamasi
         matkl TYPE matkl,      "Malzeme Grubu
         menge TYPE menge_d,    "Malzemenin Miktari
         meins TYPE meins,      "Olcu Birimi
       END OF lty_material.

DATA: lt_material TYPE TABLE OF lty_material,
      ls_material TYPE lty_material.

*"APPEND 1. Yontem, Ilk Yontemim APPEND ile
*ls_material-matnr = '01'.
*ls_material-maktx = 'Cekic'.
*ls_material-matkl = 'Hirdavat'.
*ls_material-menge =  5.
*ls_material-meins = 'PC'.
*
*"Bu yaptigimizi bir strucre'den tabloya atmak icin de;
*"APPEND komutunu kullanarak
*
*APPEND ls_material TO lt_material.
*
*"Su ana kadar oncelikle type olusturdum, bir tane internal table ardından da internal
*"table'in bir satırı gibi dusundugumuz bir structre olusturduk'.
*
*"2. Yontem BASE ve VALUE kullanarak.
*
*lt_material = VALUE #( BASE lt_material  ( matnr = '02'
*                                           maktx = 'Tornavida'
*                                           matkl = 'Hirdavat'
*                                           menge = 10
*                                           meins = 'PC' )  ).
*
*
*"3. YONTEM INSERT YONTEMI
*ls_material-matnr = '03'.
*ls_material-maktx = 'Lastik'.
*ls_material-matkl = 'Hirdavat'.
*ls_material-menge =  15.
*ls_material-meins = 'PC'.
*INSERT ls_material INTO TABLE lt_material.



DATA: lt_material_s TYPE SORTED TABLE OF lty_material "burada isimlendirmedeki son _s sorted table icin yazildi
      WITH NON-UNIQUE KEY matnr. "NON-UNIQUE key = matnr'si aynı olan degerleri atabilirim, cunku uniq degil


lt_material_s = VALUE #( BASE lt_material  ( matnr = '02'
                                          maktx = 'Tornavida'
                                          matkl = 'Hirdavat'
                                          menge = 10
                                          meins = 'PC' ) ).

" matnr'yi index'e gore surekli arttirmak icin
DATA: lv_matnr TYPE matnr.
DO 5 TIMES.
lv_matnr += 1.
ls_material-matnr = lv_matnr.
ls_material-maktx = 'Cekic'.
ls_material-matkl = 'Hirdavat'.
ls_material-menge =  5.
ls_material-meins = 'PC'.
APPEND ls_material TO lt_material.
clear ls_material. "Bir strucre'den, bir ITAB beslendiginde,
                   "biz bu structreyi temizliyoruz.
ENDDO.

"READ TABLE Bir tablodaki veriyi ectigimiz indexe gore veya belirledigimiz
"kriterlere gore bir satirini okumaya yarıyor.

"READ TABLE kullanmamin iki tane yolu var
"INDEX kullanarak

*READ TABLE lt_material INTO ls_material INDEX 1. "1. Index'i ceker

" Bir diger yontem ise WITH KEY matnr = '01' "MATNR'si 01 olan kaydi getirir.
"lt_mateial tablobdan, matnr'si 0 olan kaydi, ls_material structre'ma getir diyorum burada
READ TABLE lt_material INTO ls_material WITH KEY maktx = 'Cekic'.
if sy-subrc EQ 0.

lt_material = VALUE #( BASE lt_material ( matnr = '99'
                                          maktx = 'Kalem'
                                          matkl = 'Kirtasiye'
                                          menge =  ls_material-menge      "maktx'i Cekic olanin mengesini nuraya atıyorum
                                          meins =  ls_material-meins ) ). "maktx'i Cekic olanin meinssini nuraya atıyorum




ENDIF.
