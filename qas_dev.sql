CREATE DEFINER=`qasd_svc`@`%` FUNCTION `qas_dev`.`FC_CREATE_NO`(StrAbbr varchar(2), DtDate datetime) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN	
	DECLARE StrDate VARCHAR(8);
	SET StrDate = DATE_FORMAT(DtDate,'%Y%m%d');

    RETURN
        CASE StrAbbr
            WHEN 'DM'  -- 납품검사
                THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(DLVR_EXAM_REQ_NO,3)),3) FROM T_DLVR_EXAM_REQ  WHERE DLVR_EXAM_REQ_NO LIKE CONCAT('DM', StrDate, '%')))			
            WHEN 'QL'  -- 인증시험
                THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(CERT_EXAM_NO,3)),3) FROM T_CERT_EXAM_REQ WHERE CERT_EXAM_NO LIKE CONCAT('QL', StrDate, '%')))	
            WHEN 'EA'  -- ERP승인	
                THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(APR_REQ_NO,3)),3) FROM T_DLVR_ERP_REQ WHERE  APR_REQ_NO LIKE CONCAT('EA', StrDate, '%')))
            WHEN 'RE'  -- 성적양식코드
                THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(RECORD_CODE,3)),3) FROM T_DLVR_REC_MNG WHERE RECORD_CODE LIKE CONCAT('RE', StrDate, '%')))
            WHEN 'GR'  -- 필증발급
                THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(CERT_ISSUE_NO,3)),3) FROM T_DLVR_CERT_ISU WHERE CERT_ISSUE_NO LIKE CONCAT('GR', StrDate, '%')))	
            WHEN 'FM'  -- AS요청(FIMS)
                THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(FIMS_NO,3)),3) FROM T_LIN_FIMS_AS_INFO WHERE FIMS_NO LIKE CONCAT('FM', StrDate, '%')))
            WHEN 'PP'  -- 선납신청
            	THEN CONCAT(StrAbbr,StrDate, (SELECT FC_NUMBERING(MAX(RIGHT(PPAY_CONT_INFO_SEQ,3)),3) FROM T_DLVR_PPAY_CONT WHERE PPAY_CONT_INFO_SEQ LIKE CONCAT('PP', StrDate, '%')))	
            WHEN 'CP'  -- 업체코드
                THEN CONCAT(StrAbbr, (SELECT FC_NUMBERING(MAX(RIGHT(CMP_CODE,6)),6) FROM T_CMM_CMP ))
            WHEN 'TE'  -- 임시물품코드	
                THEN CONCAT(StrAbbr, (SELECT FC_NUMBERING(MAX(RIGHT(TMP_ATCL_CODE,8)),8) FROM T_DLVR_TEMP_ITEM ))
	    END;
END;

CREATE DEFINER=`qasd_svc`@`%` FUNCTION `qas_dev`.`FC_ERP_TO_QAS_CATEGORY`(ERP_CATEGORY varchar(8)) RETURNS varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
    RETURN CASE
               WHEN ERP_CATEGORY LIKE '200102%' THEN '0100000000' -- 교환기
               WHEN ERP_CATEGORY = '20010101' THEN '0100000000' -- 교환기
               WHEN ERP_CATEGORY LIKE '200103%' THEN '0200000000' -- 기지국
               WHEN ERP_CATEGORY = '20010102' THEN '0200000000' -- 기지국
               WHEN ERP_CATEGORY LIKE '200703%' THEN '0500000000' -- 부대장비
               WHEN ERP_CATEGORY LIKE '200708%' THEN '0500000000' -- 부대장비
               WHEN ERP_CATEGORY LIKE '2003%' THEN '0600000000' -- 전송장비
               WHEN ERP_CATEGORY LIKE '2002%' THEN '0700000000' -- 중계기
               WHEN ERP_CATEGORY LIKE '1009%' THEN '0800000000' -- IT
               WHEN ERP_CATEGORY LIKE '1010%' THEN '0800000000' -- IT
               ELSE '0000000000' -- 미분류
        END;
END;

CREATE DEFINER=`qasd_svc`@`%` FUNCTION `qas_dev`.`FC_FORMAT_WRKRREGNO`(WrkrRegNo char(10)) RETURNS char(12) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
    SET @trimmed = TRIM(WrkrRegNo);

    RETURN CONCAT(substring(@trimmed,1,3),'-',substring(@trimmed,4,2),'-',substring(@trimmed,6,5));
END;

CREATE DEFINER=`qasd_svc`@`%` FUNCTION `qas_dev`.`FC_GET_ATCLCATCD`(atclCode varchar(18)) RETURNS varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
    RETURN (
        SELECT CONCAT(SUBSTRING(ATCL_CAT_CODE, 1, 2), '00000000')
		FROM T_CMM_ITEM_DTL 
		WHERE ATCL_CODE = atclCode
    );
END;

