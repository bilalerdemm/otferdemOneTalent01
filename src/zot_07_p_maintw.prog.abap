*&---------------------------------------------------------------------*
*& Report zot_07_p_maintw
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_07_p_maintw.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: id    TYPE c LENGTH 3,
              tweet TYPE c LENGTH 255.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_tweet  RADIOBUTTON GROUP rB1,
              p_degist RADIOBUTTON GROUP rB1,
              p_sil    RADIOBUTTON GROUP rB1,
              p_goster RADIOBUTTON GROUP rB1.
SELECTION-SCREEN END OF BLOCK b2.

START-OF-SELECTION.

  DATA lt_tweets TYPE TABLE OF zot_07_t_newtw.
  DATA gs_tweet_t TYPE zot_07_t_newtw.

  IF id = space AND ( p_tweet EQ 'X' OR p_degist EQ 'X' OR p_sil EQ 'X' ).
    cl_demo_output=>display( 'TWEET ID GIRINIZ' ).
  ELSE.
    CASE 'X'.
      WHEN p_tweet.
        gs_tweet_t-id = id.
        gs_tweet_t-newtweet = tweet.
        INSERT zot_07_t_newtw FROM gs_tweet_t.
      WHEN p_degist.
        UPDATE zot_07_t_newtw SET newtweet = tweet WHERE id = id.
      WHEN p_sil.
        DELETE FROM zot_07_t_newtw WHERE id = id. COMMIT WORK AND WAIT.
      WHEN p_goster.
        SELECT newtweet
     FROM zot_07_t_newtw
        INTO TABLE @DATA(abapitter).
        cl_demo_output=>display( abapitter ).
    ENDCASE.
  ENDIF.
