CREATE TABLE SQL.TB_PORTAL_ACCESS (
	ACCESS_NO VARCHAR(14) NOT NULL, -- will be managed by a sequence
    WEB_CODE VARCHAR(3) NOT NULL,
    METHOD_CODE VARCHAR(2) NOT NULL,
    MODEL_CODE VARCHAR(5), -- will be managed by a sequence
    MANU_CODE VARCHAR(5),
    OS_CODE VARCHAR(5) NOT NULL,
    IP_ADDR VARCHAR(30) NOT NULL,
    ACCESS_TIME VARCHAR(100) NOT NULL
)
TABLESPACE SQL_DATA;
ALTER TABLE SQL.TB_PORTAL_ACCESS ADD CONSTRAINT PK_TB_PORTAL_ACCESS PRIMARY KEY (ACCESS_NO);

CREATE TABLE SQL.TB_ACCESS_METHOD ( -- FIXED
    METHOD_CODE VARCHAR(2) NOT NULL, -- initially created
    METHOD VARCHAR(10) NOT NULL -- initially created
)
TABLESPACE SQL_DATA;
ALTER TABLE SQL.TB_ACCESS_METHOD ADD CONSTRAINT PK_TB_ACCESS_METHOD PRIMARY KEY (METHOD_CODE);

ALTER TABLE SQL.TB_PORTAL_ACCESS ADD CONSTRAINT TK_TB_PORTAL_ACCESS_01 FOREIGN KEY (METHOD_CODE) REFERENCES SQL.TB_ACCESS_METHOD (METHOD_CODE);

CREATE TABLE SQL.TB_WEBSITE ( -- FIXED
    WEB_CODE VARCHAR (3) NOT NULL,
    WEB_URL VARCHAR(2083) NOT NULL
)
TABLESPACE SQL_DATA;
ALTER TABLE SQL.TB_WEBSITE ADD CONSTRAINT PK_TB_WEBSITE PRIMARY KEY (WEB_CODE);

ALTER TABLE SQL.TB_PORTAL_ACCESS ADD CONSTRAINT TK_TB_PORTAL_ACCESS_02 FOREIGN KEY (WEB_CODE) REFERENCES SQL.TB_WEBSITE (WEB_CODE);

CREATE TABLE SQL.TB_OS (
    OS_CODE VARCHAR(5) NOT NULL, -- will be managed by a sequence
    OS_NAME VARCHAR(100) NOT NULL
)
TABLESPACE SQL_DATA;
ALTER TABLE SQL.TB_OS ADD CONSTRAINT PK_TB_OS PRIMARY KEY (OS_CODE);

ALTER TABLE SQL.TB_PORTAL_ACCESS ADD CONSTRAINT TK_TB_PORTAL_ACCESS_03 FOREIGN KEY (OS_CODE) REFERENCES SQL.TB_OS (OS_CODE);

CREATE TABLE SQL.TB_MODEL (
    MODEL_CODE VARCHAR(5) NOT NULL, -- will be managed by a sequence
    MANU_CODE VARCHAR(5) NOT NULL,
    MODEL_NAME VARCHAR(100) NOT NULL
)
TABLESPACE SQL_DATA;
ALTER TABLE SQL.TB_MODEL ADD CONSTRAINT PK_TB_MODEL PRIMARY KEY (MODEL_CODE);

ALTER TABLE SQL.TB_PORTAL_ACCESS ADD CONSTRAINT TK_TB_PORTAL_ACCESS_04 FOREIGN KEY (MODEL_CODE) REFERENCES SQL.TB_MODEL (MODEL_CODE);

CREATE TABLE SQL.TB_MANU (
    MANU_CODE VARCHAR(5) NOT NULL, -- will be managed by a sequence
    MANU_NAME VARCHAR(100) NOT NULL
)
TABLESPACE SQL_DATA;
ALTER TABLE SQL.TB_MANU ADD CONSTRAINT PK_TB_MANU PRIMARY KEY (MANU_CODE);

ALTER TABLE SQL.TB_PORTAL_ACCESS ADD CONSTRAINT TK_TB_PORTAL_ACCESS_05 FOREIGN KEY (MANU_CODE) REFERENCES SQL.TB_MANU (MANU_CODE);
ALTER TABLE SQL.TB_MODEL ADD CONSTRAINT PK_TB_MODEL_01 FOREIGN KEY (MANU_CODE) REFERENCES SQL.TB_MANU (MANU_CODE);

INSERT INTO SQL.TB_ACCESS_METHOD VALUES ('00','PC');
INSERT INTO SQL.TB_ACCESS_METHOD VALUES('01','Mobile');
INSERT INTO SQL.TB_OS VALUES('00000','Windows');
INSERT INTO SQL.TB_OS VALUES('00001','MacOS');
INSERT INTO SQL.TB_OS VALUES('00002','Linux');
INSERT INTO SQL.TB_OS VALUES('00003','Android');
INSERT INTO SQL.TB_OS VALUES('00004','WinPhone');
INSERT INTO SQL.TB_OS VALUES('00005','IOS');
INSERT INTO SQL.TB_OS VALUES('00006','Unknown OS');
INSERT INTO SQL.TB_WEBSITE VALUES('000','http://naver.com');
INSERT INTO SQL.TB_WEBSITE VALUES('001','https://www.daum.net');
INSERT INTO SQL.TB_WEBSITE VALUES('002','https://www.nate.com');

COMMIT;