CREATE DEFINER=`qasd_svc`@`%` FUNCTION `qas_dev`.`FC_GET_DLVR_EXAM_STATE_GROUP`(DLVR_EXAM_STATE_CODE varchar(6)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
    RETURN
        CASE SUBSTR(DLVR_EXAM_STATE_CODE,1,5)
            WHEN 'C2101'
                THEN CASE DLVR_EXAM_STATE_CODE
                        WHEN 'C21011' THEN '반려' -- 신청서작성중(반려)
                        WHEN 'C21012' THEN '불합격' -- 신청서작성중(시정조치)
                    END
            WHEN 'C2102' THEN '신청'
            WHEN 'C2103' THEN '접수' -- 신청서접수
            WHEN 'C2104' THEN '접수' -- 시험데이터등록
            WHEN 'C2105' THEN '합격'
            WHEN 'C2106' THEN '불합격'
    END;
END;

CREATE DEFINER=`qasd_svc`@`%` FUNCTION `qas_dev`.`FC_GET_IF_TARGET_MONTH`(targetMonth char(2), yyyymm varchar(8), val decimal) RETURNS decimal(10,0)
BEGIN
    RETURN IF(SUBSTRING(yyyymm, 5, 2) = targetMonth, val, 0);
END;

CREATE DEFINER=`qasd_svc`@`%` FUNCTION `qas_dev`.`FC_GET_NPR_NAME`(SEQ varchar(1)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
    RETURN CASE SEQ
        when 9 then '12개월납품수량'
        WHEN 8 then '월납품수량'
        when 7 then '월AS수량'
        WHEN 6 then 'A/S율(12개월,PPM)'
    end;
end;

CREATE DEFINER=`qasd_svc`@`%` FUNCTION `qas_dev`.`FC_GET_TOT_NPR_NAME`(SEQ varchar(1)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
    RETURN CASE SEQ
        when 9 then '총납품수량'
        WHEN 8 then '월납품수량'
        when 7 then '월AS수량'
        WHEN 6 then 'A/S율(전체,PPM)'
    end;
end;

CREATE DEFINER=`qasd_svc`@`%` FUNCTION `qas_dev`.`FC_IS_VALID_WRKRREGNO`(WRKR_REG_NO varchar(50)) RETURNS tinyint(1)
    COMMENT '사업자번호 유효성 확인'
BEGIN
    DECLARE _NO VARCHAR(10);

    IF WRKR_REG_NO IS NULL THEN RETURN FALSE; END IF;

    SET _NO = REGEXP_REPLACE(`WRKR_REG_NO`, '[^0-9]', '');

    IF LENGTH(_NO) != 10 THEN RETURN FALSE;
    ELSE
        RETURN RIGHT(10 - 
             (SUBSTR(_NO, 1, 1) * 1
            + SUBSTR(_NO, 2, 1) * 3
            + SUBSTR(_NO, 3, 1) * 7
            + SUBSTR(_NO, 4, 1) * 1
            + SUBSTR(_NO, 5, 1) * 3
            + SUBSTR(_NO, 6, 1) * 7
            + SUBSTR(_NO, 7, 1) * 1
            + SUBSTR(_NO, 8, 1) * 3
            + SUBSTR(_NO, 9, 1) * 5
            + FLOOR((SUBSTR(_NO, 9, 1) * 5) / 10)) % 10, 1) = RIGHT(_NO, 1);

    END IF;
END;

CREATE DEFINER=`qasd_svc`@`%` FUNCTION `qas_dev`.`FC_NUMBERING`(prevValue varchar(30), len int) RETURNS varchar(30) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
    RETURN LPAD(IFNULL(CAST(SUBSTRING(prevValue, -len) AS DECIMAL), 0) + 1, len, '0');
END;

CREATE DEFINER=`qasd_svc`@`%` FUNCTION `qas_dev`.`FC_TO_FULL_ATCL_CODE`(
	`ATCL_CODE` VARCHAR(18)
) RETURNS varchar(18) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
	RETURN LPAD(REPLACE(`ATCL_CODE`,'Z','1'), 18, '0');
END;

CREATE DEFINER=`qasd_svc`@`%` FUNCTION `qas_dev`.`FC_YMD_MONTH_BEFORE`(YMD varchar(8), `Interval` int) RETURNS varchar(8) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN		
	RETURN DATE_FORMAT(STR_TO_DATE(`YMD`, '%Y%m%d') - INTERVAL `Interval` MONTH, '%Y%m%d');
END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SC_DELETE_OUTDATED_LOGS`()
    COMMENT '보관 기간이 지난 로그 삭제'
BEGIN
    SET @message := '';
    SET @sum := 0;
    SET @startDatetime = NOW();

    DELETE FROM t_log_api WHERE LOG_DATETIME < SYSDATE() - INTERVAL 180 DAY;
    SELECT ROW_COUNT() INTO @api;
    IF @api > 0 THEN
        SET @message := CONCAT(@api, ' rows from t_log_api');
        SET @sum := @sum + @api;
    END IF;

    DELETE FROM t_log_mail_send WHERE SEND_DATETIME < SYSDATE() - INTERVAL 180 DAY;
    SELECT ROW_COUNT() INTO @mailSend;
    IF @mailSend > 0 THEN
        SET @message := CONCAT(@message, IF(@sum > 0, ', ',''), @mailSend, ' rows from t_log_mail_send');
        SET @sum := @sum + @mailSend;
    END IF;

    DELETE FROM t_log_page WHERE ACS_DATE < SYSDATE() - INTERVAL 180 DAY;
    SELECT ROW_COUNT() INTO @page;
    IF @page > 0 THEN
        SET @message := CONCAT(@message, IF(@sum > 0, ', ',''), @page, ' rows from t_log_page');
        SET @sum := @sum + @page;
    END IF;

    DELETE FROM t_log_system_job WHERE END_DATETIME < SYSDATE() - INTERVAL 180 DAY;
    SELECT ROW_COUNT() INTO @systemJob;
    IF @systemJob > 0 THEN
        SET @message := CONCAT(@message, IF(@sum > 0, ', ',''), @systemJob, ' rows from t_log_system_job');
        SET @sum := @sum + @systemJob;
    END IF;

    -- DELETE FROM t_log_z_mi_qeas_interface WHERE LOG_DATETIME < SYSDATE() - INTERVAL 180 DAY;
    
    IF @sum > 0 THEN
        SET @message := CONCAT('Deleted ', @message);
    ELSE 
        SET @message := '삭제할 로그가 없습니다.';
    END IF;

    CALL SP_INSERT_SYSTEM_JOB_LOG(
            'SWEEP_LOGS'
        , '{"_comment": "보관 기간이 지난 로그 삭제","query": "CALL SC_DELETE_OUTDATED_LOGS();"}'
        , 'SUCCESS'
        , @message
        , 'procedure SWEEP_LOGS'
        , @startDatetime
         );
end;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SC_ERP_CONT`()
    COMMENT '계약Data 업로드'
BEGIN
    START TRANSACTION;

    UPDATE T_DLVR_CONT_TMP
    SET eindt = REPLACE(eindt,'-','');

    DELETE T_DLVR_CONT
    FROM T_DLVR_CONT 
         LEFT JOIN
             (SELECT DISTINCT CDT.ctr_no, CDT.eindt, CDT.werks
              FROM v_dlvr_cont_tmp CDT
                   LEFT JOIN t_dlvr_exam_req DER
                         on CDT.ctr_no = DER.ctr_no
                             AND CDT.eindt = DER.DLVDT_YMD
                             AND CDT.WERKS = DER.PLANT_CODE
              WHERE DER.CTR_NO IS NULL -- 납품검사신청이 시작하지 않았거나
                 OR DER.DLVR_EXAM_STATE_CODE < 'C21030' -- 상태가 '신청서접수' 이전
             ) B
                ON T_DLVR_CONT.ctr_no = B.ctr_no AND T_DLVR_CONT.DLVDT_YMD = b.EINDT AND T_DLVR_CONT.PLANT_CODE = b.WERKS
    WHERE B.ctr_no IS NOT NULL;

    /* 계약테이블 입력 */
    INSERT INTO T_DLVR_CONT
    (ctr_no, dlvdt_ymd, plant_code, sno, delivn, delivp, ebeln, ebelp, ctr_type, zztitl, ctr_ymd, ctr_stdt, ctr_enddt, afnam, ktext, orderman,
     lifnr, spy_cmp_nm, wers, zzm001, zzm002, zzm003, zzm004, zzx001, zzx002, zzx003, zzprd1, MATKL, atcl_code,
     atcl_code_nm, menge, meins, netpr, price, idnlf, banfn, aufnr, ktext1, knttp, knttx, plant_nm, reg_ymd, ent_ymd,
     DLVR_OD_ENO, DLVR_OD_NM)
    SELECT
     ctr_no, eindt, werks, sno, delivn, delivp, ebeln, ebelp, bsart, zztitl, REPLACE(ZZPODT,'-',''), REPLACE(kdatb,'-',''), REPLACE(kdate,'-',''), afnam, ktext, orderman,
     lifnr, name1, wers, zzm001, zzm002, zzm003, zzm004, zzx001, zzx002, zzx003,zzprd1,MATKL,matnr,
     txz01, CAST(CAST(menge AS FLOAT(24)) AS DECIMAL),meins,netpr,price,idnlf,banfn,aufnr,ktext1,knttp,knttx,name11,REPLACE(AEDAT,'-',''),DATE_FORMAT(NOW(), '%Y%m%d'),
     UNAME,NAME
    FROM v_dlvr_cont_tmp DCT
    WHERE NOT EXISTS (SELECT *
                      FROM T_DLVR_CONT dc
                      WHERE dct.ctr_no = dc.ctr_no AND dct.eindt = dc.dlvdt_ymd AND dct.werks = dc.plant_code);

    INSERT INTO t_lin_erp_new_item (erp_code_seri, erpatcl_code, atcl_nm, atcl_cat_code, reg_ymd)
    SELECT DISTINCT matkl
                  , atcl_code
                  , atcl_code_nm
                  , FC_ERP_TO_QAS_CATEGORY(matkl)
                  , DATE_FORMAT(NOW(), '%Y%m%d')
    FROM t_dlvr_cont
    WHERE NOT EXISTS (select * from t_cmm_item_dtl where t_dlvr_cont.atcl_code = t_cmm_item_dtl.atcl_code)
      AND NOT EXISTS (select * from t_lin_erp_new_item where t_dlvr_cont.atcl_code = t_lin_erp_new_item.erpatcl_code)
      AND dlvdt_ymd >= '20050101';
    -- NOTE: 선납 신청시 등록된 물품만 사용하므로 아래 로직은 삭제
    -- 선납 계약 생성후 선납 신청 진행중 신청서를 삭제했을 때, 임시 물품이 t_cmm_item_dtl에서 삭제되는데, 해당 물품이 t_lin_erp_new_item에 임의로 등록되는 로직이다.
    -- 이렇게 임의로 추가된 물품을 처리하는 로직이 없으므로 아래 로직 삭제
    /*UNION ALL
    SELECT DISTINCT ''
         , mat_cd
         , mat_nm
         , ''
         , DATE_FORMAT(NOW(), '%Y%m%d')
    FROM T_DLVR_PPAY_CONT
    WHERE NOT EXISTS (select * from t_cmm_item_dtl where T_DLVR_PPAY_CONT.mat_cd = t_cmm_item_dtl.atcl_code)
      AND NOT EXISTS (select * from t_lin_erp_new_item where T_DLVR_PPAY_CONT.mat_cd = t_lin_erp_new_item.erpatcl_code);*/


    -- Step 2: erp_exam_auto_insert
    INSERT INTO T_AUTO_DLVR_CONT (DLVR_EXAM_REQ_NO, CTR_NO, DLVDT_YMD, PLANT_CODE, CHR, REQ_YMD, ISP_STDT, LIFNR, CMP_CODE)
    WITH NO_AUT_DLVR AS -- T_AUTO_DLVR_CONT에 등록되지 않은 CONT
             (SELECT DC.ATCL_CODE
                   , DC.CTR_NO
                   , DC.DLVDT_YMD
                   , DC.PLANT_CODE
                   , DC.LIFNR
                   , SUM(CONVERT(MENGE, DECIMAL)) AS MENGE
              FROM T_DLVR_CONT DC
                       LEFT JOIN T_AUTO_DLVR_CONT ADC
                                 ON DC.CTR_NO = ADC.CTR_NO AND DC.DLVDT_YMD = ADC.DLVDT_YMD AND
                                    DC.PLANT_CODE = ADC.PLANT_CODE
              WHERE ADC.CTR_NO IS NULL
                AND DC.DLVDT_YMD >= DATE_FORMAT(NOW() - INTERVAL 60 DAY, '%Y%m%d')
              GROUP BY ATCL_CODE, CTR_NO, DLVDT_YMD, PLANT_CODE, LIFNR),
         EXAM_EXCEPT AS -- 납품 검사 예외 품목으로 등록된 CONT
             (SELECT DC.ATCL_CODE
                   , DC.CTR_NO
                   , DC.DLVDT_YMD
                   , DC.PLANT_CODE
                   , DC.LIFNR
                   , SUM(CONVERT(MENGE, DECIMAL)) AS ITEM_CNT
              FROM T_DLVR_CONT DC
                       LEFT JOIN T_CMM_ITEM_DTL CID
                                 ON DC.ATCL_CODE = CID.ATCL_CODE
              WHERE CID.EXAM_EXCEPT_YN = 'Y'
                AND DLVDT_YMD >= DATE_FORMAT(NOW() - INTERVAL 60 DAY, '%Y%m%d')
              GROUP BY DC.ATCL_CODE, DC.CTR_NO, DC.DLVDT_YMD, DC.PLANT_CODE, DC.LIFNR)
    SELECT CONCAT('AU', DATE_FORMAT(NOW(), '%Y%m%d'), '000')                                               as DLVR_EXAM_REQ_NO
         , T9.CTR_NO
         , T9.DLVDT_YMD
         , T9.PLANT_CODE
         , IFNULL((SELECT last_cort_id
                   FROM t_cmm_item_dtl
                   WHERE last_cort_id not like 'q%'
                     AND last_cort_id not like '0%'
                     AND atcl_code in (SELECT min(atcl_code)
                                       FROM T_DLVR_CONT
                                       WHERE T_DLVR_CONT.CTR_NO = T9.CTR_NO
                                         AND T_DLVR_CONT.DLVDT_YMD = T9.DLVDT_YMD
                                         AND T_DLVR_CONT.PLANT_CODE = T9.PLANT_CODE)), '1106537')          as CHR
         , DATE_FORMAT(NOW(), '%Y%m%d')                                                                    as REQ_YMD
         , DATE_FORMAT(NOW(), '%Y%m%d')                                                                    as ISP_STDT
         , LIFNR
         , (select cmp_code from t_cmm_cmp where wrkr_reg_no = LIFNR and IFNULL(oem_yn, '') = 'N' LIMIT 1) as CMP_CODE
    FROM (SELECT A.CTR_NO
               , A.DLVDT_YMD
               , A.PLANT_CODE
               , A.LIFNR
               , MIN(IFNULL(B.ITEM_CNT, 0) - A.MENGE) AS RESULT
          FROM NO_AUT_DLVR A
                   LEFT JOIN EXAM_EXCEPT B
                             ON A.ATCL_CODE = B.ATCL_CODE
                                 AND A.CTR_NO = B.CTR_NO
                                 AND A.DLVDT_YMD = B.DLVDT_YMD
                                 AND A.PLANT_CODE = B.PLANT_CODE

          GROUP BY A.CTR_NO, A.DLVDT_YMD, A.PLANT_CODE, A.LIFNR
          HAVING RESULT >= 0) T9;

    DELETE
    FROM t_dlvr_cont DC
    WHERE atcl_code IN (SELECT atcl_code FROM t_cmm_item_dtl WHERE exam_except_yn = 'Y')
      AND CONCAT(ctr_no, plant_code, dlvdt_ymd) NOT IN
        (
        SELECT DISTINCT CONCAT(ctr_no, plant_code, dlvdt_ymd)
        FROM t_dlvr_exam_req
        )
      AND CONCAT(ctr_no, plant_code, dlvdt_ymd) NOT IN
        (
        SELECT DISTINCT CONCAT(ctr_no, plant_code, dlvdt_ymd)
        FROM T_AUTO_DLVR_CONT
        )
      AND DC.dlvdt_ymd >= '20110101';

    COMMIT;

END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SC_ERP_NEW_ITEM`()
    COMMENT '신규 물품코드 등록'
BEGIN
    START TRANSACTION;

    -- 원본 데이터 저장
    DELETE
    FROM t_lin_erp_item_raw raw
    WHERE EXISTS (SELECT *
                  FROM t_lin_erp_item_tmp temp
                  where temp.MATNR = raw.MATNR);

    INSERT INTO t_lin_erp_item_raw
    SELECT *
    FROM t_lin_erp_item_tmp temp;

    -- 새로운 물품 카테고리가 있으면 t_erp_category에 추가
    INSERT INTO t_erp_category
    WITH CTE AS (
        SELECT DISTINCT RPAD(ZL_ITEM, 8, '0') AS CATEGORY_CODE, ZL_TEXT AS CLASS1, NULL AS CLASS2, NULL AS CLASS3, NULL CLASS4 from t_lin_erp_item_tmp
        UNION
        SELECT DISTINCT RPAD(ZM_ITEM, 8, '0'), ZL_TEXT, ZM_TEXT, NULL, NULL from t_lin_erp_item_tmp
        UNION
        SELECT DISTINCT RPAD(ZSG_ITEM, 8, '0'), ZL_TEXT, ZM_TEXT, ZSG_TEXT, NULL from t_lin_erp_item_tmp
        UNION
        SELECT DISTINCT ZS_ITEM, ZL_TEXT, ZM_TEXT, ZSG_TEXT, ZS_TEXT from t_lin_erp_item_tmp
    )
    SELECT CTE.* FROM CTE
        LEFT JOIN t_erp_category ec
            ON ec.CATEGORY_CODE = CTE.CATEGORY_CODE
    WHERE ec.CATEGORY_CODE IS NULL;


    -- t_lin_erp_new_item에 추가
    INSERT INTO t_lin_erp_new_item
    ( erp_code_seri
    , erpatcl_code
    , atcl_nm
    , atcl_cat_code
    , atcl_cat_nm
    , reg_ymd
    , reg_empno
    , reg_hname)
    SELECT A.MATKL -- 자재 그룹
         , A.MATNR -- 자재번호
         , A.MAKTX -- 자재내역
         , C.ATCL_CAT_CODE
         , C.ATCL_CAT_NM
         , DATE_FORMAT(A.ERSDA, '%Y%m%d')
         , UNAME -- 사용자
         , (SELECT hname FROM INF_PERSON_INFO_RCV WHERE empno = UNAME)
    FROM t_lin_erp_item_tmp A
        LEFT JOIN t_cmm_item_class C
            ON C.ATCL_CAT_CODE = FC_ERP_TO_QAS_CATEGORY(ZS_ITEM)
    WHERE MATNR NOT IN (SELECT atcl_code FROM t_cmm_item_dtl UNION ALL SELECT erpatcl_code FROM t_lin_erp_new_item);

    -- 계약데이터를 통해 먼저 입력된 경우라면 카테고리 분류가 제대로 안 되었을 수 있다. t_lin_erp_item_tmp에서 정보를 확인할 수 있으면 업데이트
    UPDATE t_lin_erp_new_item eni JOIN t_lin_erp_item_tmp eit ON eni.ERPATCL_CODE = eit.MATNR
    SET eni.ATCL_CAT_CODE = FC_ERP_TO_QAS_CATEGORY(eit.ZS_ITEM)
    WHERE eni.ATCL_CAT_CODE = '0000000000'
      AND FC_ERP_TO_QAS_CATEGORY(eit.ZS_ITEM) != '0000000000';

    -- 물품검사 제외품목
    INSERT INTO t_cmm_item_dtl
    ( atcl_code
    , atcl_cat_code
    , atcl_nm
    , exam_except_yn
    , use_yn
    , regr_nm
    , regr_id
    , last_cort_nm
    , last_cort_id
    , last_mod_ymd
    , erp_cat_code)
    SELECT erpatcl_code,
           '0800000000',
           atcl_nm,
           'Y',
           'Y',
           '최성필',
           '1106374',
           '최성필',
           '1106374',
           DATE_FORMAT(NOW(), '%Y%m%d'),
           erp_code_seri
    FROM t_lin_erp_new_item a
    WHERE (LOWER(atcl_nm) REGEXP '^s/w|설치비|notebook|모니터|monitor|install|upgrde|desktop|설명서|manual|설치|구축|공사' OR
           erpatcl_code like '000000002%')
      AND ifnull(confm_yn, '') = ''
      AND erpatcl_code not in (select atcl_code from t_cmm_item_dtl);

    UPDATE t_lin_erp_new_item
    SET confm_yn ='Y'
    WHERE (LOWER(atcl_nm) REGEXP '^s/w|설치비|notebook|모니터|monitor|install|upgrde|desktop|설명서|manual|설치|구축|공사' OR
           erpatcl_code like '000000002%')
      AND ifnull(confm_yn, '') = '';
    COMMIT;

END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SC_FIMS_AS`()
    COMMENT 'FIMS AS 데이터 입력'
BEGIN

    DROP TEMPORARY TABLE IF EXISTS TEMP_LIN_FIMS_AS;
    CREATE TEMPORARY TABLE TEMP_LIN_FIMS_AS AS
    SELECT FIMS_NO
         , ATCL_CODE
         , SKT_SERI_NO
         , PRD_CMP_SERI_NO
         , IFNULL(b.cmp_code, a.CMP_CODE)                        AS CMP_CODE
         , AS_REQ_WRKR_REQ_NO
         , AS_REQ_CMP_NM
         , AS_REQ_AREA_CODE
         , LOCAL_NM
         , AS_REQ_YMD
         , AS_REQ_NAME
         , AS_REQ_TEL
         , TROUB_CNTS
         , IF(b.CMP_CODE IS NULL, 'C23050', `STATE`)             AS STATE
         , IF(b.CMP_CODE IS NULL, '공급자 사업자번호가 존재하지 않습니다.', NULL) AS ERR_CONT
    FROM T_LIN_FIMS_AS_TMP a
             LEFT JOIN(SELECT wrkr_reg_no, MAX(CMP_CODE) AS CMP_CODE
                       FROM t_cmm_cmp
                       WHERE oem_yn = 'N'
                         AND apr_yn = 'Y'
                         AND use_yn = 'Y'
                       GROUP BY wrkr_reg_no) b
                      on a.CMP_CODE = b.wrkr_reg_no;


    DELETE
    FROM TEMP_LIN_FIMS_AS
    WHERE fims_no IN (SELECT fims_no FROM T_LIN_FIMS_AS_INFO WHERE STATE IN ('C23030', 'C23040'));

    DELETE
    FROM T_LIN_FIMS_AS_INFO
    WHERE fims_no IN (SELECT fims_no FROM TEMP_LIN_FIMS_AS);

    INSERT INTO T_LIN_FIMS_AS_INFO
    ( FIMS_NO
    , ATCL_CAT_CODE
    , ATCL_CODE
    , SKT_SERI_NO
    , PRD_CMP_SERI_NO
    , CMP_CODE
    , AS_REQ_WRKR_REQ_NO
    , AS_REQ_CMP_NM
    , AS_REQ_AREA_CODE
    , LOCAL_NM
    , AS_REQ_YMD
    , AS_REQ_NAME
    , AS_REQ_TEL
    , TROUB_CNTS
    , STATE
    , REG_YMD)
    SELECT FIMS_NO
         , (select atcl_cat_code from t_cmm_item_dtl where t_cmm_item_dtl.atcl_code = TEMP_LIN_FIMS_AS.ATCL_CODE)
         , ATCL_CODE
         , SKT_SERI_NO
         , PRD_CMP_SERI_NO
         , CMP_CODE
         , AS_REQ_WRKR_REQ_NO
         , AS_REQ_CMP_NM
         , AS_REQ_AREA_CODE
         , LOCAL_NM
         , AS_REQ_YMD
         , AS_REQ_NAME
         , AS_REQ_TEL
         , TROUB_CNTS
         , replace(STATE, '#', '')      as state
         , DATE_FORMAT(NOW(), '%Y%m%d') as REG_YMD
    FROM TEMP_LIN_FIMS_AS;

END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SC_FIMS_CONT`()
    COMMENT 'FIMS 계약데이터 입력'
BEGIN

    DROP TEMPORARY TABLE IF EXISTS TEMP_LIN_FIMS_CONT;
    CREATE TEMPORARY TABLE TEMP_LIN_FIMS_CONT AS
    SELECT a.EWH_PLN_DD
         , a.PPAY_DD
         , a.AREA_NO
         , max(a.AREA_NM)                                                                         AS AREA_NM
         , CONCAT('0000000', a.MAT_CD)                                                            AS MAT_CD
         , a.MAT_NM
         , sum(a.PPAY_CNT)                                                                        AS PPAY_CNT
         , C.WRKR_REG_NO                                                                          AS DL_REG_NUM
         , max(a.DL_CORP_NM)                                                                      AS DL_CORP_NM
         , C.CMP_CODE
         , CONCAT(a.EWH_PLN_DD, a.PPAY_DD, a.AREA_NO, C.CMP_CODE, IFNULL(REG_ID, '111111111111')) AS FIMS_CONT_IND
         , max(AFE_YY)                                                                            AS AFE_YY
         , max(AFE_TMS)                                                                           AS AFE_TMS
         , IFNULL(REG_ID, '111111111111')                                                         AS reg_id
         , max(REG_NM)                                                                            AS REG_NM
         , max(HP_NO)                                                                             AS HP_NO
         , max(PPAY_RMKS)                                                                         AS PPAY_RMKS
    FROM T_LIN_FIMS_CONT_TMP a
             LEFT JOIN t_cmm_cmp c
                       ON FC_FORMAT_WRKRREGNO(C.WRKR_REG_NO) = a.DL_REG_NUM
    WHERE c.CMP_CODE is NOT null -- 등록되지 않은 회사 제외
    GROUP BY a.EWH_PLN_DD, a.PPAY_DD, a.AREA_NO
           , C.WRKR_REG_NO
           , C.CMP_CODE
           , CONCAT(a.EWH_PLN_DD, a.PPAY_DD, a.AREA_NO, C.CMP_CODE, IFNULL(REG_ID, '111111111111'))
           , IFNULL(REG_ID, '111111111111');

    /* 납품검사 제외 품목 삭제 */
    DELETE
    FROM TEMP_LIN_FIMS_CONT
    WHERE mat_cd in (select atcl_code from t_cmm_item_dtl where IFNULL(exam_except_yn, 'N') = 'Y');

    /* 기존 데이타중 검사신청 내용 없이 임시 테이블에 있는 것과 같은 내용 삭제  */
    DELETE
    FROM T_DLVR_PPAY_CONT
    WHERE CONCAT(ppay_cont_info_seq, MAT_CD)
              IN (SELECT CONCAT(FIMS_CONT_IND, MAT_CD)
                  FROM TEMP_LIN_FIMS_CONT A
                  WHERE NOT EXISTS (SELECT *
                                    FROM T_DLVR_EXAM_REQ_item B
                                    WHERE A.FIMS_CONT_IND = B.ppay_cont_info_seq
                                      AND A.MAT_CD = B.atcl_code
                                      AND ppay_cont_info_seq <> ''));


    /* 최종 Data 반영 */
    INSERT INTO T_DLVR_PPAY_CONT (ppay_cont_info_seq, EWH_PLN_DD, PPAY_DD, AREA_NO, AREA_NM,
                                  MAT_CD, MAT_NM, PPAY_CNT, DL_REG_NUM, DL_CORP_NM,
                                  CMP_CODE, AFE_YEAR, AFE_CHASU, RQSTR_ID, RQSTR_NM, TELNO, REM,
                                  PPAY_CONT_GBN, IVT_GBN, REG_YMD, CONFDT)
    SELECT fims_cont_ind,
           EWH_PLN_DD,
           PPAY_DD,
           AREA_NO,
           AREA_NM,
           MAT_CD,
           MAT_NM,
           PPAY_CNT,
           DL_REG_NUM,
           DL_CORP_NM,
           CMP_CODE,
           AFE_YY,
           AFE_TMS,
           right(REG_ID, 7),
           REG_NM,
           HP_NO,
           PPAY_RMKS,
           'C70001',
           'C47001',
           DATE_FORMAT(NOW(), '%Y%m%d'),
           DATE_FORMAT(NOW(), '%Y%m%d')
    FROM TEMP_LIN_FIMS_CONT A
    WHERE NOT EXISTS
              (SELECT *
               FROM T_DLVR_EXAM_REQ_item B
               where A.FIMS_CONT_IND = B.ppay_cont_info_seq
                 AND A.MAT_CD = B.atcl_code
                 AND ppay_cont_info_seq <> '');


    UPDATE t_cmm_item_dtl
    SET record_ver  = null
      , record_code = null
    WHERE record_ver = '0';

END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SC_IMS_TO_QAS`()
    COMMENT 'IMS조직정보 가져오기'
begin	
   
	DECLARE done BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            @ERR_NO = MYSQL_ERRNO ,
            @MSG = MESSAGE_TEXT;

        ROLLBACK;

        CALL SP_INSERT_SYSTEM_JOB_LOG(
                'IMS_TO_QAS'
            , @LogParam
            , 'FAIL'
            , CONCAT('[', @ERR_NO, '] ', @MSG)
            , @LogArgs
            , @START_DATETIME
             );
    END;
   
    SET @LogParam = '{"_comment": "인사정보 동기화","query": "CALL SC_IMS_TO_QAS();"}';
    SET @LogArgs = 'procedure IMS_TO_QAS';
    SET @START_DATETIME = NOW();
    SET @PREVIOUS_USERS = 0;
    SET @CURRENT_USERS = 0;
	
	START TRANSACTION;
	
	-- ===================================
	--  SK조직정보 - 부서 || SK_ORG_TBL 업데이트
	-- ===================================
    TRUNCATE sk_org_tbl;
    INSERT INTO sk_org_tbl( SK_ID
                          , SK_NAME
                          , SK_PARENT_ID
                          , SK_ORDER
                          , SK_DESCRIPTION
                          , SK_STATUS
                          , SK_SDATE
                          , SK_EDATE
                          , SK_TYPE
                          , SK_DIREMPNO
                          , SK_LEVELCD
                          , SK_WRKPLC
                          , SK_T_FLAG
                          , SK_CREATE_USER
                          , SK_UPDATE_USER
                          , SK_CREATE_TIME
                          , SK_UPDATE_TIME)
    SELECT INDEPT
         , SOSOK
         , HIGHPARTDEPT
         , OUTDEPT
         , TSOSOK
         , IF(T_FLAG = 'D', 'N', 'Y')
         , CRTYYMMDD
         , DESTRUCTDD
         , NULL
         , DIREMPNO
         , LEVELCD
         , WRKPLC
         , T_FLAG
         , '배치작업'
         , '배치작업'
         , DATE_FORMAT(SENDDT, '%Y%m%d%H%i%S')
         , DATE_FORMAT(SENDDT, '%Y%m%d%H%i%S')
    FROM INF_DEPT_INFO_RCV;
	
   
    -- ===================================
	--  SK조직정보 - 사용자 || SK_USER_TBL 업데이트
	-- ===================================  
	
	-- ILM에 존재하는 모든 계정은 QAS 에도 동일하게 생성함
	-- 단, QAS 사용(로그인)을 위한 최소한의 권한은 특정부서(ICT Infra) 이하 구성원으로 제한함
	-- ** 아래 쿼리는 ICT Infra 구성원을 tempQasManagers 임시 테이블로 추출하기 위한 용도입니다.
	create temporary table if not exists tempQasManagers ( UserId VARCHAR(8) NOT NULL );	
	insert into tempQasManagers (UserId)
	WITH RECURSIVE cte AS
	(
		select d.* 
		from inf_dept_info_rcv d
		where d.indept = '00001350' -- ICT Infra
		union all
		select d.*
		from inf_dept_info_rcv d
			inner join cte c on c.indept = d.highpartdept	
	)
	select u.EMPNO
	from cte as c
	inner join inf_person_info_rcv u on u.INDEPT = c.INDEPT
	;

	/* ======================================
	 	[사용자 구분코드]
	 	C55001	SKT	=> 내부사용자
		C55002	협력사	=> 외부사용자
		C55003	협력협체 | QAS 사용자 대상은 아님, 협력사의 원청협력업체 관리 용도 (구시스템)
	 	[사용자 상태코드]
	 	C62001	삭제	=> 퇴직, 삭제 처리 시 | 사용자 목록에서 제외됨
		C62002	미승인	=> 미승인 처리 시 | 사용자 목록에는 유지
		C62003	승인	=> 최초가입, 승인 처리 시 | 사용자 목록에 유지
	 * ===================================== */


	-- ILM 에만 존재하고 QAS에 없는 사용자는 신규 사용자로 판단함
	-- 사용자 추가 및 기본권한(Network 매니저)을 부여
	insert into sk_user_tbl
	( SK_ID, SK_NAME, INDEPT, USR_GBN, CUR_USR_ID, TELNO, MOBILENO, EMAIL, CMP_CODE, STATUS, DEL_YN, SK_JBGRP, SK_JBRANK, SK_JBCHARGE, SK_HOLDOFFIDIVI, SK_PLACE, SK_CREATE_TIME)
	select 
		ipir.EMPNO, ipir.HNAME, ipir.INDEPT, 'C55001', ipir.EMPNO, ipir.TELNO, ipir.MOVETELNO, ipir.EMAIL, 'CP000000', 'C62003', ipir.DEL_YN, ipir.JBGRP, ipir.JBRANK, ipir.JBCHARGE, ipir.HOLDOFFIDIVI, ipir.PLACE, DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
	from inf_person_info_rcv ipir	
	where ipir.EMPNO not in (select a.SK_ID from sk_user_tbl a)
	;
	
	-- ILM 데이터 기준으로 SKT(내부) 사용자 기본 정보 업데이트
	update sk_user_tbl u
	join inf_person_info_rcv i on i.EMPNO = u.SK_ID
    set
		u.SK_NAME         = i.HNAME,
		u.INDEPT          = i.INDEPT,
		u.TELNO           = i.TELNO,
		u.MOBILENO        = i.MOVETELNO,
		u.EMAIL           = i.EMAIL,
		u.DEL_YN          = i.DEL_YN,
		u.SK_JBGRP        = i.JBGRP,
		u.SK_JBRANK       = i.JBRANK,
		u.SK_JBCHARGE     = i.JBCHARGE,
		u.SK_HOLDOFFIDIVI = i.HOLDOFFIDIVI,
		u.SK_PLACE        = i.PLACE,
		u.SK_UPDATE_TIME  = DATE_FORMAT(i.SENDDT, '%Y%m%d%H%i%S')
	where u.USR_GBN = 'C55001'
	;
	
	-- ILM 존재하지 않는 사용자 + SKT(내부) 사용자인 경우 => 퇴직 처리
	update sk_user_tbl 
	set DEL_YN = 'Y', STATUS = 'C62001'
	where 
		-- SKT 사용자 대상
		USR_GBN = 'C55001'
		and 
		-- ILM 인사데이터 및 QAS 자체관리데이터에 없는 사용자를 대상으로 함
		SK_ID not in
					(
						select person.EMPNO EMPNO from inf_person_info_rcv person
						union
						select spsm.TargetId EMPNO from self_person_sync_mgmt spsm where spsm.TargetType in ('A','U')						
					) 						
		and
		SK_ID not like 'qeas%'							
	;
	
	-- 퇴직 처리 (DEL_YN=Y) 사용자의 상태도 같이 변경해야함	
	update sk_user_tbl 
	set STATUS = 'C62001'
	where USR_GBN = 'C55001' and DEL_YN = 'Y' and STATUS <> 'C62001'
	;

	-- 재입사 등의 사유로 삭제처리(DEL_YN=Y) 상태가 N으로 변경된 경우 
	-- STATUS값도 (삭제:C62001)에서 (미승인:C62002)으로 변경해준다.
	update sk_user_tbl 
	set STATUS = 'C62002'
	where USR_GBN = 'C55001' and DEL_YN = 'N' and STATUS = 'C62001'
	;
	
	-- QAS최소권한(tempQasManagers) 대상자 중 기본 role이 부여되지 않은 사용자에 대해 기본 권한 부여
    insert ignore into sk_role_mapping_tbl (SK_ROLE_ID, SK_REF_1, SK_REF_2, SK_TYPE, SK_CREATE_USER, SK_CREATE_TIME)
    select 'R000000001', m.UserId, 'N/A', 'U', 'System', DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
	from tempQasManagers m
	where m.UserId not in 
						(
							select srmt.SK_REF_1 
							from sk_role_mapping_tbl srmt
							where srmt.SK_TYPE ='U'						
						)
	;
	
	-- QAS 삭제(퇴직자) 상태 사용자의 Role 회수
	delete from sk_role_mapping_tbl srmt where srmt.SK_TYPE ='U' and srmt.SK_REF_1 not in (select sut.SK_ID from sk_user_tbl sut where sut.DEL_YN <> 'Y')
	;	

	-- 삭제(퇴직) 처리된 사용자는 각 장비군 담당자에서 제거함 (삭제 Y가 아니고 상태코드가 승인(C62003)상태인 사용자를 제외한 담당자를 삭제 처리)
	delete from t_sys_usr_item_class a where a.USR_ID not in (select b.SK_ID from sk_user_tbl b where b.DEL_YN <> 'Y' and b.STATUS in ('C62003') )
	;


	/* AS-IS 인사동기화 백업
    DECLARE _EMPNO CHAR(7);
    DECLARE _HNAME VARCHAR(40);
    DECLARE _INDEPT VARCHAR(8);
    DECLARE _TELNO VARCHAR(30);
    DECLARE _MOVETELNO VARCHAR(30);
    DECLARE _EMAIL VARCHAR(50);
    DECLARE _DEL_YN CHAR(1);
    DECLARE _JBGRP VARCHAR(3);
    DECLARE _JBRANK VARCHAR(2);
    DECLARE _JBCHARGE VARCHAR(3);
    DECLARE _HOLDOFFIDIVI VARCHAR(1);
    DECLARE _PLACE VARCHAR(4);
    DECLARE _T_FLAG CHAR(1);

    DECLARE done BOOLEAN DEFAULT FALSE;

    DECLARE CURSOR_PERSON_INFO CURSOR FOR
        SELECT EMPNO
             , IFNULL(HNAME, '')
             , IFNULL(INDEPT, '')
             , CONCAT('', IFNULL(TELNO, ''))
             , CONCAT('', IFNULL(MOVETELNO, ''))
             , IFNULL(EMAIL, '')
             , IF(T_FLAG = 'D', 'Y', 'N')
             , JBGRP
             , JBRANK
             , JBCHARGE
             , HOLDOFFIDIVI
             , PLACE
             , T_FLAG
        FROM INF_PERSON_INFO_RCV
        WHERE empno NOT LIKE '107%'
            and indept in (SELECT indept
                           FROM INF_DEPT_INFO_RCV
                           where outdept >= '106000' and outdept <= '106999'
                              or INDEPT in ('00003438', '00004191', '00004011', '00001671'))
           or empno in ('1102085', '1105249', '1105009', '1101630', '1103199');

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            GET DIAGNOSTICS CONDITION 1
                @ERR_NO = MYSQL_ERRNO ,
                @MSG = MESSAGE_TEXT;

            ROLLBACK;

            CALL SP_INSERT_SYSTEM_JOB_LOG(
                    'IMS_TO_QAS'
                , @LogParam
                , 'FAIL'
                , CONCAT('[', @ERR_NO, '] ', @MSG)
                , @LogArgs
                , @START_DATETIME
                 );
        END;
    
    SET @LogParam = '{"_comment": "인사정보 동기화","query": "CALL SC_IMS_TO_QAS();"}';
    SET @LogArgs = 'procedure IMS_TO_QAS';
    SET @START_DATETIME = NOW();
    SET @IN = 0;
    SET @UP = 0;

    -- SK_ORG_TBL 업데이트
    TRUNCATE sk_org_tbl;
    INSERT INTO sk_org_tbl( SK_ID
                          , SK_NAME
                          , SK_PARENT_ID
                          , SK_ORDER
                          , SK_DESCRIPTION
                          , SK_STATUS
                          , SK_SDATE
                          , SK_EDATE
                          , SK_TYPE
                          , SK_DIREMPNO
                          , SK_LEVELCD
                          , SK_WRKPLC
                          , SK_T_FLAG
                          , SK_CREATE_USER
                          , SK_UPDATE_USER
                          , SK_CREATE_TIME
                          , SK_UPDATE_TIME)
    SELECT INDEPT
         , SOSOK
         , HIGHPARTDEPT
         , OUTDEPT
         , TSOSOK
         , IF(T_FLAG = 'D', 'N', 'Y')
         , CRTYYMMDD
         , DESTRUCTDD
         , NULL
         , DIREMPNO
         , LEVELCD
         , WRKPLC
         , T_FLAG
         , '배치작업'
         , '배치작업'
         , DATE_FORMAT(SENDDT, '%Y%m%d%H%i%S')
         , DATE_FORMAT(SENDDT, '%Y%m%d%H%i%S')
    FROM INF_DEPT_INFO_RCV;

    -- 인사정보
    OPEN CURSOR_PERSON_INFO;
    SELECT FOUND_ROWS() INTO @rowCount;

    START TRANSACTION;
    
    read_loop: LOOP
        FETCH CURSOR_PERSON_INFO
            INTO _EMPNO, _HNAME, _INDEPT, _TELNO, _MOVETELNO, _EMAIL, _DEL_YN, _JBGRP, _JBRANK, _JBCHARGE, _HOLDOFFIDIVI, _PLACE, _T_FLAG;
        
        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT COUNT(*)
        FROM SK_USER_TBL
        WHERE SK_ID = _EMPNO
        INTO @SK_COUNT;

        IF @SK_COUNT > 0 THEN
            UPDATE SK_USER_TBL
            SET SK_NAME         = _HNAME
              , INDEPT          = _INDEPT
              , TELNO           = _TELNO
              , MOBILENO        = _MOVETELNO
              , EMAIL           = _EMAIL
              , DEL_YN          = _DEL_YN
              , SK_JBGRP        = _JBGRP
              , SK_JBRANK       = _JBRANK
              , SK_JBCHARGE     = _JBCHARGE
              , SK_HOLDOFFIDIVI = _HOLDOFFIDIVI
              , SK_PLACE        = _PLACE
              , SK_UPDATE_TIME  = DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
            WHERE SK_ID = _EMPNO;

            SET @UP = @UP + 1;
        ELSE
            INSERT INTO SK_USER_TBL
            ( SK_ID
            , SK_NAME
            , INDEPT
            , USR_GBN
            , CUR_USR_ID
            , TELNO
            , MOBILENO
            , EMAIL
            , CMP_CODE
            , STATUS
            , DEL_YN
            , SK_JBGRP
            , SK_JBRANK
            , SK_JBCHARGE
            , SK_HOLDOFFIDIVI
            , SK_PLACE
            , SK_CREATE_TIME)
            VALUES ( _EMPNO
                   , _HNAME
                   , _INDEPT
                   , 'C55001'
                   , _EMPNO
                   , _TELNO
                   , _MOVETELNO
                   , _EMAIL
                   , 'CP000000'
                   , 'C62003'
                   , _DEL_YN
                   , _JBGRP
                   , _JBRANK
                   , _JBCHARGE
                   , _HOLDOFFIDIVI
                   , _PLACE
                   , DATE_FORMAT(NOW(), '%Y%m%d%H%i%S'));

            -- 매핑테이블
            INSERT INTO SK_ROLE_MAPPING_TBL
            ( SK_ROLE_ID
            , SK_REF_1
            , SK_REF_2
            , SK_TYPE)
            VALUES ( 'R000000001'
                   , _EMPNO
                   , 'N/A'
                   , 'U');

            SET @IN = @IN + 1;
        END IF;
    END LOOP;

    CLOSE CURSOR_PERSON_INFO;
    */

	# 자체 인사정보 처리
    CALL SP_SYNC_SKTUSERS();

	# 로그 기록
    CALL SP_INSERT_SYSTEM_JOB_LOG(
            'IMS_TO_QAS'
        , @LogParam
        , 'SUCCESS'
		#, concat('기존 사용자 : ',@PREVIOUS_USERS, '명,  rows inserted and ', @CURRENT_USERS, ' rows updated for SK_USER_TBL')
        , 'ILM 데이터를 QAS 사용자 계정으로 동기화 완료 했습니다.'
        , @LogArgs
        , @START_DATETIME
         );

    COMMIT;
END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SC_MRCS_AS`()
    COMMENT 'MRCS AS 데이터 입력'
BEGIN

    -- 원본 데이터 저장
    DELETE
    FROM t_lin_mrcs_as_info_raw raw
    WHERE EXISTS (SELECT FSRNO
                  FROM t_lin_mrcs_as_info_tmp tmp
                  WHERE raw.FSRNO = tmp.FSRNO
                    AND raw.FCDSTBLTYPE = tmp.FCDSTBLTYPE
                    AND raw.FCDLTBLREASON = tmp.FCDLTBLREASON
                    AND raw.FCDMTBLREASON = tmp.FCDMTBLREASON
                    AND raw.FCDSTBLREASON = tmp.FCDSTBLREASON);

    INSERT INTO t_lin_mrcs_as_info_raw
    SELECT *
    FROM t_lin_mrcs_as_info_tmp temp;

    -- 중복 제거
    DELETE
    FROM T_LIN_MRCS_AS_INFO A
    WHERE EXISTS (SELECT FSRNO
                  FROM t_lin_mrcs_as_info_tmp tmp
                  WHERE right(A.mrcs_no, 6) = CAST(tmp.FSRNO AS char(6))
                    AND A.falt_divi = IFNULL(NULLIF(tmp.FCDSTBLTYPE, ''), 'xxx')
                    AND A.falt_cause = tmp.FCDLTBLREASON
                    AND A.shape_cause = tmp.FCDMTBLREASON
                    AND A.as_divi = tmp.FCDSTBLREASON);

    INSERT INTO `T_LIN_MRCS_AS_INFO` ( MRCS_NO
                                     , AS_AREA_CODE
                                     , CMP_SERI_NO
                                     , LOCAL_NAME
                                     , TROUB_CTNT
                                     , AS_REQ_NAME
                                     , AS_REQ_TEL
                                     , AS_REQ_DATE
                                     , STOCK_DATE
                                     , DLVR_DATE
                                     , DTL_HAND_CTNT
                                     , M_TROUB_PART_CODE
                                     , M_DTL_SHAPE_CODE
                                     , M_DTL_HAND_TYPE
                                     , M_DIVI
                                     , ITEM_CODE
                                     , FIRST_SHIP_YMD
                                     , REG_YMD
                                     , REP_DIVI
                                     , REP_DO_RE_DIVI
                                     , REP_TYPE
                                     , SYSTEM_DIVI
                                     , FALT_DIVI
                                     , FALT_CONT
                                     , FALT_CAUSE
                                     , SHAPE_CAUSE
                                     , SHAPE_CONT
                                     , AS_DIVI
                                     , AS_CONT
                                     , SRC_CMP_NM
                                     , WRKR_REG_NO)
    SELECT CONCAT('NPE', substring(A.FDDSKPROC, 1, 4), LPAD(FSRNO, 6, '0')) AS MRCS_NO
         , A.FGBJY                                  -- 지역구분코드
         , A.FNOSERIAL                              -- 유니트 S/N
         , A.FNMRPT                                 -- 중계기명
         , A.FTROUBLE                               -- 수리요청시 고장내역
         , A.FINSPECTOR                             -- 현장점검자
         , A.FINSPECTORTEL                          -- 현장점검자 연락처
         , DATE_FORMAT(A.FDDSKPROC, '%Y%m%d')       -- SKT 요청일시(작업등록일시)
         , DATE_FORMAT(A.FDDVNDIN, '%Y%m%d')        -- VENDOR 실제 입고일시
         , DATE_FORMAT(IFNULL(A.FDDVNDPROC, A.FDDSKPROC), '%Y%m%d')
         , TRIM(A.FVNDPROC)                         -- 벤더 조치내역, 수리내역
         , A.FCDGRP                                 -- 고장부위 대분류
         , A.FCDCURE                                -- 고장부위 중분류
         , CASE a.FTOK
               WHEN 'T' THEN 'A'
               WHEN 'S' THEN 'B'
               WHEN 'C' THEN 'C'
               ELSE 'C'
        END                                         -- TOK구분 C:소자교체, F:교체, J:장비튜닝, K:기타, N: 수리불가, :T:TOK(TEST OK), U: 유니트 대게체, W:S/W작업
         , A.FGBSRTYPE                              -- 요청구분코드 G: 일상점검, R: 현장점검요청, M:모듈수리
         , FC_TO_FULL_ATCL_CODE(A.FQEASCODE)        -- 물품코드
         , DATE_FORMAT(A.FDDRPTOUT, '%Y%m%d')       -- 벤더 최초 출하일자
         , DATE_FORMAT(A.FDDVNDPROC, '%Y%m%d')      -- 벤더 조치일
         , A.FJRRPT                                 -- 중계기 종류 코드
         , A.FGBCD                                  -- 도너/리모트 구분코드
         , A.FCDRPTMD                               -- 중계기 타입 코드(rcs, wrcs코드)
         , A.FGBERP                                 -- RCS 미수용 구분
         , IFNULL(NULLIF(FCDSTBLTYPE, ''), 'xxx')   -- 고장유형소
         , A.FTBLTYPEETC                            -- 기타불량
         , A.FCDLTBLREASON                          -- 고장원인 대
         , A.FCDMTBLREASON                          -- 고장원인 소
         , A.FTBLREASONMETC                         -- 세부원인 기타
         , A.FCDSTBLREASON                          -- 고장원인 중
         , A.FTBLREASONSETC                         -- 조치내역 기타
         , A.TRAD_NAME                              -- 중계기제조사 업체명
         , REGEXP_REPLACE(A.ENPR_NMBR, '[-| ]', '') -- 수리의뢰처 사업자등록번호
    FROM t_lin_mrcs_as_info_tmp a;

    UPDATE t_cmm_item_dtl
    SET nams_yn='N'
    WHERE substring(atcl_cat_code, 1, 2) IN ('01', '02', '07', '06')
      AND IFNULL(nams_yn, '') != 'N'
      AND use_yn = 'Y'
      AND IFNULL(exam_except_yn, '') = 'Y'
      AND reg_ymd >= DATE_FORMAT(NOW() - INTERVAL 2 DAY, '%Y%m%d')
      AND reg_ymd <> '99991231';

    SELECT YEAR(FDDVNDPROC)
    INTO @year
    FROM t_lin_mrcs_as_info_tmp
    LIMIT 1;

    -- 중계기 A/S율
    CALL SP_INSERT_MRCS_PPM_AS(@year);

END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SC_NAMS_AS`()
    COMMENT 'NAMS AS 데이터 입력'
BEGIN

    -- 원본 데이터 저장
    DELETE
    FROM t_lin_nams_as_info_raw raw
    WHERE EXISTS (SELECT 1
                  FROM t_lin_nams_as_info_tmp tmp
                  WHERE raw.BARE_CODE = tmp.BARE_CODE
                    AND raw.CHGE_DATE = tmp.CHGE_DATE);

    INSERT INTO t_lin_nams_as_info_raw
    SELECT *
    FROM t_lin_nams_as_info_tmp temp;

    -- 중복 제거
    DELETE
    FROM T_LIN_NAMS_AS_INFO A
    WHERE EXISTS (SELECT 1
                  FROM t_lin_nams_as_info_tmp tmp
                  WHERE A.SKT_SERI_NO = tmp.BARE_CODE
                    AND A.REPR_ENT_DAY = tmp.CHGE_DATE);

    SELECT CURR_DATE
    INTO @StrDate
    FROM t_lin_nams_as_info_tmp
    LIMIT 1;

    SELECT IFNULL(MAX(RIGHT(NAMS_NO, 3)), 0)
    FROM T_LIN_NAMS_AS_INFO
    WHERE NAMS_NO LIKE CONCAT('NM', @StrDate, '%')
    INTO @StartNumber;

    INSERT INTO T_LIN_NAMS_AS_INFO (
                                     `NAMS_NO`, `NAMS_AS_NM`, `TEAM_CODE`, `BSIN_GBN`, `BSIN_GBN_CODE`, `FACIL_GBN`, `FACIL_GBN_CODE`, `EQI_GBN`, `EQI_GBN_CODE`, `ATCL_CODE`
                                   , `ATCL_NM`, `SKT_SERI_NO`, `PRD_CMP_SERI_NO`, `PRD_YMD`, `REPR_ENT_DAY`, `FIRST_REG_YMD`, `SK_TROUBCODE1`, `SK_TROUB1`, `SK_TROUBCODE2`, `SK_TROUB2`
                                   , `SK_TROUBCODE3`, `SK_TROUB3`, `REPR_CMP_TROUBCODE1`, `REPR_CMP_TROUB1`, `REPR_CMP_TROUBCODE2`, `REPR_CMP_TROUB2`, `REPR_CMP_TROUBCODE3`, `REPR_CMP_TROUB3`
                                   , `REPR_CTN1`, `REPR_CTN2`, `REPR_CTN3`, `REPR_DTL_LOC1`, `REPR_DTL_LOC2`, `REPR_DTL_LOC3`, `REPR_DTL_LOC4`, `REPR_DTL_LOC5`, `REPR_DTL_LOC6`, `REPR_DTL_LOC7`
                                   , `REPR_DTL_LOC8`, `REPR_DTL_LOC9`, `REPR_DTL_LOC10`, `PRD_CMP`, `PRD_CMP_WRKR_NO`, `MADE_CMP`, `MADE_CMP_WRKR_NO`, `REG_YMD`, `ATCL_CAT_CODE`)
    SELECT CONCAT('NM', @StrDate, LPAD(ROW_NUMBER() OVER (ORDER BY (SELECT 1)) + @StartNumber, 3, '0')) AS NAMS_NO
         , t.FUNC_DEPT , t.DEPT_CODE , t.FUNC_SAUP , t.SAUP_DVSN , t.FUNC_SISL , t.SISL_DVSN , t.SISL_NAME , t.PREV_NETW , FC_TO_FULL_ATCL_CODE(t.PRDT_TPCD)
         , t.PRVS_NAME , t.BARE_CODE , t.MKCO_BACO
         , ifnull(t.JEJO_DATE, (case length(t.BARE_CODE)
                                    when 13 then concat('20', substr(t.BARE_CODE, 7, 2), '1231')
                                    when 15 then concat('20', substr(t.BARE_CODE, 8, 2), '1231')
                                    else '' end))                                                       AS PRD_YMD
         , t.CHGE_DATE , t.SCRE_DATE , t.GOJN_SKC1 , t.GOJN_SKT1 , t.GOJN_SKC2 , t.GOJN_SKT2
         , t.GOJN_SKC3 , t.GOJN_SKT3 , t.GOJN_TRC1 , t.GOJN_TRD1 , t.GOJN_TRC2 , t.GOJN_TRD2 , t.GOJN_TRC3 , t.GOJN_TRD3
         , t.SURI_TRD1 , t.SURI_TRD2 , t.SURI_TRD3 , t.SURI_PO01 , t.SURI_PO02 , t.SURI_PO03 , t.SURI_PO04 , t.SURI_PO05 , t.SURI_PO06 , t.SURI_PO07
         , t.SURI_PO08 , t.SURI_PO09 , t.SURI_PO10 , t.TRAD_NAME
         , IFNULL(NULLIF(ENPR_NMBR, ''), (select WRKR_REG_NO from t_cmp_map where CMP_NM = t.TRAD_NAME LIMIT 1)) -- NOTE: 오픈 이후 NAMS에서 파일에 사업자 번호를 추가해주면 t_cmp_map 참조 제거 및 t_cmp_map 테이블 제거
         , t.TRAD_NAM2
         , IFNULL(NULLIF(ENPR_NMBR2, ''), (select WRKR_REG_NO from t_cmp_map where CMP_NM = t.TRAD_NAM2 LIMIT 1)) -- NOTE: 오픈 이후 NAMS에서 파일에 사업자 번호를 추가해주면 t_cmp_map 참조 제거 및 t_cmp_map 테이블 제거
         , t.CURR_DATE , NULL
    FROM t_lin_nams_as_info_tmp t;

    SET @year = YEAR(@StrDate);

    -- 전송장비
    CALL SP_INSERT_NAMS_NPR_06(@year);

    -- 주장비
    CALL SP_INSERT_NAMS_NPR(@year);

END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_DELETE_DLVR_EXAM_REQ`(IN P_DLVR_EXAM_REQ_NO varchar(13), IN P_VER int)
    COMMENT '납품검사 신청서 삭제'
BEGIN
    -- 해당 신청의 모든 버전에 대해 삭제하도록 ver 체크 안 함

    -- 납품검사 신청 및 관련 데이터 모두 삭제
    -- 신청서삭제
    DELETE FROM t_dlvr_exam_req WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 신청서 임시물품 삭제
    DELETE FROM t_cmm_item_dtl
           WHERE ATCL_CODE IN (SELECT ATCL_CODE
                        FROM T_DLVR_EXAM_REQ_ITEM
                        WHERE PPAY_CONT_INFO_SEQ IS NOT NULL
                          AND ATCL_CODE LIKE '%T%'
                          AND DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO
                          -- AND VER = P_VER
                        );
    -- 신청서 물품삭제
    DELETE FROM t_dlvr_exam_req_item WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 초도장비 삭제
    DELETE FROM t_dlvr_fst_eqp WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 신규물품등록정보 삭제
    DELETE FROM t_lin_erp_new_item
            WHERE SNO IN (SELECT SNO
                      FROM T_DLVR_EXAM_PPAY_ITEM
                      WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO); -- AND VER = P_VER);
    -- 납품검사 선납물품 삭제
    DELETE FROM t_dlvr_exam_ppay_item WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 필증발급
    DELETE FROM t_dlvr_cert_isu WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- erp 승인신청 물품
    DELETE FROM t_dlvr_erp_req_atcl WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 시정초치
    DELETE FROM t_dlvr_exam_corr WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 시정초치 반려
    DELETE FROM t_dlvr_exam_corr_ret WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 납품검사선납물품
    DELETE FROM t_dlvr_exam_req_ret WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    -- 첨부파일
    DELETE FROM sk_upload_tbl where SK_DOC_ID LIKE CONCAT(P_DLVR_EXAM_REQ_NO, '%') AND SK_PROGRAM = 'upload_req.exm';

    -- 해당 납품검사 신청에 연결된 시험데이터 삭제
    DROP TEMPORARY TABLE IF EXISTS T_TARGET;

    CREATE TEMPORARY TABLE T_TARGET AS
    SELECT dlvr_rec_no
    FROM t_dlvr_exam_rec
    WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO;
     -- AND VER = P_VER;

    DELETE FROM t_dlvr_exam_rec WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_rec_spec WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_1 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_2 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_3 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_4 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_5 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_6 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_7 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_8 WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    DELETE FROM t_dlvr_exam_data_result WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);    
    DELETE FROM t_eqi_serial WHERE DLVR_EXAM_REQ_NO = P_DLVR_EXAM_REQ_NO; -- AND VER = P_VER;
    DELETE FROM t_dlvr_exam_upload_file WHERE DLVR_REC_NO in (SELECT * FROM T_TARGET);
    
    DROP TEMPORARY TABLE T_TARGET;
end;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_GENERATE_ANALYSIS_DATA_BATCH`()
    COMMENT '지표분석 데이터 전체 기간생성'
BEGIN

    SET @jobName = 'AS_ANALYSIS_ALL';
    SET @startDatetime = NOW();
    SET @message = '';

    SET @year = 2003;
    SET @end = YEAR(NOW());

    analLoop:
    WHILE @year < @end
        DO
            CALL SP_SET_JOB_STATE(@jobName, @@hostname, 'RUN', CONCAT('[', @year, '] 중계기'));
            CALL SP_INSERT_MRCS_PPM_AS(@year);
            IF EXISTS(SELECT 1 FROM t_job_state WHERE JOB_NAME = @jobName AND STATE = 'ABORT') THEN
                SET @message = CONCAT('Aborted after [', @year, '] 중계기');
                LEAVE analLoop;
            END IF;

            CALL SP_SET_JOB_STATE(@jobName, @@hostname, 'RUN', CONCAT('[', @year, '] 주장비'));
            CALL SP_INSERT_NAMS_NPR(@year);
            IF EXISTS(SELECT 1 FROM t_job_state WHERE JOB_NAME = @jobName AND STATE = 'ABORT') THEN
                SET @message = CONCAT('Aborted after [', @year, '] 주장비');
                LEAVE analLoop;
            END IF;

            CALL SP_SET_JOB_STATE(@jobName, @@hostname, 'RUN', CONCAT('[', @year, '] 전송장비'));
            CALL SP_INSERT_NAMS_NPR_06(@year);
            IF EXISTS(SELECT 1 FROM t_job_state WHERE JOB_NAME = @jobName AND STATE = 'ABORT') THEN
                SET @message = CONCAT('Aborted after [', @year, '] 전송장비');
                LEAVE analLoop;
            END IF;

            SET @year = @year + 1;
        END WHILE analLoop;

    CALL SP_SET_JOB_STATE(@jobName, @@hostname, 'PAUSE', null);
    CALL SP_INSERT_SYSTEM_JOB_LOG(
            @jobName
        , null
        , 'SUCCESS'
        , @message
        , null
        , @startDatetime
         );
END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_GET_SAMPLING_CRITERIA`(IN P_CMP_CODE varchar(10), IN P_DLVR_REC_NO int,
                                                              IN P_ATCL_CODE varchar(18))
    COMMENT '시험데이터 샘플링 기준 조회'
BEGIN
    SET @yyyymm = EXTRACT(YEAR_MONTH FROM DATE_ADD(NOW(), INTERVAL -1 MONTH));
    SET @spyCmpNm = '';
    SET @category = '';
    
    SELECT b.DISPLAY_NM
    INTO @spyCmpNm
    FROM t_cmm_cmp a
             JOIN t_cmp_name_map b on a.WRKR_REG_NO = b.WRKR_REG_NO
    WHERE CMP_CODE = P_CMP_CODE;

    SELECT ATCL_CAT_CODE
    INTO @category
    FROM t_cmm_item_dtl 
    WHERE ATCL_CODE = P_ATCL_CODE;

    SET @cat1 = SUBSTRING(@category, 1, 2);
    SET @rate := 0.03;
    IF @cat1 in ('01', '02') THEN
        SELECT `VALUE` / 1000000
        INTO @rate
        FROM t_nams_npr_new
        WHERE CATEGORY = @category
          AND SPY_CMP_NM = @spyCmpNm
          AND YYYYMM = @yyyymm
          AND SEQ = 6;
    ELSEIF @cat1 = '06' THEN
        SELECT `VALUE` / 1000000
        INTO @rate
        FROM t_nams_npr_06_new
        WHERE CATEGORY = @category
          AND SPY_CMP_NM = @spyCmpNm
          AND YYYYMM = @yyyymm
          AND SEQ = 6;
    ELSEIF @cat1 = '07' THEN
        SELECT `VALUE` / 1000000
        INTO @rate
        FROM t_mrcs_ppm_as_new
        WHERE CATEGORY = @category
          AND SPY_CMP_NM = @spyCmpNm
          AND YYYYMM = @yyyymm
          AND SEQ = 6;
    END IF;

    -- 3% 이하: 3%
    -- 3% ~ 4%: 4%
    -- 5% 이상: 5%
    SET @rate := (SELECT CASE
                             WHEN @rate <= 0.03 THEN 0.03
                             WHEN @rate >= 0.05 THEN 0.05
                             ELSE 0.04
                             END);

    -- 최소 5건
    SELECT CAST(@rate * 100 AS DECIMAL) as PERCENT,
           COUNT(*) AS TOTAL_COUNT,
           GREATEST(CAST(COUNT(*) * @rate AS DECIMAL), 5) AS SAMPLE_COUNT
    FROM t_dlvr_exam_data_1
    WHERE DLVR_REC_NO = P_DLVR_REC_NO;
end;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_INSERT_COMPANY_NAMES`()
    COMMENT '회사이름 테이블에 신규 회사정보 입력'
BEGIN
    
    INSERT INTO t_cmp_name_map
    SELECT cc.WRKR_REG_NO
         , MAX(cc.CMP_NM) AS CMP_NM
         , FALSE
         , FALSE
    FROM t_cmm_cmp cc
             LEFT JOIN t_cmp_name_map cnm
                       on cc.WRKR_REG_NO = cnm.WRKR_REG_NO
    WHERE cc.USE_YN = 'Y'
      AND cnm.WRKR_REG_NO is null
      -- 사업자 번호 형식이 맞는지 확인
      AND length(REGEXP_REPLACE(cc.WRKR_REG_NO, '[^0-9]', '')) = 10
    -- AND FC_IS_VALID_WRKR_REG_NO(cc.WRKR_REG_NO) = TRUE
    GROUP BY cc.WRKR_REG_NO;

END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_INSERT_MRCS_PPM_AS`(IN Year char(4))
    COMMENT 't_mrcs_ppm_as 입력'
BEGIN

    SET @Year = `Year`;
    SET @TargetStartDate = FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0101'), 11);
    SET @TargetEndDate = CONCAT(@Year, '1231');

    DROP TEMPORARY TABLE IF EXISTS T_REF;

    CREATE TEMPORARY TABLE T_REF AS
    SELECT B.ATCL_CAT_CODE AS category
         , a.LIFNR         AS wrkr_reg_no
    FROM t_dlvr_cont a
             JOIN t_cmm_item_dtl b -- QAS 등록된 물품만 취급
                  ON a.atcl_code = b.atcl_code
    WHERE b.ATCL_CAT_CODE LIKE '07%' -- 중계기
      AND IFNULL(b.nams_yn, '') != 'N'
      AND b.use_yn = 'Y'
      AND a.dlvdt_ymd BETWEEN @TargetStartDate AND @TargetEndDate
    GROUP BY b.ATCL_CAT_CODE, a.LIFNR;

    START TRANSACTION;

    DELETE FROM t_mrcs_ppm_as WHERE asdivi ='ASREG' AND yyyy = @Year;

    -- 12개월 납품 수량
    INSERT INTO t_mrcs_ppm_as
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE              AS category
             , a.LIFNR                      AS wrkr_reg_no
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0101'), 11) AND CONCAT(@Year,'0131'), MENGE, 0)) P_1
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0201'), 11) AND CONCAT(@Year,'0231'), MENGE, 0)) P_2
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0301'), 11) AND CONCAT(@Year,'0331'), MENGE, 0)) P_3
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0401'), 11) AND CONCAT(@Year,'0431'), MENGE, 0)) P_4
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0501'), 11) AND CONCAT(@Year,'0531'), MENGE, 0)) P_5
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0601'), 11) AND CONCAT(@Year,'0631'), MENGE, 0)) P_6
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0701'), 11) AND CONCAT(@Year,'0731'), MENGE, 0)) P_7
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0801'), 11) AND CONCAT(@Year,'0831'), MENGE, 0)) P_8
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'0901'), 11) AND CONCAT(@Year,'0931'), MENGE, 0)) P_9
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'1001'), 11) AND CONCAT(@Year,'1031'), MENGE, 0)) P_10
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'1101'), 11) AND CONCAT(@Year,'1131'), MENGE, 0)) P_11
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year,'1201'), 11) AND CONCAT(@Year,'1231'), MENGE, 0)) P_12
        FROM t_dlvr_cont a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.atcl_code = b.atcl_code
        where b.ATCL_CAT_CODE LIKE '07%' -- 중계기
          and IFNULL(b.nams_yn, '') != 'N'
          and b.use_yn='Y'
          and a.dlvdt_ymd BETWEEN @TargetStartDate AND @TargetEndDate
        group by b.ATCL_CAT_CODE, a.LIFNR
    )
    SELECT @Year as yyyy
         , 'ASREG' as asdivi
         , ref.category
         , CNM.DISPLAY_NM
         , '12개월납품수량' as divi
         , '9' as seq
         , SUM(IFNULL(CTE.P_1, 0)) AS P_1
         , SUM(IFNULL(CTE.P_2, 0)) AS P_2
         , SUM(IFNULL(CTE.P_3, 0)) AS P_3
         , SUM(IFNULL(CTE.P_4, 0)) AS P_4
         , SUM(IFNULL(CTE.P_5, 0)) AS P_5
         , SUM(IFNULL(CTE.P_6, 0)) AS P_6
         , SUM(IFNULL(CTE.P_7, 0)) AS P_7
         , SUM(IFNULL(CTE.P_8, 0)) AS P_8
         , SUM(IFNULL(CTE.P_9, 0)) AS P_9
         , SUM(IFNULL(CTE.P_10, 0)) AS P_10
         , SUM(IFNULL(CTE.P_11, 0)) AS P_11
         , SUM(IFNULL(CTE.P_12, 0)) AS P_12
    FROM T_REF REF
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- 월납품수량
    INSERT INTO t_mrcs_ppm_as
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE AS category
             , a.LIFNR                      AS wrkr_reg_no
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '0131'), MENGE, 0)), 0) P_1
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0201') AND CONCAT(@Year, '0231'), MENGE, 0)), 0) P_2
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0301') AND CONCAT(@Year, '0331'), MENGE, 0)), 0) P_3
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0401') AND CONCAT(@Year, '0431'), MENGE, 0)), 0) P_4
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0501') AND CONCAT(@Year, '0531'), MENGE, 0)), 0) P_5
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0601') AND CONCAT(@Year, '0631'), MENGE, 0)), 0) P_6
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0701') AND CONCAT(@Year, '0731'), MENGE, 0)), 0) P_7
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0801') AND CONCAT(@Year, '0831'), MENGE, 0)), 0) P_8
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0901') AND CONCAT(@Year, '0931'), MENGE, 0)), 0) P_9
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1001') AND CONCAT(@Year, '1031'), MENGE, 0)), 0) P_10
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1101') AND CONCAT(@Year, '1131'), MENGE, 0)), 0) P_11
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1201') AND CONCAT(@Year, '1231'), MENGE, 0)), 0) P_12
        FROM t_dlvr_cont a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.atcl_code = b.atcl_code
        where b.ATCL_CAT_CODE LIKE '07%' -- 중계기
          and IFNULL(b.nams_yn, '') != 'N'
          and b.use_yn='Y'
          and a.dlvdt_ymd BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'1231')
        group by b.ATCL_CAT_CODE, a.LIFNR
    )
    SELECT @Year AS yyyy
         , 'ASREG' AS asdivi
         , ref.category
         , CNM.DISPLAY_NM
         ,'월납품수량' AS divi
         , '8' AS seq
         , SUM(IFNULL(cte.P_1, 0)) AS P_1
         , SUM(IFNULL(cte.P_2, 0)) AS P_2
         , SUM(IFNULL(cte.P_3, 0)) AS P_3
         , SUM(IFNULL(cte.P_4, 0)) AS P_4
         , SUM(IFNULL(cte.P_5, 0)) AS P_5
         , SUM(IFNULL(cte.P_6, 0)) AS P_6
         , SUM(IFNULL(cte.P_7, 0)) AS P_7
         , SUM(IFNULL(cte.P_8, 0)) AS P_8
         , SUM(IFNULL(cte.P_9, 0)) AS P_9
         , SUM(IFNULL(cte.P_10, 0)) AS P_10
         , SUM(IFNULL(cte.P_11, 0)) AS P_11
         , SUM(IFNULL(cte.P_12, 0)) AS P_12
    FROM T_REF REF
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- AS수량
    INSERT INTO t_mrcs_ppm_as
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE              AS category
             , a.WRKR_REG_NO                AS wrkr_reg_no
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '0131'), 1, 0)), 0) C_1
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0201') AND CONCAT(@Year, '0231'), 1, 0)), 0) C_2
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0301') AND CONCAT(@Year, '0331'), 1, 0)), 0) C_3
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0401') AND CONCAT(@Year, '0431'), 1, 0)), 0) C_4
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0501') AND CONCAT(@Year, '0531'), 1, 0)), 0) C_5
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0601') AND CONCAT(@Year, '0631'), 1, 0)), 0) C_6
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0701') AND CONCAT(@Year, '0731'), 1, 0)), 0) C_7
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0801') AND CONCAT(@Year, '0831'), 1, 0)), 0) C_8
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0901') AND CONCAT(@Year, '0931'), 1, 0)), 0) C_9
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '1001') AND CONCAT(@Year, '1031'), 1, 0)), 0) C_10
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '1101') AND CONCAT(@Year, '1131'), 1, 0)), 0) C_11
             , IFNULL(SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '1201') AND CONCAT(@Year, '1231'), 1, 0)), 0) C_12
        FROM T_LIN_MRCS_AS_INFO a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.ITEM_CODE = b.atcl_code
        where b.ATCL_CAT_CODE LIKE '07%' -- 중계기
          AND a.reg_ymd BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'1231')
          AND a.m_divi = 'M'
          AND IFNULL(b.nams_yn, '') != 'N'
          AND b.use_yn='Y'
          AND ABS(DATEDIFF(FIRST_SHIP_YMD, SUBSTRING(a.AS_REQ_DATE,1,8))) < 365
        group by b.ATCL_CAT_CODE, a.wrkr_reg_no
    )
    SELECT @Year AS yyyy
         , 'ASREG' as asdivi
         , ref.category
         , CNM.DISPLAY_NM
         , 'AS수량' as divi
         , '7' as seq
         , SUM(IFNULL(CTE.C_1, 0))  AS P_1
         , SUM(IFNULL(CTE.C_2, 0))  AS P_2
         , SUM(IFNULL(CTE.C_3, 0))  AS P_3
         , SUM(IFNULL(CTE.C_4, 0))  AS P_4
         , SUM(IFNULL(CTE.C_5, 0))  AS P_5
         , SUM(IFNULL(CTE.C_6, 0))  AS P_6
         , SUM(IFNULL(CTE.C_7, 0))  AS P_7
         , SUM(IFNULL(CTE.C_8, 0))  AS P_8
         , SUM(IFNULL(CTE.C_9, 0))  AS P_9
         , SUM(IFNULL(CTE.C_10, 0)) AS P_10
         , SUM(IFNULL(CTE.C_11, 0)) AS P_11
         , SUM(IFNULL(CTE.C_12, 0)) AS P_12
    FROM T_REF REF
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- A/S율(PPM)
    INSERT INTO t_mrcs_ppm_as
    SELECT @Year AS yyyy
         , 'ASREG' AS asdivi
         , T.category
         , T.spy_cmp_nm
         , 'A/S율(PPM)' AS divi
         , '6' AS seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM t_mrcs_ppm_as WHERE yyyy = @Year AND asdivi ='ASREG' AND seq = 9) AS T
             LEFT JOIN (SELECT * FROM t_mrcs_ppm_as WHERE yyyy = @Year AND asdivi ='ASREG' AND seq = 7) AS A
                       ON T.category = A.category
                           AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    DELETE FROM t_mrcs_ppm_as  where asdivi ='ASREQ'  and yyyy = @Year;

    -- 12개월납품수량, 월납품수량. --> ASREG와 동일
    INSERT INTO t_mrcs_ppm_as
    SELECT yyyy
         , 'ASREQ' as asdivi
         , category
         , spy_cmp_nm
         , divi
         , seq
         , P_1
         , P_2
         , P_3
         , P_4
         , P_5
         , P_6
         , P_7
         , P_8
         , P_9
         , P_10
         , P_11
         , P_12
    FROM t_mrcs_ppm_as
    WHERE yyyy = @Year and seq in('9', '8');

    -- AS수량
    INSERT INTO t_mrcs_ppm_as
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE   AS category
             , a.WRKR_REG_NO                AS wrkr_reg_no
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '0131'), 1, 0)), 0) C_1
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0201') AND CONCAT(@Year, '0231'), 1, 0)), 0) C_2
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0301') AND CONCAT(@Year, '0331'), 1, 0)), 0) C_3
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0401') AND CONCAT(@Year, '0431'), 1, 0)), 0) C_4
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0501') AND CONCAT(@Year, '0531'), 1, 0)), 0) C_5
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0601') AND CONCAT(@Year, '0631'), 1, 0)), 0) C_6
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0701') AND CONCAT(@Year, '0731'), 1, 0)), 0) C_7
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0801') AND CONCAT(@Year, '0831'), 1, 0)), 0) C_8
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '0901') AND CONCAT(@Year, '0931'), 1, 0)), 0) C_9
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '1001') AND CONCAT(@Year, '1031'), 1, 0)), 0) C_10
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '1101') AND CONCAT(@Year, '1131'), 1, 0)), 0) C_11
             , IFNULL(SUM(IF(a.AS_REQ_DATE BETWEEN CONCAT(@Year, '1201') AND CONCAT(@Year, '1231'), 1, 0)), 0) C_12
        FROM T_LIN_MRCS_AS_INFO a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.ITEM_CODE = b.atcl_code
        where b.ATCL_CAT_CODE LIKE '07%' -- 중계기
          AND a.AS_REQ_DATE BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'1231')
          AND a.m_divi = 'M'
          AND IFNULL(b.nams_yn, '') != 'N'
          AND b.use_yn='Y'
          AND ABS(DATEDIFF(FIRST_SHIP_YMD, SUBSTRING(a.AS_REQ_DATE,1,8))) < 365
        group by b.ATCL_CAT_CODE, a.wrkr_reg_no
    )
    SELECT @Year AS yyyy
         , 'ASREQ' as asdivi
         , ref.category
         , CNM.DISPLAY_NM
         , 'AS수량' as divi
         , '7' as seq
         , SUM(IFNULL(CTE.C_1, 0))  AS P_1
         , SUM(IFNULL(CTE.C_2, 0))  AS P_2
         , SUM(IFNULL(CTE.C_3, 0))  AS P_3
         , SUM(IFNULL(CTE.C_4, 0))  AS P_4
         , SUM(IFNULL(CTE.C_5, 0))  AS P_5
         , SUM(IFNULL(CTE.C_6, 0))  AS P_6
         , SUM(IFNULL(CTE.C_7, 0))  AS P_7
         , SUM(IFNULL(CTE.C_8, 0))  AS P_8
         , SUM(IFNULL(CTE.C_9, 0))  AS P_9
         , SUM(IFNULL(CTE.C_10, 0)) AS P_10
         , SUM(IFNULL(CTE.C_11, 0)) AS P_11
         , SUM(IFNULL(CTE.C_12, 0)) AS P_12
    FROM T_REF REF
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- A/S율(PPM)
    INSERT INTO t_mrcs_ppm_as
    SELECT @Year AS yyyy
         , 'ASREQ' AS asdivi
         , T.category
         , T.SPY_CMP_NM
         , 'A/S율(PPM)' AS divi
         , '6' AS seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM t_mrcs_ppm_as WHERE yyyy = @Year AND asdivi ='ASREQ' AND seq = 9) AS T
             LEFT JOIN (SELECT * FROM t_mrcs_ppm_as WHERE yyyy = @Year AND asdivi ='ASREQ' AND seq = 7) AS A
                       ON T.category = A.category
                           AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    -- 지정 기간에 납품 또는 AS가 없는 항목 삭제
    WITH CTE AS (
        SELECT * , P_1 + P_2 + P_3 + P_4 + P_5 + P_6 + P_7 + P_8 + P_9 + P_10 + P_11 + P_12 AS SUM
        FROM t_mrcs_ppm_as
        WHERE YYYY = @Year
    )
    DELETE FROM t_mrcs_ppm_as T
    WHERE YYYY = @Year
      AND NOT EXISTS
        (SELECT DISTINCT ASDIVI, CATEGORY, SPY_CMP_NM
         FROM CTE AS filter
         WHERE ((filter.SEQ = 8 AND filter.SUM > 0) OR (filter.SEQ = 7 AND filter.SUM > 0))
           AND filter.CATEGORY = T.CATEGORY
           AND filter.SPY_CMP_NM = T.SPY_CMP_NM
           AND filter.ASDIVI = T.ASDIVI
        );

    COMMIT;

    CALL SP_INSERT_MRCS_PPM_AS_NEW(@year);

    -- 중계기 전체 A/S율
    CALL SP_INSERT_MRCS_TOT_PPM_AS(@year);
END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_INSERT_MRCS_PPM_AS_NEW`(IN year char(4))
    COMMENT 't_mrcs_ppm_as_new 입력'
BEGIN

    START TRANSACTION;

    DELETE FROM T_MRCS_PPM_AS_NEW WHERE yyyymm like CONCAT(`year`, '%');

    SET @month = 1;
    WHILE @month < 13 DO
            INSERT INTO T_MRCS_PPM_AS_NEW
            (
              YYYYMM			-- 년월
            , ASDIVI            -- AS 구분
            , CATEGORY          -- 물품분류 코드
            , SPY_CMP_NM        -- 공급업체 이름
            , SEQ               -- 통계유형코드
            , VALUE             -- 통계값
            )
            SELECT CONCAT(yyyy, LPAD(@month, 2, '0'))
                 , ASDIVI
                 , CATEGORY
                 , SPY_CMP_NM
                 , SEQ
                 , CASE @month
                       WHEN 1 THEN P_1
                       WHEN 2 THEN P_2
                       WHEN 3 THEN P_3
                       WHEN 4 THEN P_4
                       WHEN 5 THEN P_5
                       WHEN 6 THEN P_6
                       WHEN 7 THEN P_7
                       WHEN 8 THEN P_8
                       WHEN 9 THEN P_9
                       WHEN 10 THEN P_10
                       WHEN 11 THEN P_11
                       ELSE P_12
                END
            FROM T_MRCS_PPM_AS WHERE yyyy = `year`;

            SET @month = @month + 1;
        END WHILE;

    COMMIT;

END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_INSERT_MRCS_TOT_PPM_AS`(IN Year char(4))
    COMMENT 't_mrcs_tot_ppm_as 입력'
BEGIN

    SET @Year = `Year`;

    DROP TEMPORARY TABLE IF EXISTS T_REF;

    CREATE TEMPORARY TABLE T_REF AS
    SELECT DISTINCT YYYY
                  , CATEGORY
                  , SPY_CMP_NM
    FROM t_mrcs_ppm_as
    WHERE YYYY = @Year;

    START TRANSACTION;

    DELETE FROM t_mrcs_tot_ppm_as WHERE yyyy = @Year;

    -- 월납품수량, A/S 수량
    INSERT INTO t_mrcs_tot_ppm_as
    SELECT *
    FROM t_mrcs_ppm_as
    WHERE YYYY = @Year
      AND SEQ IN (7, 8);

    -- 총 납품수량 - 등록일 기준
    INSERT INTO t_mrcs_tot_ppm_as
    WITH CTE AS (
        SELECT CATEGORY
             , SPY_CMP_NM
             , SUM(IF(YYYYMM <= CONCAT(@Year, '01'), VALUE, 0)) P_1
             , SUM(IF(YYYYMM <= CONCAT(@Year, '02'), VALUE, 0)) P_2
             , SUM(IF(YYYYMM <= CONCAT(@Year, '03'), VALUE, 0)) P_3
             , SUM(IF(YYYYMM <= CONCAT(@Year, '04'), VALUE, 0)) P_4
             , SUM(IF(YYYYMM <= CONCAT(@Year, '05'), VALUE, 0)) P_5
             , SUM(IF(YYYYMM <= CONCAT(@Year, '06'), VALUE, 0)) P_6
             , SUM(IF(YYYYMM <= CONCAT(@Year, '07'), VALUE, 0)) P_7
             , SUM(IF(YYYYMM <= CONCAT(@Year, '08'), VALUE, 0)) P_8
             , SUM(IF(YYYYMM <= CONCAT(@Year, '09'), VALUE, 0)) P_9
             , SUM(IF(YYYYMM <= CONCAT(@Year, '10'), VALUE, 0)) P_10
             , SUM(IF(YYYYMM <= CONCAT(@Year, '11'), VALUE, 0)) P_11
             , SUM(IF(YYYYMM <= CONCAT(@Year, '12'), VALUE, 0)) P_12
        FROM t_mrcs_ppm_as_new
        WHERE YYYYMM <= CONCAT(@Year, '12') AND ASDIVI = 'ASREG' AND SEQ = 8
        GROUP BY CATEGORY, SPY_CMP_NM
    )
    SELECT ref.yyyy
         , 'ASREG'           AS asdivi
         , ref.category
         , ref.spy_cmp_nm
         , '총납품수량'        AS divi
         , '9'               AS seq
         , IFNULL(cte.P_1,0) AS P_1
         , IFNULL(cte.P_2,0) AS P_2
         , IFNULL(cte.P_3,0) AS P_3
         , IFNULL(cte.P_4,0) AS P_4
         , IFNULL(cte.P_5,0) AS P_5
         , IFNULL(cte.P_6,0) AS P_6
         , IFNULL(cte.P_7,0) AS P_7
         , IFNULL(cte.P_8,0) AS P_8
         , IFNULL(cte.P_9,0) AS P_9
         , IFNULL(cte.P_10,0) AS P_10
         , IFNULL(cte.P_11,0) AS P_11
         , IFNULL(cte.P_12,0) AS P_12
    FROM T_REF REF
             LEFT JOIN CTE ON CTE.category = ref.category AND CTE.spy_cmp_nm = ref.spy_cmp_nm;

    -- 총 납품수량 - 요청일 기준
    INSERT INTO t_mrcs_tot_ppm_as
    SELECT yyyy
         , 'ASREQ' as asdivi
         , category
         , spy_cmp_nm
         , divi
         , seq
         , P_1
         , P_2
         , P_3
         , P_4
         , P_5
         , P_6
         , P_7
         , P_8
         , P_9
         , P_10
         , P_11
         , P_12
    FROM t_mrcs_tot_ppm_as
    WHERE yyyy = @Year
      AND ASDIVI = 'ASREG'
      AND seq = 9;

    -- 지정 기간에 납품 또는 AS가 없는 항목 삭제
    WITH CTE AS (
        SELECT * , P_1 + P_2 + P_3 + P_4 + P_5 + P_6 + P_7 + P_8 + P_9 + P_10 + P_11 + P_12 AS SUM
        FROM t_mrcs_tot_ppm_as
        WHERE YYYY = @Year
    )
    DELETE FROM t_mrcs_tot_ppm_as T
    WHERE YYYY = @Year
      AND NOT EXISTS
        (SELECT DISTINCT ASDIVI, CATEGORY, SPY_CMP_NM
         FROM CTE AS filter
         WHERE ((filter.SEQ = 8 AND filter.SUM > 0) OR (filter.SEQ = 7 AND filter.SUM > 0))
           AND filter.CATEGORY = T.CATEGORY
           AND filter.SPY_CMP_NM = T.SPY_CMP_NM
           AND filter.ASDIVI = T.ASDIVI
        );

    -- A/S율 - 등록일 기준
    INSERT INTO t_mrcs_tot_ppm_as
    SELECT @Year       AS yyyy
         , 'ASREG'     AS asdivi
         , T.category
         , T.spy_cmp_nm
         , 'A/S율(PPM)'  AS divi
         , '6'           AS seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM t_mrcs_tot_ppm_as WHERE yyyy = @Year AND asdivi ='ASREG' AND seq = 9) AS T
             LEFT JOIN (SELECT * FROM t_mrcs_tot_ppm_as WHERE yyyy = @Year AND asdivi ='ASREG' AND seq = 7) AS A
                       ON T.category = A.category
                           AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    -- A/S율 - AS요청일 기준
    INSERT INTO t_mrcs_tot_ppm_as
    SELECT @Year AS yyyy
         , 'ASREQ' AS asdivi
         , T.category
         , T.SPY_CMP_NM
         , 'A/S율(PPM)' AS divi
         , '6' AS seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM t_mrcs_tot_ppm_as WHERE yyyy = @Year AND asdivi ='ASREQ' AND seq = 9) AS T
             LEFT JOIN (SELECT * FROM t_mrcs_tot_ppm_as WHERE yyyy = @Year AND asdivi ='ASREQ' AND seq = 7) AS A
                       ON T.category = A.category
                           AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    COMMIT;

    CALL SP_INSERT_MRCS_TOT_PPM_AS_NEW(@year);

END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_INSERT_MRCS_TOT_PPM_AS_NEW`(IN Year char(4))
    COMMENT 't_mrcs_tot_ppm_as_new 입력'
BEGIN

    START TRANSACTION;

    DELETE FROM T_MRCS_TOT_PPM_AS_NEW WHERE yyyymm like CONCAT(`Year`, '%');

    SET @month = 1;
    WHILE @month < 13 DO
            INSERT INTO T_MRCS_TOT_PPM_AS_NEW
            (
              YYYYMM			-- 년월
            , ASDIVI            -- AS 구분
            , CATEGORY          -- 물품분류코드
            , SPY_CMP_NM        -- 공급업체 이름
            , SEQ               -- 통계유형코드
            , VALUE             -- 통계값
            )
            SELECT CONCAT(yyyy, LPAD(@month, 2, '0'))
                 , ASDIVI
                 , CATEGORY
                 , SPY_CMP_NM
                 , SEQ
                 , CASE @month
                       WHEN 1 THEN P_1
                       WHEN 2 THEN P_2
                       WHEN 3 THEN P_3
                       WHEN 4 THEN P_4
                       WHEN 5 THEN P_5
                       WHEN 6 THEN P_6
                       WHEN 7 THEN P_7
                       WHEN 8 THEN P_8
                       WHEN 9 THEN P_9
                       WHEN 10 THEN P_10
                       WHEN 11 THEN P_11
                       ELSE P_12
                END
            FROM T_MRCS_TOT_PPM_AS WHERE yyyy = `Year`;

            SET @month = @month + 1;
        END WHILE;

    COMMIT;

END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_INSERT_NAMS_NPR`(IN Year char(4))
    COMMENT 't_nams_npr 입력'
BEGIN
    
    SET @Year = `Year`;
    SET @TargetStartDate = FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0101'), 11);
    SET @TargetEndDate = CONCAT(@Year, '1231');

    DROP TEMPORARY TABLE IF EXISTS T_REF;

    CREATE TEMPORARY TABLE T_REF AS
    SELECT @Year           AS yyyy
         , b.ATCL_CAT_CODE AS CATEGORY
         , a.LIFNR         AS wrkr_reg_no
    FROM t_dlvr_cont a
             LEFT JOIN t_cmm_item_dtl b
                       on a.ATCL_CODE = b.ATCL_CODE
    WHERE b.ATCL_CAT_CODE REGEXP '^01|^02' -- 주장비
      AND IFNULL(b.nams_yn, '') != 'N'
      AND b.USE_YN = 'Y'
      AND a.dlvdt_ymd BETWEEN @TargetStartDate AND @TargetEndDate
    GROUP BY b.ATCL_CAT_CODE, a.LIFNR;

    START TRANSACTION;

    DELETE FROM T_NAMS_NPR where yyyy = @Year;

    -- 12개월납품수량
    INSERT INTO T_NAMS_NPR
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE   AS category
             , a.LIFNR           AS wrkr_reg_no
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0101'), 11) AND CONCAT(@Year, '0131'), MENGE, 0)) P_1
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0201'), 11) AND CONCAT(@Year, '0231'), MENGE, 0)) P_2
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0301'), 11) AND CONCAT(@Year, '0331'), MENGE, 0)) P_3
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0401'), 11) AND CONCAT(@Year, '0431'), MENGE, 0)) P_4
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0501'), 11) AND CONCAT(@Year, '0531'), MENGE, 0)) P_5
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0601'), 11) AND CONCAT(@Year, '0631'), MENGE, 0)) P_6
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0701'), 11) AND CONCAT(@Year, '0731'), MENGE, 0)) P_7
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0801'), 11) AND CONCAT(@Year, '0831'), MENGE, 0)) P_8
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0901'), 11) AND CONCAT(@Year, '0931'), MENGE, 0)) P_9
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '1001'), 11) AND CONCAT(@Year, '1031'), MENGE, 0)) P_10
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '1101'), 11) AND CONCAT(@Year, '1131'), MENGE, 0)) P_11
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '1201'), 11) AND CONCAT(@Year, '1231'), MENGE, 0)) P_12
        FROM t_dlvr_cont a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.atcl_code = b.atcl_code
        where b.ATCL_CAT_CODE REGEXP '^01|^02' -- 주장비
          and IFNULL(b.nams_yn, '') != 'N'
          and b.use_yn='Y'
          and a.dlvdt_ymd BETWEEN @TargetStartDate AND @TargetEndDate
        group by b.ATCL_CAT_CODE, a.LIFNR
    )
    SELECT ref.yyyy
         , ref.category
         , CNM.DISPLAY_NM
         , '12개월납품수량' AS divi
         , '9' AS seq
         , SUM(IFNULL(cte.P_1, 0)) AS P_1
         , SUM(IFNULL(cte.P_2, 0)) AS P_2
         , SUM(IFNULL(cte.P_3, 0)) AS P_3
         , SUM(IFNULL(cte.P_4, 0)) AS P_4
         , SUM(IFNULL(cte.P_5, 0)) AS P_5
         , SUM(IFNULL(cte.P_6, 0)) AS P_6
         , SUM(IFNULL(cte.P_7, 0)) AS P_7
         , SUM(IFNULL(cte.P_8, 0)) AS P_8
         , SUM(IFNULL(cte.P_9, 0)) AS P_9
         , SUM(IFNULL(cte.P_10, 0)) AS P_10
         , SUM(IFNULL(cte.P_11, 0)) AS P_11
         , SUM(IFNULL(cte.P_12, 0)) AS P_12
    FROM T_REF ref
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- 월납품수량
    INSERT INTO T_NAMS_NPR
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE   AS category
             , a.LIFNR                      AS wrkr_reg_no
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '0131'), MENGE, 0)) P_1
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0201') AND CONCAT(@Year, '0231'), MENGE, 0)) P_2
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0301') AND CONCAT(@Year, '0331'), MENGE, 0)) P_3
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0401') AND CONCAT(@Year, '0431'), MENGE, 0)) P_4
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0501') AND CONCAT(@Year, '0531'), MENGE, 0)) P_5
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0601') AND CONCAT(@Year, '0631'), MENGE, 0)) P_6
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0701') AND CONCAT(@Year, '0731'), MENGE, 0)) P_7
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0801') AND CONCAT(@Year, '0831'), MENGE, 0)) P_8
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0901') AND CONCAT(@Year, '0931'), MENGE, 0)) P_9
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1001') AND CONCAT(@Year, '1031'), MENGE, 0)) P_10
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1101') AND CONCAT(@Year, '1131'), MENGE, 0)) P_11
             , SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1201') AND CONCAT(@Year, '1231'), MENGE, 0)) P_12
        FROM t_dlvr_cont a
                 LEFT JOIN t_cmm_item_dtl b
                           on a.ATCL_CODE = b.ATCL_CODE
        where  b.ATCL_CAT_CODE REGEXP '^01|^02' -- 주장비
          and IFNULL(b.nams_yn, '') != 'N'
          and b.use_yn='Y'
          and a.dlvdt_ymd BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '1231')
        group by b.ATCL_CAT_CODE, a.LIFNR
    )
    SELECT ref.yyyy
         , ref.category
         , CNM.DISPLAY_NM
         , '월납품수량' as divi
         , '8' as seq
         , SUM(IFNULL(cte.P_1, 0))  AS P_1
         , SUM(IFNULL(cte.P_2, 0))  AS P_2
         , SUM(IFNULL(cte.P_3, 0))  AS P_3
         , SUM(IFNULL(cte.P_4, 0))  AS P_4
         , SUM(IFNULL(cte.P_5, 0))  AS P_5
         , SUM(IFNULL(cte.P_6, 0))  AS P_6
         , SUM(IFNULL(cte.P_7, 0))  AS P_7
         , SUM(IFNULL(cte.P_8, 0))  AS P_8
         , SUM(IFNULL(cte.P_9, 0))  AS P_9
         , SUM(IFNULL(cte.P_10, 0)) AS P_10
         , SUM(IFNULL(cte.P_11, 0)) AS P_11
         , SUM(IFNULL(cte.P_12, 0)) AS P_12
    FROM T_REF ref
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- A/S수량
    INSERT INTO T_NAMS_NPR
    WITH CTE AS (
        select cid.ATCL_CAT_CODE      AS category
             , a.PRD_CMP_WRKR_NO      AS wrkr_reg_no
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'0131'), 1, 0)) C_1
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0201') AND CONCAT(@Year,'0231'), 1, 0)) C_2
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0301') AND CONCAT(@Year,'0331'), 1, 0)) C_3
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0401') AND CONCAT(@Year,'0431'), 1, 0)) C_4
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0501') AND CONCAT(@Year,'0531'), 1, 0)) C_5
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0601') AND CONCAT(@Year,'0631'), 1, 0)) C_6
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0701') AND CONCAT(@Year,'0731'), 1, 0)) C_7
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0801') AND CONCAT(@Year,'0831'), 1, 0)) C_8
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'0901') AND CONCAT(@Year,'0931'), 1, 0)) C_9
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'1001') AND CONCAT(@Year,'1031'), 1, 0)) C_10
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'1101') AND CONCAT(@Year,'1131'), 1, 0)) C_11
             , SUM(if(a.REG_YMD BETWEEN CONCAT(@Year,'1201') AND CONCAT(@Year,'1231'), 1, 0)) C_12
        FROM T_LIN_NAMS_AS_INFO a
                 JOIN t_cmm_item_dtl cid on a.ATCL_CODE = cid.ATCL_CODE
        WHERE cid.ATCL_CAT_CODE REGEXP '^01|^02' -- 주장비
          AND IFNULL(a.prd_ymd,a.REG_YMD) >= FC_YMD_MONTH_BEFORE(a.REG_YMD, 15)
          AND a.REG_YMD BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'1231')
        GROUP BY cid.ATCL_CAT_CODE, a.PRD_CMP_WRKR_NO
    )
    SELECT ref.yyyy
         , ref.category
         , CNM.DISPLAY_NM
         ,'AS수량' as divi
         ,'7' as seq
         ,SUM(IFNULL(cte.C_1,0))  AS C_1
         ,SUM(IFNULL(cte.C_2,0))  AS C_2
         ,SUM(IFNULL(cte.C_3,0))  AS C_3
         ,SUM(IFNULL(cte.C_4,0))  AS C_4
         ,SUM(IFNULL(cte.C_5,0))  AS C_5
         ,SUM(IFNULL(cte.C_6,0))  AS C_6
         ,SUM(IFNULL(cte.C_7,0))  AS C_7
         ,SUM(IFNULL(cte.C_8,0))  AS C_8
         ,SUM(IFNULL(cte.C_9,0))  AS C_9
         ,SUM(IFNULL(cte.C_10,0)) AS C_10
         ,SUM(IFNULL(cte.C_11,0)) AS C_11
         ,SUM(IFNULL(cte.C_12,0)) AS C_12
    FROM T_REF ref
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- A/S율
    INSERT INTO T_NAMS_NPR
    SELECT T.yyyy
         , t.category
         , t.SPY_CMP_NM
         , 'A/S율(PPM)' as divi
         , '6' as seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM T_NAMS_NPR WHERE yyyy = @Year AND seq = 9) AS T
             LEFT JOIN (SELECT * FROM T_NAMS_NPR WHERE yyyy = @Year AND seq = 7) AS A
                       ON T.category = A.category
                           AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    -- 지정 기간에 납품 또는 AS가 없는 항목 삭제
    WITH CTE AS (
        SELECT * , P_1 + P_2 + P_3 + P_4 + P_5 + P_6 + P_7 + P_8 + P_9 + P_10 + P_11 + P_12 AS SUM
        FROM T_NAMS_NPR
        WHERE YYYY = @Year
    )
    DELETE FROM T_NAMS_NPR T
    WHERE YYYY = @Year
      AND NOT EXISTS
        (SELECT DISTINCT CATEGORY, SPY_CMP_NM
         FROM CTE AS filter
         WHERE ((filter.SEQ = 8 AND filter.SUM > 0) OR (filter.SEQ = 7 AND filter.SUM > 0))
           AND filter.CATEGORY = T.CATEGORY
           AND filter.SPY_CMP_NM = T.SPY_CMP_NM
        );

    COMMIT;

    CALL SP_INSERT_NAMS_NPR_NEW(@year);

    -- 주장비 전체
    CALL SP_INSERT_NAMS_TOT_NPR(@year);
END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_INSERT_NAMS_NPR_06`(IN Year char(4))
    COMMENT 't_nams_npr_06 입력'
BEGIN

    SET @Year = `Year`;
    SET @TargetStartDate = FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0101'), 11);
    SET @TargetEndDate = CONCAT(@Year, '1231');

    DROP TEMPORARY TABLE IF EXISTS T_REF;

    CREATE TEMPORARY TABLE T_REF AS
    SELECT b.ATCL_CAT_CODE as category
         , a.LIFNR as wrkr_reg_no
    from t_dlvr_cont a
             LEFT JOIN t_cmm_item_dtl b
                       ON a.atcl_code = b.atcl_code
    where b.ATCL_CAT_CODE LIKE '06%' -- 전송장비
      and IFNULL(b.nams_yn,'') != 'N'
      and b.use_yn='Y'
      and a.dlvdt_ymd BETWEEN @TargetStartDate AND @TargetEndDate
    GROUP BY b.ATCL_CAT_CODE, a.LIFNR;

    START TRANSACTION;

    DELETE FROM T_NAMS_NPR_06  where yyyy = @Year;

    -- 12개월 납품 수량
    INSERT INTO T_NAMS_NPR_06
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE as category
             , a.LIFNR as wrkr_reg_no
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0101'), 11) AND CONCAT(@Year, '0131'), MENGE, 0)) P_1
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0201'), 11) AND CONCAT(@Year, '0231'), MENGE, 0)) P_2
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0301'), 11) AND CONCAT(@Year, '0331'), MENGE, 0)) P_3
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0401'), 11) AND CONCAT(@Year, '0431'), MENGE, 0)) P_4
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0501'), 11) AND CONCAT(@Year, '0531'), MENGE, 0)) P_5
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0601'), 11) AND CONCAT(@Year, '0631'), MENGE, 0)) P_6
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0701'), 11) AND CONCAT(@Year, '0731'), MENGE, 0)) P_7
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0801'), 11) AND CONCAT(@Year, '0831'), MENGE, 0)) P_8
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '0901'), 11) AND CONCAT(@Year, '0931'), MENGE, 0)) P_9
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '1001'), 11) AND CONCAT(@Year, '1031'), MENGE, 0)) P_10
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '1101'), 11) AND CONCAT(@Year, '1131'), MENGE, 0)) P_11
             , SUM(IF(a.dlvdt_ymd BETWEEN FC_YMD_MONTH_BEFORE(CONCAT(@Year, '1201'), 11) AND CONCAT(@Year, '1231'), MENGE, 0)) P_12
        FROM t_dlvr_cont a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.atcl_code = b.atcl_code
        where b.ATCL_CAT_CODE LIKE '06%' -- 전송장비
          and IFNULL(b.nams_yn,'') != 'N'
          and b.use_yn='Y'
          and a.dlvdt_ymd BETWEEN @TargetStartDate AND @TargetEndDate
        group by b.ATCL_CAT_CODE, a.LIFNR
    )
    SELECT @Year as yyyy
         , ref.category
         , CNM.DISPLAY_NM
         , '12개월납품수량' as divi
         , '9' as seq
         , SUM(IFNULL(cte.P_1, 0)) AS P_1
         , SUM(IFNULL(cte.P_2, 0)) AS P_2
         , SUM(IFNULL(cte.P_3, 0)) AS P_3
         , SUM(IFNULL(cte.P_4, 0)) AS P_4
         , SUM(IFNULL(cte.P_5, 0)) AS P_5
         , SUM(IFNULL(cte.P_6, 0)) AS P_6
         , SUM(IFNULL(cte.P_7, 0)) AS P_7
         , SUM(IFNULL(cte.P_8, 0)) AS P_8
         , SUM(IFNULL(cte.P_9, 0)) AS P_9
         , SUM(IFNULL(cte.P_10, 0)) AS P_10
         , SUM(IFNULL(cte.P_11, 0)) AS P_11
         , SUM(IFNULL(cte.P_12, 0)) AS P_12
    FROM T_REF REF
             LEFT JOIN CTE
                       ON CTE.category = ref.category
                           AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- 월 납품 수량
    INSERT INTO T_NAMS_NPR_06
    WITH CTE AS (
        SELECT b.ATCL_CAT_CODE as category
             , a.LIFNR as wrkr_reg_no
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '0131'), MENGE, 0)), 0) P_1
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0201') AND CONCAT(@Year, '0231'), MENGE, 0)), 0) P_2
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0301') AND CONCAT(@Year, '0331'), MENGE, 0)), 0) P_3
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0401') AND CONCAT(@Year, '0431'), MENGE, 0)), 0) P_4
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0501') AND CONCAT(@Year, '0531'), MENGE, 0)), 0) P_5
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0601') AND CONCAT(@Year, '0631'), MENGE, 0)), 0) P_6
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0701') AND CONCAT(@Year, '0731'), MENGE, 0)), 0) P_7
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0801') AND CONCAT(@Year, '0831'), MENGE, 0)), 0) P_8
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '0901') AND CONCAT(@Year, '0931'), MENGE, 0)), 0) P_9
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1001') AND CONCAT(@Year, '1031'), MENGE, 0)), 0) P_10
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1101') AND CONCAT(@Year, '1131'), MENGE, 0)), 0) P_11
             , IFNULL(SUM(IF(a.dlvdt_ymd BETWEEN CONCAT(@Year, '1201') AND CONCAT(@Year, '1231'), MENGE, 0)), 0) P_12
        FROM t_dlvr_cont a
                 LEFT JOIN t_cmm_item_dtl b
                           ON a.atcl_code = b.atcl_code
        where b.ATCL_CAT_CODE LIKE '06%' -- 전송장비
          and IFNULL(b.nams_yn,'') != 'N'
          and b.use_yn='Y'
          and a.dlvdt_ymd BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'1231')
        group by b.ATCL_CAT_CODE, a.LIFNR
    )
    SELECT @Year AS yyyy
         , ref.category
         , CNM.DISPLAY_NM
         ,'월납품수량' AS divi
         , '8' AS seq
         , SUM(IFNULL(cte.P_1, 0)) AS P_1
         , SUM(IFNULL(cte.P_2, 0)) AS P_2
         , SUM(IFNULL(cte.P_3, 0)) AS P_3
         , SUM(IFNULL(cte.P_4, 0)) AS P_4
         , SUM(IFNULL(cte.P_5, 0)) AS P_5
         , SUM(IFNULL(cte.P_6, 0)) AS P_6
         , SUM(IFNULL(cte.P_7, 0)) AS P_7
         , SUM(IFNULL(cte.P_8, 0)) AS P_8
         , SUM(IFNULL(cte.P_9, 0)) AS P_9
         , SUM(IFNULL(cte.P_10, 0)) AS P_10
         , SUM(IFNULL(cte.P_11, 0)) AS P_11
         , SUM(IFNULL(cte.P_12, 0)) AS P_12
    FROM T_REF REF
             LEFT OUTER JOIN CTE
                             ON CTE.category = ref.category
                                 AND CTE.wrkr_reg_no = ref.wrkr_reg_no
             JOIN t_cmp_name_map CNM -- 사업자 번호가 달라도 표시 이름이 같은 회사끼리 그룹핑
                  ON CNM.wrkr_reg_no = REF.wrkr_reg_no
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- AS수량 - 월간
    INSERT INTO T_NAMS_NPR_06
    WITH CTE AS (
        SELECT cid.ATCL_CAT_CODE as category
             , a.PRD_CMP_WRKR_NO as wrkr_reg_no
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0101') AND CONCAT(@Year, '0131'), 1, 0)) C_1
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0201') AND CONCAT(@Year, '0231'), 1, 0)) C_2
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0301') AND CONCAT(@Year, '0331'), 1, 0)) C_3
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0401') AND CONCAT(@Year, '0431'), 1, 0)) C_4
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0501') AND CONCAT(@Year, '0531'), 1, 0)) C_5
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0601') AND CONCAT(@Year, '0631'), 1, 0)) C_6
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0701') AND CONCAT(@Year, '0731'), 1, 0)) C_7
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0801') AND CONCAT(@Year, '0831'), 1, 0)) C_8
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '0901') AND CONCAT(@Year, '0931'), 1, 0)) C_9
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '1001') AND CONCAT(@Year, '1031'), 1, 0)) C_10
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '1101') AND CONCAT(@Year, '1131'), 1, 0)) C_11
             , SUM(IF(a.REG_YMD BETWEEN CONCAT(@Year, '1201') AND CONCAT(@Year, '1231'), 1, 0)) C_12
        FROM T_LIN_NAMS_AS_INFO a
                 JOIN t_cmm_item_dtl cid on a.ATCL_CODE = cid.ATCL_CODE
        where a.REG_YMD BETWEEN CONCAT(@Year,'0101') AND CONCAT(@Year,'1231')
          AND cid.ATCL_CAT_CODE LIKE '06%' -- 전송장비
          and IFNULL(a.repr_ctn1,'') <> 'NTF'
          AND IFNULL(a.prd_ymd, a.REG_YMD) >= FC_YMD_MONTH_BEFORE(a.REG_YMD, 15)
        group by cid.ATCL_CAT_CODE, a.PRD_CMP_WRKR_NO
    )
    SELECT @Year AS yyyy
         , ref.category
         , CNM.DISPLAY_NM
         , 'AS수량' as divi
         , '7' as seq
         , SUM(IFNULL(b.C_1,0)) AS C_1
         , SUM(IFNULL(b.C_2,0)) AS C_2
         , SUM(IFNULL(b.C_3,0)) AS C_3
         , SUM(IFNULL(b.C_4,0)) AS C_4
         , SUM(IFNULL(b.C_5,0)) AS C_5
         , SUM(IFNULL(b.C_6,0)) AS C_6
         , SUM(IFNULL(b.C_7,0)) AS C_7
         , SUM(IFNULL(b.C_8,0)) AS C_8
         , SUM(IFNULL(b.C_9,0)) AS C_9
         , SUM(IFNULL(b.C_10,0)) AS C_10
         , SUM(IFNULL(b.C_11,0)) AS C_11
         , SUM(IFNULL(b.C_12,0)) AS C_12
    FROM T_REF REF
             LEFT JOIN CTE b
                       ON REF.category = b.category AND ref.wrkr_reg_no = b.wrkr_reg_no
             LEFT JOIN t_cmp_name_map CNM
                       ON CNM.WRKR_REG_NO = REF.wrkr_reg_no
    WHERE CNM.WRKR_REG_NO IS NOT NULL
    GROUP BY ref.category, CNM.DISPLAY_NM;

    -- 지정 기간에 납품 또는 AS가 없는 항목 삭제
    WITH CTE AS (
        SELECT * , P_1 + P_2 + P_3 + P_4 + P_5 + P_6 + P_7 + P_8 + P_9 + P_10 + P_11 + P_12 AS SUM
        FROM T_NAMS_NPR_06
        WHERE YYYY = @Year
    )
    DELETE FROM T_NAMS_NPR_06 T
    WHERE YYYY = @Year
      AND NOT EXISTS
        (SELECT DISTINCT CATEGORY, SPY_CMP_NM
         FROM CTE AS filter
         WHERE ((filter.SEQ = 8 AND filter.SUM > 0) OR (filter.SEQ = 7 AND filter.SUM > 0))
           AND filter.CATEGORY = T.CATEGORY
           AND filter.SPY_CMP_NM = T.SPY_CMP_NM
        );

    -- A/S율(PPM)
    INSERT INTO T_NAMS_NPR_06
    SELECT @Year AS yyyy
         , T.category
         , T.SPY_CMP_NM
         , 'A/S율(PPM)' as divi
         , '6' as seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM T_NAMS_NPR_06 WHERE yyyy = @Year AND seq = 9) AS T
             LEFT JOIN (SELECT * FROM T_NAMS_NPR_06 WHERE yyyy = @Year AND seq = 7) AS A
                       ON T.category = A.category AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    COMMIT;

    CALL SP_INSERT_NAMS_NPR_06_NEW(@year);
    
