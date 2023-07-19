*&---------------------------------------------------------------------*
*& Report zot_07_p_foralv
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_07_p_foralv.
*********************************BASIT KULLANIMI**************************************************************
*DATA: gt_sbook TYPE TABLE OF sbook, "Bu sbook'u CHANGING'taki
*                                    "t_table'a yapistiriyorum
*
*      go_salv TYPE REF TO cl_salv_table. "Buraya ise demin class'imizda yazdigimiz
*                                         "ismin aynisini yaziyoruz
*
*START-OF-SELECTION.
*
*SELECT * UP TO 20 ROWS FROM sbook  "Tablonun ilk 20 satirini bastir
*    INTO TABLE gt_sbook.
*
*cl_salv_table=>factory(
*  IMPORTING
*    r_salv_table   = go_salv      "Olusturdugum SALV objesini buraya yaziyorum
*  CHANGING
*    t_table        = gt_sbook       "Su an ITAB kismi hazir.
*
*    "Bu adimlari tamamladiktan sonra,bir SALV objesi tanimlamam gerekiyor.
*    "11. Satirda bu islemi yapiyorum.
*    "Boylelikle bu adimlari tamamladiktan sonra bir SALV objesini
*    "bir internal table(ITAB)'a baglamis oldum.
*).
*
* go_salv->display( ).

***********************************GELISMIS KULLANIMI***************************************************

"TITLE DEGISTIRME

DATA: gt_sbook TYPE TABLE OF sbook,
      go_salv  TYPE REF TO cl_salv_table.

START-OF-SELECTION.

  SELECT * UP TO 20 ROWS FROM sbook
      INTO TABLE gt_sbook.

  cl_salv_table=>factory(
    IMPORTING
      r_salv_table   = go_salv
    CHANGING
      t_table        = gt_sbook
  ).

  DATA: lo_display TYPE REF TO cl_salv_display_settings.

  lo_display = go_salv->get_display_settings( ).

  lo_display->set_list_header( value = 'ALV Practice' ). "Title degistirdigim kisim
  lo_display->set_striped_pattern( value = 'X' ).        "Tabloya zebra deseni verdigim kisim



  DATA: lo_cols TYPE REF TO cl_salv_columns.

  lo_cols = go_salv->get_columns( ).
  lo_cols->set_optimize( value = 'X').            "Kolonları,icinde yazan degerlere gore optimize
  "ettigim kisim


  "KOLON TANIMI DEGISTIRMEK ICIN
  DATA: lo_col TYPE REF TO cl_salv_column.
  lo_col = lo_cols->get_column( columnname = 'INVOICE' ).

  lo_col->set_long_text( 'Yeni Fatura Duzenliyici' ).
  lo_col->set_medium_text( 'Yeni Fatura D.' ).
  lo_col->set_short_text( 'YeniFat.D.' ).

  "BIR KOLONU KALDIRMAK ICIN
  lo_col = lo_cols->get_column( columnname = 'MANDT' ).
  lo_col->set_visible(
      value = if_salv_c_bool_sap=>false          "Burası true olarak geliyor ve ben onu false'a cekiyorum
  ).

  "TOOLBAR EKLEMEK ICIN
  DATA: lo_func TYPE REF TO cl_salv_functions.

  lo_func = go_salv->get_functions( ).
  lo_func->set_all(
      value = if_salv_c_bool_sap=>true
  ).


  "HEADER EKLEMEK ICIN
  DATA: lo_header  TYPE REF TO cl_salv_form_layout_grid,
        lo_h_label TYPE REF TO cl_salv_form_label,
        lo_h_flow  TYPE REF TO cl_salv_form_layout_flow.

  CREATE OBJECT lo_header.

  lo_h_label = lo_header->create_label( row = 1 column = 1 ).
  lo_h_label->set_text( value = 'Bilal Furkan Erdem' ).
  lo_h_flow = lo_header->create_flow( row = 2 column = 1 ).
  lo_h_flow->create_text(
    EXPORTING
    text     = 'Bir sekilde halledecegiz.'
  ).

  go_salv->set_top_of_list( value = lo_header  ).  "salv'me baglama kismi


  "POP UP SEKLINDE GOSTERMEK ICIN
*  go_salv->set_screen_popup(
*    EXPORTING
*      start_column = 10
*      end_column   = 75
*      start_line   = 5
*      end_line     = 25
*  ).

  go_salv->display( ).
