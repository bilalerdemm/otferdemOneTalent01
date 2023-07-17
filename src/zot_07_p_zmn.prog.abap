*&---------------------------------------------------------------------*
*& Report zot_07_p_zmn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_07_p_zmn.


DATA gs_zmn TYPE zot_07_t_zmn.
SELECT-OPTIONS: s_id FOR gs_zmn-tid.


START-OF-SELECTION.

  DATA: lv_date1    TYPE dats,
        lv_date2    TYPE dats,
        lv_time1    TYPE tims,
        lv_time2    TYPE tims,
        lv_day_diff TYPE i,
        lv_sec_diff TYPE i.

  SELECT fdate,
         ftime,
         ldate,
         ltime
       FROM zot_07_t_zmn WHERE tid IN @s_id INTO TABLE @DATA(lt_zmnn).


  LOOP AT lt_zmnn INTO DATA(ls_date).

    lv_date1 = ls_date-fdate.
    lv_date2 = ls_date-ldate.
    lv_time1 = ls_date-ftime.
    lv_time2 = ls_date-ltime.

    lv_day_diff = CONV int4( lv_date2 - lv_date1 ).

    DATA(lv_years) = lv_day_diff DIV 365.
    lv_day_diff = lv_day_diff MOD 365.

    DATA(lv_months) = lv_day_diff DIV 30.
    DATA(lv_days) = lv_day_diff MOD 30.


    CALL FUNCTION 'SWI_DURATION_DETERMINE'
      EXPORTING
        start_date = lv_date1
        end_date   = lv_date2
        start_time = lv_time1
        end_time   = lv_time2
      IMPORTING
        duration   = lv_sec_diff.


*    lv_sec_diff = CONV int4( lv_time2 - lv_time1 ).

    DATA(lv_seconds) = lv_sec_diff.
    DATA(lv_minutes) = lv_seconds DIV 60.
    DATA(lv_hour) = lv_seconds DIV 3600.

    IF sy-index MOD 6 = 0.
      NEW-LINE.
    ENDIF.

    IF lv_years NE 0.
      WRITE: |{ lv_years  } YIL|.
    ENDIF.
    IF lv_months NE 0.
      WRITE: |{ lv_months  } AY|.
    ENDIF.
    IF lv_days NE 0.
      WRITE: |{ lv_days } GÜN|.
    ENDIF.
    IF lv_hour NE 0.
      WRITE: |{ lv_hour } SAAT|.
    ENDIF.
    IF lv_minutes NE 0.
      WRITE: |{ lv_minutes } DAKİKA|.
    ENDIF.
    IF lv_seconds NE 0.
      WRITE: |{ lv_seconds } SANİYE|.
    ENDIF.

  ENDLOOP.