END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_INSERT_NAMS_NPR_06_NEW`(IN Year char(4))
    COMMENT 't_nams_npr_06_new 입력'
BEGIN
    
	START TRANSACTION;   
	
	DELETE FROM T_NAMS_NPR_06_NEW WHERE yyyymm like CONCAT(`Year`, '%');
    	
	SET @month = 1;  
	WHILE @month < 13 DO	
        INSERT INTO T_NAMS_NPR_06_NEW
        (
              YYYYMM			-- 년월
            , CATEGORY          -- 물품분류 코드
            , SPY_CMP_NM        -- 공급업체 이름
            , SEQ               -- 통계유형코드
            , VALUE		        -- 통계값
        )
        SELECT CONCAT(yyyy, LPAD(@month, 2, '0')) 
            , CATEGORY
            , SPY_CMP_NM
            , SEQ
            , CASE @month
                WHEN 1 THEN P_1
                WHEN 2 THEN P_2
                WHEN 3 THEN P_3
                WHEN 4 THEN P_4
                WHEN 5 THEN P_5
                WHEN 6 THEN P_6
                WHEN 7 THEN P_7
                WHEN 8 THEN P_8
                WHEN 9 THEN P_9
                WHEN 10 THEN P_10
                WHEN 11 THEN P_11
                ELSE P_12
              END
        FROM T_NAMS_NPR_06 WHERE yyyy = `Year`;
		
        SET @month = @month + 1;
    END WHILE;

    COMMIT;
	
END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_INSERT_NAMS_NPR_NEW`(IN Year char(4))
    COMMENT 't_nams_npr_new 입력'
