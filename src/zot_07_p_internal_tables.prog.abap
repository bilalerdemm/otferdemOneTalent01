*&---------------------------------------------------------------------*
*& Report zot_07_p_internal_tables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_07_p_internal_tables.

DATA: gt_material TYPE TABLE OF zot_00_t_materia.



SELECT * FROM zot_00_t_materia
INTO TABLE gt_material. "Butun select*

DATA: lt_material_s TYPE SORTED TABLE OF zot_00_t_materia "burada isimlendirmedeki son _s sorted table icin yazildi
      WITH UNIQUE KEY matnr. "NON-UNIQUE key = matnr'si aynı olan degerleri atayamam


lt_material_s = VALUE #( BASE lt_material_s ( matnr = '000000000000000011'
                                             maktx = 'Tornavida'
                                             matkl = 'C'
                                             menge = 1
                                             meins = 'ST' )

                                           ( matnr = '000000000000000012'
                                             maktx = 'Baret'
                                             matkl = 'C'
                                             menge = 4
                                             meins = 'ST' )

                                           ( matnr = '000000000000000013'
                                             maktx = 'Mandal'
                                             matkl = 'C'
                                             menge = 5
                                             meins = 'ST' )

                                           ( matnr = '000000000000000014'
                                             maktx = 'Cetvel'
                                             matkl = 'C'
                                             menge = 7
                                             meins = 'ST' )

                                           ( matnr = '000000000000000015'
                                             maktx = 'Canta'
                                             matkl = 'C'
                                             menge = 3
                                             meins = 'ST' ) ).


"READ TABLE

LOOP AT gt_material ınto DATA(ls_material).
  READ TABLE lt_material_s INTO DATA(ls_material_s)
  WITH KEY meins = ls_material-meins.
  IF sy-subrc EQ 0.
    ls_material-menge += 10.
    MODIFY gt_material FROM ls_material.
  ENDIF.
ENDLOOP.

*cl_demo_output=>write( gt_material ).
*cl_demo_output=>display( ).


"APPEND LINES

DATA lt_material2 TYPE TABLE OF zot_00_t_materia.

APPEND LINES OF gt_material TO lt_material2.
APPEND LINES OF lt_material_s TO lt_material2.


*cl_demo_output=>write( lt_material2 ).
*cl_demo_output=>display( ).





TYPES: BEGIN OF  lty_mtrl,
         matkl TYPE matkl,
         menge TYPE menge_d,
       END OF lty_mtrl.
DATA: lt_mtrl_collect TYPE TABLE OF lty_mtrl.
DATA: ls_mtrl_collect TYPE  lty_mtrl.

LOOP AT lt_material2 INTO DATA(ls_material2).
  ls_mtrl_collect = VALUE #(   matkl = ls_material2-matkl
                               menge = ls_material2-menge ).


  COLLECT ls_mtrl_collect INTO lt_mtrl_collect.
ENDLOOP.

DELETE lt_mtrl_collect WHERE menge < 10.

SORT lt_material2 ASCENDING BY menge.
SORT lt_mtrl_collect DESCENDING BY menge.

cl_demo_output=>display( lt_material2 ).
cl_demo_output=>display( lt_mtrl_collect ).
