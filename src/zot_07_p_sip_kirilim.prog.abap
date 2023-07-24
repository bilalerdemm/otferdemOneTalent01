*&---------------------------------------------------------------------*
*& Report zot_07_p_sip_kirilim
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_07_p_sip_kirilim.

TABLES: vbak,vbap.

"BASLIK
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: S_ordno  FOR vbak-vbeln,
                  S_ordrr  FOR vbak-kunnr,
                  S_ordtyp FOR vbak-auart,
                  S_orddt  FOR vbak-audat.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN ULINE.

"KALEM
SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  SELECT-OPTIONS:  S_mtrl   FOR vbap-matnr,
                   S_prplc  FOR vbap-werks,
                   S_pntyp  FOR vbap-pstyv,
                   S_mtgrp  FOR vbap-matkl,
                   S_prty   FOR vbap-charg.

SELECTION-SCREEN END OF BLOCK b2.

START-OF-SELECTION.

  SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.

    PARAMETERS:
                   p_ordtyp AS CHECKBOX, "ORDER TYPE
                   p_mtrl   AS CHECKBOX, "MTRL
                   p_ordrr  AS CHECKBOX, "ORDERER
                   p_mtgrp  AS CHECKBOX, "MATERIAL GRUP
                   p_prty   AS CHECKBOX. "PARTY

  SELECTION-SCREEN END OF BLOCK b3.










*"BASLIK
*SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
*  PARAMETERS: p_ordno TYPE VBAK-vbeln,
*              p_ordrr TYPE VBAK-kunnr,
*              p_ordtyp TYPE VBAK-auart,
*              p_orddt  TYPE VBAK-audat.
*SELECTION-SCREEN END OF BLOCK b1.
*
*"KALEM
*
*SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
*  PARAMETERS: p_mtrl TYPE VBAP-matnr,
*              p_prplc TYPE VBAP-werks,
*              p_pntyp TYPE VBAP-pstyv,
*              p_mtgrp  TYPE VBAP-matkl,
*              p_prty  TYPE VBAP-charg.
*SELECTION-SCREEN END OF BLOCK b2.