BEGIN

	START TRANSACTION;   
	
	DELETE FROM T_NAMS_NPR_NEW WHERE yyyymm like CONCAT(`Year`, '%');
	
	SET @month = 1;  
	WHILE @month < 13 DO	
        INSERT INTO T_NAMS_NPR_NEW
        (
              YYYYMM		-- 년월
            , CATEGORY		-- 분류
            , SPY_CMP_NM	-- 공급업체명
            , SEQ           -- 통계유형코드
            , VALUE		    -- 통계값
        )
        SELECT CONCAT(yyyy, LPAD(@month, 2, '0'))   
            , CATEGORY
            , SPY_CMP_NM
            , seq
            , CASE @month
                WHEN 1 THEN P_1
                WHEN 2 THEN P_2
                WHEN 3 THEN P_3
                WHEN 4 THEN P_4
                WHEN 5 THEN P_5
                WHEN 6 THEN P_6
                WHEN 7 THEN P_7
                WHEN 8 THEN P_8
                WHEN 9 THEN P_9
                WHEN 10 THEN P_10
                WHEN 11 THEN P_11
                ELSE P_12 
              END
        FROM T_NAMS_NPR WHERE yyyy = `Year`;

        SET @month = @month + 1;
    END WHILE;

    COMMIT;
		
