CREATE OR REPLACE FUNCTION KTR_ERP."SF_GET_ZIPCODE_AREA_NAME" (
    iZIPCODE        NVARCHAR2,
    iSIDO_SGG_DIV   NVARCHAR2
)

RETURN VARCHAR2 IS
vRET_AREA_NAME    NVARCHAR2(30);
vNEW_YN           NVARCHAR2(1);
vZIPCODE          NVARCHAR2(10);

/******************************************************************************
    NAME    :  SF_GET_ZIPCODE_AREA_NAME
    PURPOSE :  우편번호를 통해 지역명 RETURN
	* 6자리 우편번호를 입력받았다면, 6자리 체계로 시도/시군구를 해석한다.
	* 5자리 우편번호를 입력받았다면, 5자리 체계로 시도/시군구를 해석한다.
	* NULL을 반환한다
    * NULL을 입력받으면 NULL을 보여준다.
******************************************************************************/
BEGIN
	vRET_AREA_NAME := '';
    vZIPCODE := TRIM(REPLACE(iZIPCODE, '-', ''));

	  IF LENGTH(vZIPCODE) = 5 THEN
		vNEW_YN := '1';
	  ELSIF LENGTH(vZIPCODE) = 6 THEN
		vNEW_YN := '0';
	  ELSE
		vNEW_YN := '9';
	  END IF; 
	  
	  IF iSIDO_SGG_DIV = 'SIDO' THEN
		SELECT SIDO_NAME
	    INTO vRET_AREA_NAME
	    FROM TM_ZIPCODE_AREA
	    WHERE NEW_YN = vNEW_YN
	    AND ZIP_PRE = SUBSTR(vZIPCODE, 1, 2)
	    AND ZIP_MIDDLE = SUBSTR(vZIPCODE, 3, 1);
	  ELSIF iSIDO_SGG_DIV = 'SGG' THEN
		SELECT SGG_NAME
	    INTO vRET_AREA_NAME
	    FROM TM_ZIPCODE_AREA
	    WHERE NEW_YN = vNEW_YN
	    AND ZIP_PRE = SUBSTR(vZIPCODE, 1, 2)
	    AND ZIP_MIDDLE = SUBSTR(vZIPCODE, 3, 1);
	  ELSE
	    vRET_AREA_NAME := '';
	  END IF;
	 
	 RETURN vRET_AREA_NAME;
	
  EXCEPTION
	  WHEN NO_DATA_FOUND THEN
	    vRET_AREA_NAME :=  vRET_AREA_NAME;
	  WHEN OTHERS THEN
	    vRET_AREA_NAME :=  vRET_AREA_NAME;
	   
	   RETURN vRET_AREA_NAME;

END SF_GET_ZIPCODE_AREA_NAME;