END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_INSERT_NAMS_TOT_NPR`(IN Year char(4))
    COMMENT 't_nams_tot_npr 입력'
BEGIN
    
    SET @Year = `Year`;

    DROP TEMPORARY TABLE IF EXISTS T_REF;

    CREATE TEMPORARY TABLE T_REF AS
    SELECT YYYY
         , A.CATEGORY
         , A.SPY_CMP_NM
    FROM t_nams_npr A
    WHERE SEQ = 9 AND YYYY = @Year;

    START TRANSACTION;

    DELETE FROM t_nams_tot_npr  WHERE yyyy = @Year;

    -- 총납품수량
    INSERT INTO t_nams_tot_npr
    WITH CTE AS (
        SELECT A.CATEGORY
             , A.SPY_CMP_NM
             , SUM(IF(YYYYMM <= CONCAT(@Year, '01'), VALUE, 0)) P_1
             , SUM(IF(YYYYMM <= CONCAT(@Year, '02'), VALUE, 0)) P_2
             , SUM(IF(YYYYMM <= CONCAT(@Year, '03'), VALUE, 0)) P_3
             , SUM(IF(YYYYMM <= CONCAT(@Year, '04'), VALUE, 0)) P_4
             , SUM(IF(YYYYMM <= CONCAT(@Year, '05'), VALUE, 0)) P_5
             , SUM(IF(YYYYMM <= CONCAT(@Year, '06'), VALUE, 0)) P_6
             , SUM(IF(YYYYMM <= CONCAT(@Year, '07'), VALUE, 0)) P_7
             , SUM(IF(YYYYMM <= CONCAT(@Year, '08'), VALUE, 0)) P_8
             , SUM(IF(YYYYMM <= CONCAT(@Year, '09'), VALUE, 0)) P_9
             , SUM(IF(YYYYMM <= CONCAT(@Year, '10'), VALUE, 0)) P_10
             , SUM(IF(YYYYMM <= CONCAT(@Year, '11'), VALUE, 0)) P_11
             , SUM(IF(YYYYMM <= CONCAT(@Year, '12'), VALUE, 0)) P_12
        FROM t_nams_npr_new A
        WHERE YYYYMM <= CONCAT(@Year, '12') AND SEQ = 8
        GROUP BY CATEGORY, SPY_CMP_NM
    )
    SELECT ref.yyyy
         , ref.category
         , ref.spy_cmp_nm
         , '총납품수량' AS divi
         , '9' AS seq
         , IFNULL(cte.P_1,0) AS P_1
         , IFNULL(cte.P_2,0) AS P_2
         , IFNULL(cte.P_3,0) AS P_3
         , IFNULL(cte.P_4,0) AS P_4
         , IFNULL(cte.P_5,0) AS P_5
         , IFNULL(cte.P_6,0) AS P_6
         , IFNULL(cte.P_7,0) AS P_7
         , IFNULL(cte.P_8,0) AS P_8
         , IFNULL(cte.P_9,0) AS P_9
         , IFNULL(cte.P_10,0) AS P_10
         , IFNULL(cte.P_11,0) AS P_11
         , IFNULL(cte.P_12,0) AS P_12
    FROM T_REF ref
             LEFT JOIN CTE ON CTE.category = ref.category AND CTE.SPY_CMP_NM = ref.SPY_CMP_NM;

    -- 월납품수량, A/S 수량
    INSERT INTO t_nams_tot_npr
    SELECT *
    FROM t_nams_npr
    WHERE YYYY = @Year
      AND SEQ IN (7, 8); -- 월납품수량, A/S 수량

    -- 지정 기간에 납품 또는 AS가 없는 항목 삭제
    WITH CTE AS (
        SELECT * , P_1 + P_2 + P_3 + P_4 + P_5 + P_6 + P_7 + P_8 + P_9 + P_10 + P_11 + P_12 AS SUM
        FROM T_NAMS_TOT_NPR
        WHERE YYYY = @Year
    )
    DELETE FROM T_NAMS_TOT_NPR T
    WHERE YYYY = @Year
      AND NOT EXISTS
        (SELECT DISTINCT CATEGORY, SPY_CMP_NM
         FROM CTE AS filter
         WHERE ((filter.SEQ = 8 AND filter.SUM > 0) OR (filter.SEQ = 7 AND filter.SUM > 0))
           AND filter.CATEGORY = T.CATEGORY
           AND filter.SPY_CMP_NM = T.SPY_CMP_NM
        );

    -- A/S율
    INSERT INTO t_nams_tot_npr
    SELECT T.yyyy
         , T.category
         , T.spy_cmp_nm
         ,'A/S율(PPM)' as divi
         ,'6' as seq
         , IF(T.P_1 = 0, 0, CONVERT((A.p_1 / T.P_1) * 1000000, decimal)) MON_1
         , IF(T.P_2 = 0, 0, CONVERT((A.p_2 / T.P_2) * 1000000, decimal)) MON_2
         , IF(T.P_3 = 0, 0, CONVERT((A.p_3 / T.P_3) * 1000000, decimal)) MON_3
         , IF(T.P_4 = 0, 0, CONVERT((A.p_4 / T.P_4) * 1000000, decimal)) MON_4
         , IF(T.P_5 = 0, 0, CONVERT((A.p_5 / T.P_5) * 1000000, decimal)) MON_5
         , IF(T.P_6 = 0, 0, CONVERT((A.p_6 / T.P_6) * 1000000, decimal)) MON_6
         , IF(T.P_7 = 0, 0, CONVERT((A.p_7 / T.P_7) * 1000000, decimal)) MON_7
         , IF(T.P_8 = 0, 0, CONVERT((A.p_8 / T.P_8) * 1000000, decimal)) MON_8
         , IF(T.P_9 = 0, 0, CONVERT((A.p_9 / T.P_9) * 1000000, decimal)) MON_9
         , IF(T.P_10 = 0, 0, CONVERT((A.p_10 / T.P_10) * 1000000, decimal)) MON_10
         , IF(T.P_11 = 0, 0, CONVERT((A.p_11 / T.P_11) * 1000000, decimal)) MON_11
         , IF(T.P_12 = 0, 0, CONVERT((A.p_12 / T.P_12) * 1000000, decimal)) MON_12
    FROM (SELECT * FROM T_NAMS_TOT_NPR WHERE yyyy = @Year AND seq = 9) AS T -- 총 납품수량
             LEFT JOIN (SELECT * FROM T_NAMS_TOT_NPR WHERE yyyy = @Year AND seq = 7) AS A  -- AS 수량
                       ON T.category = A.category
                           AND T.SPY_CMP_NM = A.SPY_CMP_NM;

    COMMIT;

    CALL SP_INSERT_NAMS_TOT_NPR_NEW(@year);

END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_INSERT_NAMS_TOT_NPR_NEW`(IN Year char(4))
    COMMENT 't_nams_tot_npr_new 입력'
BEGIN
		
	START TRANSACTION;   
	
	DELETE FROM T_NAMS_TOT_NPR_NEW WHERE yyyymm like CONCAT(`Year`, '%');
	
	SET @month = 1;  
	WHILE @month < 13 DO		
        INSERT INTO T_NAMS_TOT_NPR_NEW
        (
              YYYYMM			-- 년월
            , CATEGORY		    -- 물품분류코드
            , SPY_CMP_NM		-- 공급업체명            
            , SEQ               -- 통계유형코드
            , VALUE		        -- 통계값
        )
        SELECT CONCAT(yyyy, LPAD(@month, 2, '0'))           
            , CATEGORY
            , SPY_CMP_NM
            , seq
            , CASE @month 
                WHEN 1 THEN P_1
                WHEN 2 THEN P_2
                WHEN 3 THEN P_3
                WHEN 4 THEN P_4
                WHEN 5 THEN P_5
                WHEN 6 THEN P_6
                WHEN 7 THEN P_7
                WHEN 8 THEN P_8
                WHEN 9 THEN P_9
                WHEN 10 THEN P_10
                WHEN 11 THEN P_11
                ELSE P_12 
             END              
        FROM T_NAMS_TOT_NPR WHERE yyyy = `Year`;

        SET @month = @month + 1;
    END WHILE;

    COMMIT;
		
END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_INSERT_SYSTEM_JOB_LOG`(IN JOB_NAME varchar(30), IN CONFIGURATION varchar(512),
                                                              IN RESULT varchar(30), IN MESSAGE varchar(2048),
                                                              IN ARGUMENTS varchar(256), IN START_DATETIME datetime)
    COMMENT '작업 이력 추가'
BEGIN
    INSERT INTO t_log_system_job
    VALUES (
             NULL
           , JOB_NAME
           , @@hostname
           , CONFIGURATION
           , RESULT
           , MESSAGE
           , ARGUMENTS
           , START_DATETIME
           , NOW()
           , TIMESTAMPDIFF(SECOND,START_DATETIME,NOW())
           );
END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_SET_JOB_STATE`(IN p_job_name varchar(30), IN p_host_name varchar(30),
                                                      IN p_state varchar(10), IN p_message varchar(512))
    COMMENT '작업 실행 상태'
BEGIN
    IF p_state = 'PAUSE' THEN
        UPDATE t_job_state
            SET STATE = p_state,
                HOSTNAME = null,
                MESSAGE = p_message,
                START_DATETIME = null,
                LAST_RUN_DATETIME = NOW()
        WHERE JOB_NAME = `p_job_name`;
    ELSE
        INSERT INTO t_job_state (JOB_NAME, HOSTNAME, STATE, MESSAGE, START_DATETIME)
            VALUE (p_job_name, p_host_name, p_state, p_message, NOW())
        ON DUPLICATE KEY UPDATE HOSTNAME = p_host_name,
                                STATE   = p_state,
                                MESSAGE = p_message,
                                START_DATETIME = NOW();

    END IF;

    -- 1시간이 넘게 걸리는 작업은 없는 가정하에, 혹시 1시간 이상 된 작업이 남아있다면 쓰레기 데이터로 보고 완료로 변경한다.
    UPDATE t_job_state
    SET STATE = 'PAUSE',
        HOSTNAME = null,
        MESSAGE = null,
        START_DATETIME = null,
        LAST_RUN_DATETIME = NOW()
    WHERE STATE = 'RUN' 
      AND TIMESTAMPDIFF(hour,  START_DATETIME,NOW()) > 1;        

END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_SET_ROLE_MENU`(IN MenuId VARCHAR(50), IN RoleId VARCHAR(50))
    COMMENT '메뉴 role 권한 부여'
BEGIN
	START TRANSACTION;

	DELETE from sk_role_mapping_tbl 
    WHERE SK_ROLE_ID = RoleId
    and SK_TYPE = 'M';
   
   INSERT INTO sk_role_mapping_tbl	(SK_ROLE_ID, SK_REF_1, SK_REF_2, SK_TYPE, SK_CREATE_USER, SK_CREATE_TIME)
	SELECT RoleId, sk_id, 'N/A', 'M', null, null
	FROM (
		WITH RECURSIVE child_nodes AS (
		    SELECT SK_ID
		    FROM sk_menu_tbl smt
		    WHERE SK_ID = MenuId
		    UNION ALL
		    SELECT t.SK_ID
		    FROM sk_menu_tbl t
		        INNER JOIN child_nodes cn 
		        ON cn.SK_ID = t.SK_PARENT_ID
		)
		SELECT SK_ID FROM child_nodes
	
	)
		

    COMMIT;
END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_SYNC_SKTUSERS`()
begin

    # 관리자 자동 등록
    insert ignore into sk_user_tbl (SK_ID,USR_GBN,CUR_USR_ID,INDEPT,SK_NAME,TELNO ,MOBILENO,EMAIL,RECEIVE_TYPE,CMP_CODE,CMP_BIZ_GBN,STATUS,DEL_YN,SK_JBGRP,SK_JBRANK,SK_JBCHARGE,SK_HOLDOFFIDIVI,SK_PLACE,SK_CREATE_NAME,SK_CREATE_USER,SK_UPDATE_NAME,SK_UPDATE_USER,SK_CREATE_TIME,SK_UPDATE_TIME)
    select TargetId,'C55001',TargetId,'',TargetName,'02-6400-0000','010-0000-0000',TargetEmail,'M','CP000000','','C62003','N','','','','','','','','',TargetId,DATE_FORMAT(NOW(), '%Y%m%d%H%i%S'),DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
    from self_person_sync_mgmt
    where UsedYN='Y' AND TargetType in ('A');

    insert ignore into sk_role_mapping_tbl (SK_ROLE_ID, SK_REF_1, SK_REF_2, SK_TYPE, SK_CREATE_USER, SK_CREATE_TIME)
    select 'SKT0000001', TargetId, 'N/A', 'U', 'System', DATE_FORMAT(NOW(), '%Y%m%d')
    from self_person_sync_mgmt
    where UsedYN='Y' AND TargetType in ('A');

    # SKT 커스텀 사용자 자동 등록
    insert ignore into sk_user_tbl (SK_ID,USR_GBN,CUR_USR_ID,INDEPT,SK_NAME,TELNO ,MOBILENO,EMAIL,RECEIVE_TYPE,CMP_CODE,CMP_BIZ_GBN,STATUS,DEL_YN,SK_JBGRP,SK_JBRANK,SK_JBCHARGE,SK_HOLDOFFIDIVI,SK_PLACE,SK_CREATE_NAME,SK_CREATE_USER,SK_UPDATE_NAME,SK_UPDATE_USER,SK_CREATE_TIME,SK_UPDATE_TIME)
    select TargetId,'C55001',TargetId,'',TargetName,'02-6400-0000','010-0000-0000',TargetEmail,'M','CP000000','','C62003','N','','','','','','','','',TargetId,DATE_FORMAT(NOW(), '%Y%m%d%H%i%S'),DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
    from self_person_sync_mgmt
    where UsedYN='Y' AND TargetType in ('U');

    insert ignore into sk_role_mapping_tbl (SK_ROLE_ID, SK_REF_1, SK_REF_2, SK_TYPE, SK_CREATE_USER, SK_CREATE_TIME)
    select 'R000000001', TargetId, 'N/A', 'U', 'System', DATE_FORMAT(NOW(), '%Y%m%d')
    from self_person_sync_mgmt
    where UsedYN='Y' AND TargetType in ('U');

    # SKT 특정 사용자 자동 등록
    insert ignore into sk_user_tbl (SK_ID,USR_GBN,CUR_USR_ID,INDEPT,SK_NAME,TELNO ,MOBILENO,EMAIL,RECEIVE_TYPE,CMP_CODE,CMP_BIZ_GBN,STATUS,DEL_YN,SK_JBGRP,SK_JBRANK,SK_JBCHARGE,SK_HOLDOFFIDIVI,SK_PLACE,SK_CREATE_NAME,SK_CREATE_USER,SK_UPDATE_NAME,SK_UPDATE_USER,SK_CREATE_TIME,SK_UPDATE_TIME)
    select b.EMPNO ,'C55001',b.EMPNO ,b.INDEPT,b.HNAME,b.TELNO,b.MOVETELNO,b.EMAIL,'M','CP000000','','C62003','N',b.JBGRP,b.JBRANK,b.JBCHARGE,b.HOLDOFFIDIVI,b.PLACE,'','','',b.EMPNO,DATE_FORMAT(NOW(), '%Y%m%d%H%i%S'),DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
    from self_person_sync_mgmt a
             inner join inf_person_info_rcv b on b.EMPNO = a.TargetId
    where a.UsedYN='Y' AND a.TargetType in ('P');

    insert ignore into sk_role_mapping_tbl (SK_ROLE_ID, SK_REF_1, SK_REF_2, SK_TYPE, SK_CREATE_USER, SK_CREATE_TIME)
    select 'R000000001', b.EMPNO, 'N/A', 'U', 'System', DATE_FORMAT(NOW(), '%Y%m%d')
    from self_person_sync_mgmt a
             inner join inf_person_info_rcv b on b.EMPNO = a.TargetId
    where a.UsedYN='Y' AND a.TargetType in ('P');

    # SKT 특정 부서 자동 등록
    insert ignore into sk_user_tbl (SK_ID,USR_GBN,CUR_USR_ID,INDEPT,SK_NAME,TELNO ,MOBILENO,EMAIL,RECEIVE_TYPE,CMP_CODE,CMP_BIZ_GBN,STATUS,DEL_YN,SK_JBGRP,SK_JBRANK,SK_JBCHARGE,SK_HOLDOFFIDIVI,SK_PLACE,SK_CREATE_NAME,SK_CREATE_USER,SK_UPDATE_NAME,SK_UPDATE_USER,SK_CREATE_TIME,SK_UPDATE_TIME)
    select b.EMPNO ,'C55001',b.EMPNO ,b.INDEPT,b.HNAME,b.TELNO,b.MOVETELNO,b.EMAIL,'M','CP000000','','C62003','N',b.JBGRP,b.JBRANK,b.JBCHARGE,b.HOLDOFFIDIVI,b.PLACE,'','','',b.EMPNO,DATE_FORMAT(NOW(), '%Y%m%d%H%i%S'),DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')
    from self_person_sync_mgmt a
             inner join inf_person_info_rcv b on b.INDEPT=a.TargetId
    where a.UsedYN='Y' AND a.TargetType in ('D');

    insert ignore into sk_role_mapping_tbl (SK_ROLE_ID, SK_REF_1, SK_REF_2, SK_TYPE, SK_CREATE_USER, SK_CREATE_TIME)
    select 'R000000001', b.EMPNO, 'N/A', 'U', 'System', DATE_FORMAT(NOW(), '%Y%m%d')
    from self_person_sync_mgmt a
             inner join inf_person_info_rcv b on b.INDEPT=a.TargetId
    where a.UsedYN='Y' AND a.TargetType in ('D');

		
END;

CREATE DEFINER=`qasd_svc`@`%` PROCEDURE `qas_dev`.`SP_UPDATE_ERP_QLT_CERT`(IN P_CTR_NO varchar(40), IN P_DLVDT_YMD varchar(40),
                                                            IN P_PLANT_CODE varchar(40), IN TYPE char,
                                                            IN MESSAGE varchar(50))
    COMMENT '품질인증번호 업데이트'
BEGIN

    IF TYPE = 'E' THEN
        UPDATE t_dlvr_exam_req
        SET QLT_CERT_MSG = MESSAGE,
            LAST_MOD_YMD = DATE_FORMAT(NOW(), '%Y%m%d')
        WHERE NEWEST_YN = 'Y'
          AND CTR_NO = P_CTR_NO
          AND DLVDT_YMD = P_DLVDT_YMD
          AND PLANT_CODE = P_PLANT_CODE;

        UPDATE t_auto_dlvr_cont
        SET QLT_CERT_MSG = MESSAGE
        WHERE CTR_NO = P_CTR_NO
          AND DLVDT_YMD = P_DLVDT_YMD
          AND PLANT_CODE = P_PLANT_CODE;

        UPDATE t_dlvr_erp_req
        SET QLT_CERT_MSG  = MESSAGE
          , APR_STATE_GBN = 'C25010'
          , ERP_SEND_YN   = 'N'
          , LAST_MOD_YMD = DATE_FORMAT(NOW(), '%Y%m%d')
        WHERE CTR_NO = P_CTR_NO
          AND DLVDT_YMD = P_DLVDT_YMD
          AND PLANT_CODE = P_PLANT_CODE;
    ELSEIF TYPE = 'S' THEN
        UPDATE t_dlvr_exam_req
        SET QLT_CERT_CODE = MESSAGE,
            LAST_MOD_YMD = DATE_FORMAT(NOW(), '%Y%m%d'),
            QLT_CERT_MSG = NULL
        WHERE NEWEST_YN = 'Y'
          AND IFNULL(QLT_CERT_CODE, '') = ''
          AND CTR_NO = P_CTR_NO
          AND DLVDT_YMD = P_DLVDT_YMD
          AND PLANT_CODE = P_PLANT_CODE;

        UPDATE t_auto_dlvr_cont
        SET QLT_CERT_CODE = MESSAGE,
            QLT_CERT_MSG = NULL
        WHERE IFNULL(QLT_CERT_CODE, '') = ''
          AND CTR_NO = P_CTR_NO
          AND DLVDT_YMD = P_DLVDT_YMD
          AND PLANT_CODE = P_PLANT_CODE;

        UPDATE t_dlvr_erp_req
        SET QLT_CERT_CODE = MESSAGE
          , QLT_CERT_MSG = NULL
          , APR_STATE_GBN = 'C25020'
          , ERP_SEND_YN   = 'Y'
          , LAST_MOD_YMD = DATE_FORMAT(NOW(), '%Y%m%d')
        WHERE CTR_NO = P_CTR_NO
          AND DLVDT_YMD = P_DLVDT_YMD
          AND PLANT_CODE = P_PLANT_CODE;
    END IF;
end;
