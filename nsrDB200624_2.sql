--------------------------------------------------------
--  파일이 생성됨 - 수요일-6월-24-2020   
--------------------------------------------------------
DROP SEQUENCE "NSR"."BOARD_SEQ";
DROP SEQUENCE "NSR"."GPXREPLY_SEQ";
DROP SEQUENCE "NSR"."GPX_SEQ";
DROP SEQUENCE "NSR"."GRC_SEQ";
DROP SEQUENCE "NSR"."GUR_SEQ";
DROP SEQUENCE "NSR"."G_RECOMMANDLIST_SEQ";
DROP SEQUENCE "NSR"."NOTICE_SEQ";
DROP SEQUENCE "NSR"."QNA_SEQ";
DROP SEQUENCE "NSR"."R_SEQ";
DROP SEQUENCE "NSR"."USER_SEQ";
DROP TABLE "NSR"."BOARD";
DROP TABLE "NSR"."GPX";
DROP TABLE "NSR"."GPXREPLY";
DROP TABLE "NSR"."GPX_RANKING_COURSE";
DROP TABLE "NSR"."GPX_USER_RANKING";
DROP TABLE "NSR"."G_RECOMMANDLIST";
DROP TABLE "NSR"."NOTICE";
DROP TABLE "NSR"."NSCOURSE";
DROP TABLE "NSR"."QnA";
DROP TABLE "NSR"."REPLY";
DROP TABLE "NSR"."USER_INFO";
--------------------------------------------------------
--  DDL for Sequence BOARD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NSR"."BOARD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence GPXREPLY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NSR"."GPXREPLY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence GPX_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NSR"."GPX_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence GRC_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NSR"."GRC_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence GUR_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NSR"."GUR_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence G_RECOMMANDLIST_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NSR"."G_RECOMMANDLIST_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence NOTICE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NSR"."NOTICE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QNA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NSR"."QNA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence R_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NSR"."R_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NSR"."USER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "NSR"."BOARD" 
   (	"B_SEQ" NUMBER, 
	"U_SEQ" NUMBER, 
	"B_TITLE" VARCHAR2(200 BYTE), 
	"B_CONTENT" VARCHAR2(4000 BYTE), 
	"B_REPLY" NUMBER DEFAULT 0, 
	"B_DATE" DATE DEFAULT sysdate, 
	"B_COUNT" NUMBER DEFAULT 0, 
	"U_NICKNAME" VARCHAR2(20 BYTE), 
	"B_STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table GPX
--------------------------------------------------------

  CREATE TABLE "NSR"."GPX" 
   (	"G_SEQ" NUMBER, 
	"U_SEQ" NUMBER, 
	"G_CONTENT" VARCHAR2(2000 BYTE), 
	"G_DATE" DATE DEFAULT SYSDATE, 
	"G_TITLE" VARCHAR2(300 BYTE), 
	"G_ORI" VARCHAR2(300 BYTE), 
	"G_RE" VARCHAR2(300 BYTE), 
	"U_NICKNAME" VARCHAR2(20 BYTE), 
	"G_COUNT" NUMBER DEFAULT 0, 
	"G_RECOMMAND" NUMBER DEFAULT 0, 
	"G_REPLY" NUMBER DEFAULT 0, 
	"G_STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table GPXREPLY
--------------------------------------------------------

  CREATE TABLE "NSR"."GPXREPLY" 
   (	"GR_SEQ" NUMBER, 
	"U_NICKNAME" VARCHAR2(20 BYTE), 
	"GR_CONTENT" VARCHAR2(4000 BYTE), 
	"GR_DATE" DATE DEFAULT SYSDATE, 
	"G_SEQ" NUMBER, 
	"U_SEQ" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table GPX_RANKING_COURSE
--------------------------------------------------------

  CREATE TABLE "NSR"."GPX_RANKING_COURSE" 
   (	"GRC_SEQ" NUMBER, 
	"GRC_TITLE" VARCHAR2(300 BYTE), 
	"GRC_CONTENT" VARCHAR2(2000 BYTE), 
	"GRC_GPXORI" VARCHAR2(2000 BYTE), 
	"GRC_GPXRE" VARCHAR2(2000 BYTE), 
	"GRC_IMGORI" VARCHAR2(2000 BYTE), 
	"GRC_IMGRE" VARCHAR2(1000 BYTE), 
	"GRC_START" VARCHAR2(1000 BYTE), 
	"GRC_END" VARCHAR2(1000 BYTE), 
	"GRC_LENGTH" VARCHAR2(1000 BYTE), 
	"GRC_DATE" DATE DEFAULT SYSDATE, 
	"GRC_STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table GPX_USER_RANKING
--------------------------------------------------------

  CREATE TABLE "NSR"."GPX_USER_RANKING" 
   (	"GUR_SEQ" NUMBER, 
	"U_SEQ" NUMBER, 
	"GRC_SEQ" NUMBER, 
	"GUR_TIME" NUMBER, 
	"GUR_TIMES" VARCHAR2(1000 BYTE), 
	"GUR_DATE" DATE DEFAULT SYSDATE, 
	"GUR_STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table G_RECOMMANDLIST
--------------------------------------------------------

  CREATE TABLE "NSR"."G_RECOMMANDLIST" 
   (	"R_SEQ" NUMBER, 
	"G_SEQ" NUMBER, 
	"U_SEQ" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "NSR"."NOTICE" 
   (	"N_SEQ" NUMBER, 
	"U_SEQ" NUMBER, 
	"N_TITLE" VARCHAR2(300 BYTE), 
	"N_CONTENT" VARCHAR2(4000 BYTE), 
	"N_COUNT" NUMBER DEFAULT 0, 
	"N_DATE" DATE DEFAULT SYSDATE, 
	"N_ORI" VARCHAR2(200 BYTE), 
	"N_RE" VARCHAR2(200 BYTE), 
	"N_STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table NSCOURSE
--------------------------------------------------------

  CREATE TABLE "NSR"."NSCOURSE" 
   (	"NC_NO" NUMBER, 
	"Field" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table QnA
--------------------------------------------------------

  CREATE TABLE "NSR"."QnA" 
   (	"QnA_SEQ" NUMBER, 
	"U_SEQ" NUMBER, 
	"QnA_TITLE" VARCHAR2(200 BYTE), 
	"QnA_CONTENT" VARCHAR2(4000 BYTE), 
	"QnA_DATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REPLY
--------------------------------------------------------

  CREATE TABLE "NSR"."REPLY" 
   (	"R_SEQ" NUMBER, 
	"U_NICKNAME" VARCHAR2(20 BYTE), 
	"R_CONTENT" VARCHAR2(4000 BYTE), 
	"R_DATE" DATE DEFAULT SYSDATE, 
	"U_SEQ" NUMBER, 
	"B_SEQ" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USER_INFO
--------------------------------------------------------

  CREATE TABLE "NSR"."USER_INFO" 
   (	"U_SEQ" NUMBER, 
	"U_EMAIL" VARCHAR2(30 BYTE), 
	"U_PWD" VARCHAR2(200 BYTE), 
	"U_NAME" VARCHAR2(20 BYTE), 
	"U_NICKNAME" VARCHAR2(20 BYTE), 
	"U_PHONE" VARCHAR2(20 BYTE), 
	"U_ORIGINAL_IMAGE" VARCHAR2(100 BYTE), 
	"U_RENAMED_IMAGE" VARCHAR2(100 BYTE), 
	"U_ENROLLDATE" DATE DEFAULT sysdate, 
	"U_GRADE" VARCHAR2(20 BYTE) DEFAULT 1, 
	"U_STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"U_CYCLE" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into NSR.BOARD
SET DEFINE OFF;
Insert into NSR.BOARD (B_SEQ,U_SEQ,B_TITLE,B_CONTENT,B_REPLY,B_DATE,B_COUNT,U_NICKNAME,B_STATUS) values (1,4,'안녕하세요','<p>오늘 가입했습니다.</p>

<p>잘부탁드려요!!</p>
',0,to_date('20/06/24','RR/MM/DD'),0,'댕댕이','Y');
Insert into NSR.BOARD (B_SEQ,U_SEQ,B_TITLE,B_CONTENT,B_REPLY,B_DATE,B_COUNT,U_NICKNAME,B_STATUS) values (2,5,'자전거 추천좀해주세요!','<p>자전거 구입해서 운동하면서 취미생활 즐기려고합니다</p>

<p>취미생활로 즐길만한 자전거 추천좀 해주세요!</p>

<p>현재는 따릉이 타고다니고있는데 조금 괜찮은 자전거 원합니다 ㅎ</p>
',0,to_date('20/06/24','RR/MM/DD'),0,'모카','Y');
Insert into NSR.BOARD (B_SEQ,U_SEQ,B_TITLE,B_CONTENT,B_REPLY,B_DATE,B_COUNT,U_NICKNAME,B_STATUS) values (3,11,'야간 라이딩할만한 곳 어디있을까요?','<p>간만에 야간 라이딩하려고하는데 뷰괜찮은 코스 어디있을까요?&nbsp;</p>

<p>괜찮은 장소있으면 알려주세요 :)</p>
',0,to_date('20/06/24','RR/MM/DD'),0,'앗메리카노','Y');
Insert into NSR.BOARD (B_SEQ,U_SEQ,B_TITLE,B_CONTENT,B_REPLY,B_DATE,B_COUNT,U_NICKNAME,B_STATUS) values (4,15,'다들 사고조심하세요...','<p>잠깐 다른곳 보다가 사고났어요 ㅠㅠ&nbsp;</p>

<p>큰사고는 아니었지만 라이딩하면서 귀여운 고양이있어서 쳐다보면서 가다가 마주오던 자전거와 살짝부딪혔네요 ㅠㅠ</p>

<p>서로 속도가 높지않았어서 다행이었어요 쩝.. 앞으로 주의해서 라이딩해야겠다는 생각이 드네요&nbsp;</p>

<p>다른 분들도 라이딩할 때 안전하게 타세요~</p>
',0,to_date('20/06/24','RR/MM/DD'),0,'푸른곰팡이','Y');
Insert into NSR.BOARD (B_SEQ,U_SEQ,B_TITLE,B_CONTENT,B_REPLY,B_DATE,B_COUNT,U_NICKNAME,B_STATUS) values (5,17,'관리자님은 자전거 어떤모델이시려나..','<p>관리자님도 자전거 좋아하시니 이런 홈페이지도 만드셨을텐데...</p>

<p>어떤 모델 자전거 타고다니시는지 궁금하네요 ㅋ 저만 궁금한가...</p>
',0,to_date('20/06/24','RR/MM/DD'),0,'악어새모모','Y');
Insert into NSR.BOARD (B_SEQ,U_SEQ,B_TITLE,B_CONTENT,B_REPLY,B_DATE,B_COUNT,U_NICKNAME,B_STATUS) values (6,21,'아재 개그 퀴즈','<p>아재개그 문제 2가지에요! 양심껏 인터넷검색말고 맞혀보세요 ㅎㅅㅎ</p>

<p>정답은 자정에 알려드릴게요!</p>

<p>&nbsp;</p>

<p>흡혈귀들이 식탁에서 웃음이 끊이질 않는 이유는?</p>

<p>&nbsp;</p>

<p>스님이 택시를 타고 한 말은?</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
',0,to_date('20/06/24','RR/MM/DD'),0,'새벽뿜뿜','Y');
Insert into NSR.BOARD (B_SEQ,U_SEQ,B_TITLE,B_CONTENT,B_REPLY,B_DATE,B_COUNT,U_NICKNAME,B_STATUS) values (8,19,'오늘 기록 좀 아쉽네요 ㅠ','<p>오늘 컨디션이 좋지않았는지 ...</p>

<p>평소 다니던 코스 기록이 역대급으로 좋지않네요 쩝... 좀 쉬면서 회복하고</p>

<p>다시 라이딩해야겠어요 최근 일이 많이 바빴는지 바디 컨디션이 영아니네요 ㅠ</p>

<p>다들 건강관리하세용 ~</p>
',0,to_date('20/06/24','RR/MM/DD'),0,'피방마스터','Y');
REM INSERTING into NSR.GPX
SET DEFINE OFF;
Insert into NSR.GPX (G_SEQ,U_SEQ,G_CONTENT,G_DATE,G_TITLE,G_ORI,G_RE,U_NICKNAME,G_COUNT,G_RECOMMAND,G_REPLY,G_STATUS) values (4,13,'평소에 다른 코스만 다니다가 남산코스 처음 다녔는데 좋네요 ㅎㅎ',to_date('20/06/24','RR/MM/DD'),'남산남산해~','1789759270.gpx','2020_06_24_163449019_792.gpx','도그버드',0,0,0,'Y');
Insert into NSR.GPX (G_SEQ,U_SEQ,G_CONTENT,G_DATE,G_TITLE,G_ORI,G_RE,U_NICKNAME,G_COUNT,G_RECOMMAND,G_REPLY,G_STATUS) values (2,2,'간만의 라이딩 재밌게 했네요 ㅎㅅㅎ',to_date('20/06/24','RR/MM/DD'),'날이 좋아서 날이 좋지않아서..','_6_.gpx','2020_06_24_163246462_86.gpx','낚시꾼',1,0,0,'Y');
Insert into NSR.GPX (G_SEQ,U_SEQ,G_CONTENT,G_DATE,G_TITLE,G_ORI,G_RE,U_NICKNAME,G_COUNT,G_RECOMMAND,G_REPLY,G_STATUS) values (3,7,'남산까지 신나게 달렸어요 ~<br />
간만에 땀빼면서 달렸는데 크... 기분너무좋네요 :)',to_date('20/06/24','RR/MM/DD'),'남산코스!','30_.gpx','2020_06_24_163357798_696.gpx','자덕자덕',0,0,0,'Y');
Insert into NSR.GPX (G_SEQ,U_SEQ,G_CONTENT,G_DATE,G_TITLE,G_ORI,G_RE,U_NICKNAME,G_COUNT,G_RECOMMAND,G_REPLY,G_STATUS) values (5,17,'매직아워 시간대에 올라가서 일몰 구경도하고 천천히 내려오면 굳',to_date('20/06/24','RR/MM/DD'),'야경까지 보기좋네요','2588355456.gpx','2020_06_24_163545958_945.gpx','악어새모모',0,0,0,'Y');
Insert into NSR.GPX (G_SEQ,U_SEQ,G_CONTENT,G_DATE,G_TITLE,G_ORI,G_RE,U_NICKNAME,G_COUNT,G_RECOMMAND,G_REPLY,G_STATUS) values (6,19,'다들 기록이 좋으시네요 ㅠ<br />
저도 기록단축좀 해보도록 노력해봐야겠어요 ㅋ',to_date('20/06/24','RR/MM/DD'),'다들 기록이...','2604259228.gpx','2020_06_24_163646993_87.gpx','피방마스터',0,0,0,'Y');
REM INSERTING into NSR.GPXREPLY
SET DEFINE OFF;
REM INSERTING into NSR.GPX_RANKING_COURSE
SET DEFINE OFF;
Insert into NSR.GPX_RANKING_COURSE (GRC_SEQ,GRC_TITLE,GRC_CONTENT,GRC_GPXORI,GRC_GPXRE,GRC_IMGORI,GRC_IMGRE,GRC_START,GRC_END,GRC_LENGTH,GRC_DATE,GRC_STATUS) values (1,'남산 코스','<strong>남산 자전거 도로</strong>입니다.<br />
<br />
모두 힘내 주세요!!<br />
<br />
화이팅','남산코스gpx.gpx','2020_06_21_122014188_363.gpx','남산코스img.PNG','2020_06_21_122014189_512.PNG','37.55068926859596,126.99887286500486','37.55083671450629,126.99126355492434','1.81',to_date('20/06/21','RR/MM/DD'),'M');
Insert into NSR.GPX_RANKING_COURSE (GRC_SEQ,GRC_TITLE,GRC_CONTENT,GRC_GPXORI,GRC_GPXRE,GRC_IMGORI,GRC_IMGRE,GRC_START,GRC_END,GRC_LENGTH,GRC_DATE,GRC_STATUS) values (2,'안양천-성내천 코스','한강 남쪽 자전거 도로를 이용한 코스 입니다.','안양천성내천.gpx','2020_06_21_154634894_374.gpx','안양천성내천.PNG','2020_06_21_154634895_250.PNG','37.55376904145888,126.87811052287184','37.52486183078656,127.1024298231409','24.5',to_date('20/06/21','RR/MM/DD'),'Y');
REM INSERTING into NSR.GPX_USER_RANKING
SET DEFINE OFF;
Insert into NSR.GPX_USER_RANKING (GUR_SEQ,U_SEQ,GRC_SEQ,GUR_TIME,GUR_TIMES,GUR_DATE,GUR_STATUS) values (1,1,1,440000,'7:00',to_date('20/03/24','RR/MM/DD'),'Y');
Insert into NSR.GPX_USER_RANKING (GUR_SEQ,U_SEQ,GRC_SEQ,GUR_TIME,GUR_TIMES,GUR_DATE,GUR_STATUS) values (2,2,1,448000,'7:00',to_date('20/04/12','RR/MM/DD'),'Y');
Insert into NSR.GPX_USER_RANKING (GUR_SEQ,U_SEQ,GRC_SEQ,GUR_TIME,GUR_TIMES,GUR_DATE,GUR_STATUS) values (3,7,1,440000,'7:00',to_date('20/04/13','RR/MM/DD'),'Y');
Insert into NSR.GPX_USER_RANKING (GUR_SEQ,U_SEQ,GRC_SEQ,GUR_TIME,GUR_TIMES,GUR_DATE,GUR_STATUS) values (4,13,1,532000,'8:00',to_date('20/05/09','RR/MM/DD'),'Y');
Insert into NSR.GPX_USER_RANKING (GUR_SEQ,U_SEQ,GRC_SEQ,GUR_TIME,GUR_TIMES,GUR_DATE,GUR_STATUS) values (5,17,1,744000,'12:00',to_date('20/05/11','RR/MM/DD'),'Y');
Insert into NSR.GPX_USER_RANKING (GUR_SEQ,U_SEQ,GRC_SEQ,GUR_TIME,GUR_TIMES,GUR_DATE,GUR_STATUS) values (6,19,1,638000,'10:00',to_date('20/05/31','RR/MM/DD'),'Y');
REM INSERTING into NSR.G_RECOMMANDLIST
SET DEFINE OFF;
REM INSERTING into NSR.NOTICE
SET DEFINE OFF;
Insert into NSR.NOTICE (N_SEQ,U_SEQ,N_TITLE,N_CONTENT,N_COUNT,N_DATE,N_ORI,N_RE,N_STATUS) values (3,1,'[점검완료] 3/19(목) 홈페이지 점검(07:00~09:00)','<p><br />
안녕하세요 자덕님!</p>

<p>자덕들의 홈페이지 편리성을 위해 힘쓰고 있는 <strong>관리자</strong>입니다.</p>

<p>&nbsp;</p>

<p>자덕 가족 여러분께 더욱 안정적인 웹 환경을 제공해 드리기 위한</p>

<p>웹 점검이 진행되어 안내드립니다.</p>

<p>&nbsp;</p>

<p><span class="marker">웹 점검 중에는 웹사이트를 이용할 수 없습니다.</span></p>

<p>&nbsp;</p>

<p><strong>[작업일시]</strong></p>

<p>2020년3월19일(목) 오전7시 ~오전9시 (2시간)</p>

<p>2020년3월19일(목) 오전8시30분 점검이 조기 종료됩니다.</p>

<p>&nbsp;</p>

<p><strong>[작업 대상]</strong></p>

<p>1) NSRecord GPX 게시판</p>

<p>2) NSRecord 자유게시판</p>

<p>&nbsp;</p>

<p><strong>[작업 내역]</strong></p>

<p>1) 게시판 점검</p>

<p>&nbsp;</p>

<p>예정된 시간에 점검을 완료할 수 있도록 최선을 다하겠습니다.</p>

<p>다만, 작업 진행 상황에 따라 변동될 수 있는 점 미리 양해 부탁드립니다.</p>

<p>원활하고, 즐거운 자덕들의 놀이터를 만들기 위해 더욱 노력하겠습니다.</p>

<p>&nbsp;</p>

<p>고맙습니다.</p>

<p>&nbsp;</p>

<p><strong>관리자 올림</strong></p>
',0,to_date('20/03/18','RR/MM/DD'),null,null,'Y');
Insert into NSR.NOTICE (N_SEQ,U_SEQ,N_TITLE,N_CONTENT,N_COUNT,N_DATE,N_ORI,N_RE,N_STATUS) values (2,1,'3/19(목) 홈페이지 정기점검 안내','<p>안녕하세요, 자덕 여러분.</p>

<p>&nbsp;</p>

<p><strong>매월 3주 목요일은 웹페이지 정기점검으로 </strong></p>

<p><strong>3/19(목) 오전7시부터 오전9시까지</strong></p>

<p><strong>NSRecord 웹페이지 이용이 원활하지 않습니다.</strong></p>

<p>&nbsp;</p>

<p>자덕 여러분들의 너그러운 양해 부탁드리며</p>

<p>자세한 점검시간과 작업영향은 아래 내용을 확인해 주시기 바랍니다.</p>

<p>&nbsp;</p>

<p>▣ 점검시간과 작업영향</p>

<p>&nbsp;</p>

<p><strong>-&nbsp;</strong><strong>오전&nbsp;7시&nbsp;~&nbsp;오전 9시(2시간)</strong><br />
:&nbsp;웹 서비스 이용이 원활하지 않습니다.<br />
<br />
안내 드리는 내용 참고하셔서 이용에 불편 없으시길 바랍니다.<br />
<br />
감사합니다.</p>
',0,to_date('20/03/19','RR/MM/DD'),null,null,'Y');
Insert into NSR.NOTICE (N_SEQ,U_SEQ,N_TITLE,N_CONTENT,N_COUNT,N_DATE,N_ORI,N_RE,N_STATUS) values (4,1,'4/16(목) 홈페이지 정기점검 안내','<p>안녕하세요, 자덕 여러분.</p>

<p>&nbsp;</p>

<p><strong>매월 3주 목요일은 웹페이지 정기점검으로</strong></p>

<p><strong>4/16(목) 오전7시부터 오전8시까지</strong></p>

<p><strong>NSRecord 웹페이지 이용이 원활하지 않습니다.</strong></p>

<p>&nbsp;</p>

<p>자덕 여러분들의 너그러운 양해 부탁드리며</p>

<p>자세한 점검시간과 작업영향은 아래 내용을 확인해 주시기 바랍니다.</p>

<p>&nbsp;</p>

<p>▣ 점검시간과 작업영향</p>

<p>&nbsp;</p>

<p><strong>- 오전 7시 ~ 오전 8시(1시간)</strong><br />
: 웹 서비스 이용이 원활하지 않습니다.</p>

<p>안내 드리는 내용 참고하셔서 이용에 불편 없으시길 바랍니다.</p>

<p>감사합니다.</p>
',0,to_date('20/04/15','RR/MM/DD'),null,null,'Y');
Insert into NSR.NOTICE (N_SEQ,U_SEQ,N_TITLE,N_CONTENT,N_COUNT,N_DATE,N_ORI,N_RE,N_STATUS) values (5,1,'[점검완료] 4/16(목) 홈페이지 점검(07:00~08:00)','<p>안녕하세요 자덕님!</p>

<p>자덕들의 홈페이지 편리성을 위해 힘쓰고 있는 <strong>관리자</strong>입니다.</p>

<p>&nbsp;</p>

<p>자덕 가족 여러분께 더욱 안정적인 웹 환경을 제공해 드리기 위한</p>

<p>웹 점검이 진행되어 안내드립니다.</p>

<p>&nbsp;</p>

<p><span class="marker">웹 점검 중에는 웹사이트를 이용할 수 없습니다.</span></p>

<p>&nbsp;</p>

<p><strong>[작업일시]</strong></p>

<p>2020년4월16일(목) 오전7시 ~오전8시 (1시간)</p>

<p>&nbsp;</p>

<p><strong>[작업 대상]</strong></p>

<p>1) NSRecord GPX 게시판</p>

<p>2) NSRecord 자유게시판</p>

<p>&nbsp;</p>

<p><strong>[작업 내역]</strong></p>

<p>1) 게시판 점검</p>

<p>&nbsp;</p>

<p>예정된 시간에 점검을 완료할 수 있도록 최선을 다하겠습니다.</p>

<p>다만, 작업 진행 상황에 따라 변동될 수 있는 점 미리 양해 부탁드립니다.</p>

<p>원활하고, 즐거운 자덕들의 놀이터를 만들기 위해 더욱 노력하겠습니다.</p>

<p>&nbsp;</p>

<p>고맙습니다.</p>

<p>&nbsp;</p>

<p><strong>관리자 올림</strong></p>
',0,to_date('20/04/16','RR/MM/DD'),null,null,'Y');
Insert into NSR.NOTICE (N_SEQ,U_SEQ,N_TITLE,N_CONTENT,N_COUNT,N_DATE,N_ORI,N_RE,N_STATUS) values (6,1,'5/21(목) 홈페이지 정기점검 안내','<p>안녕하세요, 자덕 여러분.</p>

<p>&nbsp;</p>

<p><strong>매월 3주 목요일은 웹페이지 정기점검으로</strong></p>

<p><strong>5/21(목) 오전7시부터 오전9시까지</strong></p>

<p><strong>NSRecord 웹페이지 이용이 원활하지 않습니다.</strong></p>

<p>&nbsp;</p>

<p>자덕 여러분들의 너그러운 양해 부탁드리며</p>

<p>자세한 점검시간과 작업영향은 아래 내용을 확인해 주시기 바랍니다.</p>

<p>&nbsp;</p>

<p>▣ 점검시간과 작업영향</p>

<p>&nbsp;</p>

<p><strong>- 오전 7시 ~ 오전 9시(2시간)</strong><br />
: 웹 서비스 이용이 원활하지 않습니다.</p>

<p>안내 드리는 내용 참고하셔서 이용에 불편 없으시길 바랍니다.</p>

<p>감사합니다.</p>
',0,to_date('20/05/20','RR/MM/DD'),null,null,'Y');
Insert into NSR.NOTICE (N_SEQ,U_SEQ,N_TITLE,N_CONTENT,N_COUNT,N_DATE,N_ORI,N_RE,N_STATUS) values (7,1,'(연장)[점검완료] 5/21(목) 홈페이지 점검(07:00~10:40)','<p>안녕하세요 자덕님!</p>

<p>자덕들의 홈페이지 편리성을 위해 힘쓰고 있는 <strong>관리자</strong>입니다.</p>

<p>&nbsp;</p>

<p>자덕 가족 여러분께 더욱 안정적인 웹 환경을 제공해 드리기 위한</p>

<p>웹 점검이 진행되어 안내드립니다.</p>

<p>&nbsp;</p>

<p><span class="marker">웹 점검 중에는 웹사이트를 이용할 수 없습니다.</span></p>

<p>&nbsp;</p>

<p><strong>[작업일시]</strong></p>

<p>2020년5월21일(목) 오전7시 ~오전9시 (2시간)</p>

<p><s>2020년5월21일(목) 오전7시 ~오전11시로 2시간 점검 연장되었습니다.</s></p>

<p>2020년5월21일(목) 오전 10시 40분 조기오픈 되었습니다.</p>

<p>&nbsp;</p>

<p><strong>[작업 대상]</strong></p>

<p>1) NSRecord GPX 게시판</p>

<p>2) NSRecord 자유게시판</p>

<p>&nbsp;</p>

<p><strong>[작업 내역]</strong></p>

<p>1) 홈페이지 점검</p>

<p>&nbsp;</p>

<p>예정된 시간에 점검을 완료할 수 있도록 최선을 다하겠습니다.</p>

<p>다만, 작업 진행 상황에 따라 변동될 수 있는 점 미리 양해 부탁드립니다.</p>

<p>원활하고, 즐거운 자덕들의 놀이터를 만들기 위해 더욱 노력하겠습니다.</p>

<p>&nbsp;</p>

<p>고맙습니다.</p>

<p>&nbsp;</p>

<p><strong>관리자 올림</strong></p>
',0,to_date('20/05/21','RR/MM/DD'),null,null,'Y');
Insert into NSR.NOTICE (N_SEQ,U_SEQ,N_TITLE,N_CONTENT,N_COUNT,N_DATE,N_ORI,N_RE,N_STATUS) values (8,1,'05/23(토) 홈페이지 긴급점검 안내','<p>안녕하세요, 자덕 여러분.</p>

<p>&nbsp;</p>

<p><ins><strong>05/23(토) 서비스 안정화 작업을 위한 긴급점검</strong></ins>이&nbsp;</p>

<p>예정되어 있어 안내 드립니다.</p>

<p>&nbsp;</p>

<p>회원 여러분들의 너그러운 양해 부탁드리며,</p>

<p>자세한 점검시간과 작업영향은 아래 내용을 왁인해 주시기 바랍니다.</p>

<p>&nbsp;</p>

<p><strong>▣ 점검시간과 작업영향</strong></p>

<p>&nbsp;&nbsp;</p>

<p><strong>&nbsp; &nbsp;- 05월 23일(토) 오전 07시 ~ 오전 08시 30분(90분)</strong></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;: 웹 서비스 이용이 원활하지 않습니다.</p>

<p>&nbsp;</p>

<p>위 내용 참고하셔서 이용에 불편 없으시길 바랍니다.</p>

<p>&nbsp;&nbsp;</p>

<p>감사합니다.</p>
',0,to_date('20/05/22','RR/MM/DD'),null,null,'Y');
Insert into NSR.NOTICE (N_SEQ,U_SEQ,N_TITLE,N_CONTENT,N_COUNT,N_DATE,N_ORI,N_RE,N_STATUS) values (12,1,'[점검완료] 6/02(화) 홈페이지 임시점검(07:00~09:00)','<p>안녕하세요 자덕님!</p>

<p>자덕들의 홈페이지 편리성을 위해 힘쓰고 있는 <strong>관리자</strong>입니다.</p>

<p>&nbsp;</p>

<p>더욱 안정적인 환경에서 NSRecord를 이용하실 수 있도록 임시점검이 진행됩니다.</p>

<p>갑작스러운 임시점검으로 웹 서비스 이용에 불편을 끼쳐 드려 대단히 죄송합니다.</p>

<p>&nbsp;</p>

<p><strong>[작업일시]</strong></p>

<p>2020년6월02일(목) 오전7시 ~오전9시 (2시간)</p>

<p>&nbsp;</p>

<p><strong>[작업 내역]</strong></p>

<p>1) NSRecord 홈페이지 임시점검</p>

<p>&nbsp;</p>

<p>예정된 시간에 점검을 완료할 수 있도록 최선을 다하겠습니다.</p>

<p>다만, 작업 진행 상황에 따라 변동될 수 있는 점 미리 양해 부탁드립니다.</p>

<p>원활하고, 즐거운&nbsp;덕들의 놀이터를 만들기 위해 더욱 노력하겠습니다.</p>

<p>&nbsp;</p>

<p>고맙습니다.</p>

<p>&nbsp;</p>

<p><strong>관리자 올림</strong></p>
',1,to_date('20/05/23','RR/MM/DD'),null,null,'Y');
Insert into NSR.NOTICE (N_SEQ,U_SEQ,N_TITLE,N_CONTENT,N_COUNT,N_DATE,N_ORI,N_RE,N_STATUS) values (10,1,'[점검완료] 5/23(토) 홈페이지 긴급점검(07:00~08:30)','<p>안녕하세요, 자덕님!</p>

<p><strong>관리자</strong> 입니다.</p>

<p>&nbsp;</p>

<p>확인된 문제를 해결하기 위해 긴급 웹 점검을 진행합니다.</p>

<p>&nbsp;</p>

<p><strong>[작업 일시]</strong></p>

<p>2020년 5월23일(토) 오전7시 ~ 8시30분 (90분)</p>

<p>&nbsp;</p>

<p><strong>[작업 내역]</strong></p>

<p>1) GPX 파일 업로드시 비정상적으로 게시글이 올라가는 문제 해결</p>

<p>&nbsp;</p>

<p>신속하게 문제를 해결하기 위해 최선을 다하겠습니다.</p>

<p>&nbsp;</p>

<p>고맙습니다.</p>

<p>&nbsp;</p>

<p><strong>관리자 올림</strong></p>

<p>&nbsp;</p>
',0,to_date('20/06/01','RR/MM/DD'),null,null,'Y');
Insert into NSR.NOTICE (N_SEQ,U_SEQ,N_TITLE,N_CONTENT,N_COUNT,N_DATE,N_ORI,N_RE,N_STATUS) values (11,1,'6/02(화) 홈페이지 임시점검 안내','<p>안녕하세요, 자덕 여러분.</p>

<p>&nbsp;</p>

<p><strong>홈페이지 임시점검으로 6월2일(화) 오전7시부터9시까지</strong></p>

<p><strong>NSRecord 웹페이지 이용이 원활하지 않습니다.</strong></p>

<p>&nbsp;</p>

<p>자덕 여러분들의 너그러운 양해 부탁드리며</p>

<p>자세한 점검시간과 작업영향은 아래 내용을 확인해 주시기 바랍니다.</p>

<p>&nbsp;</p>

<p><strong>▣ 점검시간과 작업영향</strong></p>

<p><strong>- 오전 7시 ~ 오전 9시(2시간)</strong></p>

<p><strong>&nbsp;: 웹 서비스 이용이 원활하지 않습니다.</strong></p>

<p>안내 드리는 내용 참고하셔서 이용에 불편 없으시길 바랍니다.</p>

<p>감사합니다.</p>
',0,to_date('20/06/02','RR/MM/DD'),null,null,'Y');
Insert into NSR.NOTICE (N_SEQ,U_SEQ,N_TITLE,N_CONTENT,N_COUNT,N_DATE,N_ORI,N_RE,N_STATUS) values (13,1,'6/18(목) 홈페이지 정기점검 안내','<p>안녕하세요, 자덕 여러분.</p>

<p>&nbsp;</p>

<p><strong>매월 3주 목요일은 웹페이지 정기점검으로</strong></p>

<p><strong>3/19(목) 오전7시부터 오전8시까지</strong></p>

<p><strong>NSRecord 웹페이지 이용이 원활하지 않습니다.</strong></p>

<p>&nbsp;</p>

<p>자덕 여러분들의 너그러운 양해 부탁드리며</p>

<p>자세한 점검시간과 작업영향은 아래 내용을 확인해 주시기 바랍니다.</p>

<p>&nbsp;</p>

<p><strong>▣ 점검시간과 작업영향</strong></p>

<p>&nbsp;</p>

<p><strong>- 오전 7시 ~ 오전 8시(1시간)<br />
: 웹 서비스 이용이 원활하지 않습니다.</strong></p>

<p>안내 드리는 내용 참고하셔서 이용에 불편 없으시길 바랍니다.</p>

<p>감사합니다.</p>
',0,to_date('20/06/17','RR/MM/DD'),null,null,'Y');
Insert into NSR.NOTICE (N_SEQ,U_SEQ,N_TITLE,N_CONTENT,N_COUNT,N_DATE,N_ORI,N_RE,N_STATUS) values (14,1,'[점검완료] 6/18(목) 홈페이지 점검(07:00~08:00)','<p>안녕하세요 자덕님!</p>

<p>자덕들의 홈페이지 편리성을 위해 힘쓰고 있는 <strong>관리자</strong>입니다.</p>

<p>&nbsp;</p>

<p>자덕 가족 여러분께 더욱 안정적인 웹 환경을 제공해 드리기 위한</p>

<p>웹 점검이 진행되어 안내드립니다.</p>

<p>&nbsp;</p>

<p><span class="marker">웹 점검 중에는 웹사이트를 이용할 수 없습니다.</span></p>

<p>&nbsp;</p>

<p><strong>[작업일시]</strong></p>

<p>2020년6월18일(목) 오전7시 ~오전8시 (1시간)</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong>[작업 대상]</strong></p>

<p>1) NSRecord GPX 게시판</p>

<p>2) NSRecord 자유게시판</p>

<p>&nbsp;</p>

<p><strong>[작업 내역]</strong></p>

<p>1) 게시판 점검</p>

<p>&nbsp;</p>

<p>예정된 시간에 점검을 완료할 수 있도록 최선을 다하겠습니다.</p>

<p>다만, 작업 진행 상황에 따라 변동될 수 있는 점 미리 양해 부탁드립니다.</p>

<p>원활하고, 즐거운 자덕들의 놀이터를 만들기 위해 더욱 노력하겠습니다.</p>

<p>&nbsp;</p>

<p>고맙습니다.</p>

<p>&nbsp;</p>

<p>관리자 올림</p>
',4,to_date('20/06/18','RR/MM/DD'),null,null,'Y');
REM INSERTING into NSR.NSCOURSE
SET DEFINE OFF;
REM INSERTING into NSR."QnA"
SET DEFINE OFF;
REM INSERTING into NSR.REPLY
SET DEFINE OFF;
REM INSERTING into NSR.USER_INFO
SET DEFINE OFF;
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (1,'admin','1234','관리자','관리자','01000000000',null,null,to_date('19/01/01','RR/MM/DD'),'5','Y','관리자');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (2,'fisher1004go@google.com','1234','김지후','낚시꾼','01099998888',null,null,to_date('19/02/19','RR/MM/DD'),'1','Y','TCR 어드밴스 SL');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (3,'freedown24@google.com','1234','이준서','아바타','01082706064',null,null,to_date('19/02/27','RR/MM/DD'),'1','Y','프로펠 어드밴스 프로');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (4,'git1224@google.com','1234','김도윤','댕댕이','01002241025',null,null,to_date('19/05/24','RR/MM/DD'),'1','Y','슈퍼식스 EVO');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (5,'h74sunibego@google.com','1234','최윤지','모카','01035701914',null,null,to_date('19/05/25','RR/MM/DD'),'1','Y','시스템식스 리본');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (6,'hoteet1234@google.com','1234','정은서','고인물','01024152920',null,null,to_date('19/05/25','RR/MM/DD'),'1','Y','얼티메이트 CF SL');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (7,'kim8428721@google.com','1234','김지훈','자덕자덕','01060027735',null,null,to_date('19/07/23','RR/MM/DD'),'1','Y','에어로드 CF SL');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (8,'love9308@google.com','1234','김예은','대파부엉이','01024941138',null,null,to_date('19/08/02','RR/MM/DD'),'1','Y','마돈 SL 6 디스크');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (9,'pjmmd4274@google.com','1234','김선우','땅콩치즈','01016198985',null,null,to_date('19/08/13','RR/MM/DD'),'1','Y','TCR 어드밴스');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (10,'sexyboy872@google.com','1234','최우진','해님달님','01015432532',null,null,to_date('19/08/15','RR/MM/DD'),'1','Y','CAAD13');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (11,'sjdk1327@google.com','1234','김현준','앗메리카노','01090332939',null,null,to_date('19/09/22','RR/MM/DD'),'1','Y','에몬다 SL 5');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (12,'thduddl0227@naver.com','1234','서유준','버드열차','01079541705',null,null,to_date('19/12/10','RR/MM/DD'),'1','Y','케인');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (13,'vip0183@naver.com','1234','신정우','도그버드','01029386953',null,null,to_date('19/12/14','RR/MM/DD'),'1','Y','레이다');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (14,'wanted00@daum.net','1234','정승현','탐탐일레븐','01029386953',null,null,to_date('20/01/05','RR/MM/DD'),'1','Y','팀머신 SLR02 디스크');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (15,'younghi46@naver.com','1234','정지우
','푸른곰팡이','01045747345',null,null,to_date('20/02/01','RR/MM/DD'),'1','Y','알레');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (16,'yumi77228@daum.net','1234','김유찬','청둥오리','01054463704',null,null,to_date('20/02/23','RR/MM/DD'),'1','Y','컨텐드 AR');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (17,'topas117@daum.net','1234','김시후','악어새모모','01011996012',null,null,to_date('20/03/25','RR/MM/DD'),'1','Y','에포카');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (18,'sxier434@naver.com','1234','허진우','금은도끼','01032558985',null,null,to_date('20/03/31','RR/MM/DD'),'1','Y','스칼라티');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (19,'saja00000@naver.com','1234','한승우','피방마스터','01021742019',null,null,to_date('20/04/24','RR/MM/DD'),'1','Y','알레 스프린트 디스크');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (20,'jason112@naver.com','1234','김하린','바이크부스터','01059105858',null,null,to_date('20/05/22','RR/MM/DD'),'1','Y','타막 디스크 프로');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (21,'venjema@naver.com','1234','서예진','새벽뿜뿜','01020192752',null,null,to_date('20/05/29','RR/MM/DD'),'1','Y','에어로드 CF SL');
Insert into NSR.USER_INFO (U_SEQ,U_EMAIL,U_PWD,U_NAME,U_NICKNAME,U_PHONE,U_ORIGINAL_IMAGE,U_RENAMED_IMAGE,U_ENROLLDATE,U_GRADE,U_STATUS,U_CYCLE) values (22,'ronaldofk@naver.com','1234','김수호','냥냥펀치','01043289190',null,null,to_date('20/06/24','RR/MM/DD'),'1','Y','TCR 어드밴스');
--------------------------------------------------------
--  DDL for Index PK_QNA
--------------------------------------------------------

  CREATE UNIQUE INDEX "NSR"."PK_QNA" ON "NSR"."QnA" ("QnA_SEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_USER_INFO
--------------------------------------------------------

  CREATE UNIQUE INDEX "NSR"."PK_USER_INFO" ON "NSR"."USER_INFO" ("U_SEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_G_RECOMMANDLIST
--------------------------------------------------------

  CREATE UNIQUE INDEX "NSR"."PK_G_RECOMMANDLIST" ON "NSR"."G_RECOMMANDLIST" ("R_SEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_GPX_USER_RANKING
--------------------------------------------------------

  CREATE UNIQUE INDEX "NSR"."PK_GPX_USER_RANKING" ON "NSR"."GPX_USER_RANKING" ("GUR_SEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_GPX
--------------------------------------------------------

  CREATE UNIQUE INDEX "NSR"."PK_GPX" ON "NSR"."GPX" ("G_SEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_GPXREPLY
--------------------------------------------------------

  CREATE UNIQUE INDEX "NSR"."PK_GPXREPLY" ON "NSR"."GPXREPLY" ("GR_SEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_GPX_RANKING_COURSE
--------------------------------------------------------

  CREATE UNIQUE INDEX "NSR"."PK_GPX_RANKING_COURSE" ON "NSR"."GPX_RANKING_COURSE" ("GRC_SEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_NSCOURSE
--------------------------------------------------------

  CREATE UNIQUE INDEX "NSR"."PK_NSCOURSE" ON "NSR"."NSCOURSE" ("NC_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_NOTICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "NSR"."PK_NOTICE" ON "NSR"."NOTICE" ("N_SEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_REPLY
--------------------------------------------------------

  CREATE UNIQUE INDEX "NSR"."PK_REPLY" ON "NSR"."REPLY" ("R_SEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table GPX
--------------------------------------------------------

  ALTER TABLE "NSR"."GPX" MODIFY ("G_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX" MODIFY ("U_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX" MODIFY ("G_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX" MODIFY ("G_TITLE" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX" MODIFY ("G_ORI" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX" MODIFY ("G_RE" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX" MODIFY ("U_NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX" MODIFY ("G_STATUS" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX" ADD CONSTRAINT "PK_GPX" PRIMARY KEY ("G_SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GPX_RANKING_COURSE
--------------------------------------------------------

  ALTER TABLE "NSR"."GPX_RANKING_COURSE" MODIFY ("GRC_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_RANKING_COURSE" MODIFY ("GRC_TITLE" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_RANKING_COURSE" MODIFY ("GRC_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_RANKING_COURSE" MODIFY ("GRC_GPXORI" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_RANKING_COURSE" MODIFY ("GRC_GPXRE" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_RANKING_COURSE" MODIFY ("GRC_IMGORI" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_RANKING_COURSE" MODIFY ("GRC_IMGRE" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_RANKING_COURSE" MODIFY ("GRC_START" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_RANKING_COURSE" MODIFY ("GRC_END" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_RANKING_COURSE" MODIFY ("GRC_LENGTH" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_RANKING_COURSE" ADD CONSTRAINT "PK_GPX_RANKING_COURSE" PRIMARY KEY ("GRC_SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "NSR"."BOARD" MODIFY ("B_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."BOARD" MODIFY ("U_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."BOARD" MODIFY ("B_TITLE" NOT NULL ENABLE);
  ALTER TABLE "NSR"."BOARD" MODIFY ("B_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NSR"."BOARD" MODIFY ("U_NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "NSR"."BOARD" MODIFY ("B_STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QnA
--------------------------------------------------------

  ALTER TABLE "NSR"."QnA" MODIFY ("QnA_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."QnA" MODIFY ("U_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."QnA" MODIFY ("QnA_TITLE" NOT NULL ENABLE);
  ALTER TABLE "NSR"."QnA" MODIFY ("QnA_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NSR"."QnA" ADD CONSTRAINT "PK_QNA" PRIMARY KEY ("QnA_SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GPXREPLY
--------------------------------------------------------

  ALTER TABLE "NSR"."GPXREPLY" MODIFY ("GR_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPXREPLY" MODIFY ("U_NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPXREPLY" MODIFY ("GR_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPXREPLY" MODIFY ("GR_DATE" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPXREPLY" MODIFY ("G_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPXREPLY" MODIFY ("U_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPXREPLY" ADD CONSTRAINT "PK_GPXREPLY" PRIMARY KEY ("GR_SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPLY
--------------------------------------------------------

  ALTER TABLE "NSR"."REPLY" MODIFY ("R_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."REPLY" MODIFY ("U_NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "NSR"."REPLY" MODIFY ("R_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NSR"."REPLY" MODIFY ("R_DATE" NOT NULL ENABLE);
  ALTER TABLE "NSR"."REPLY" MODIFY ("U_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."REPLY" MODIFY ("B_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY ("R_SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NSCOURSE
--------------------------------------------------------

  ALTER TABLE "NSR"."NSCOURSE" MODIFY ("NC_NO" NOT NULL ENABLE);
  ALTER TABLE "NSR"."NSCOURSE" ADD CONSTRAINT "PK_NSCOURSE" PRIMARY KEY ("NC_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GPX_USER_RANKING
--------------------------------------------------------

  ALTER TABLE "NSR"."GPX_USER_RANKING" MODIFY ("GUR_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_USER_RANKING" MODIFY ("U_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_USER_RANKING" MODIFY ("GRC_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_USER_RANKING" MODIFY ("GUR_TIME" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_USER_RANKING" MODIFY ("GUR_TIMES" NOT NULL ENABLE);
  ALTER TABLE "NSR"."GPX_USER_RANKING" ADD CONSTRAINT "PK_GPX_USER_RANKING" PRIMARY KEY ("GUR_SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USER_INFO
--------------------------------------------------------

  ALTER TABLE "NSR"."USER_INFO" MODIFY ("U_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."USER_INFO" MODIFY ("U_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "NSR"."USER_INFO" MODIFY ("U_PWD" NOT NULL ENABLE);
  ALTER TABLE "NSR"."USER_INFO" MODIFY ("U_NAME" NOT NULL ENABLE);
  ALTER TABLE "NSR"."USER_INFO" MODIFY ("U_NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "NSR"."USER_INFO" MODIFY ("U_PHONE" NOT NULL ENABLE);
  ALTER TABLE "NSR"."USER_INFO" MODIFY ("U_GRADE" NOT NULL ENABLE);
  ALTER TABLE "NSR"."USER_INFO" MODIFY ("U_STATUS" NOT NULL ENABLE);
  ALTER TABLE "NSR"."USER_INFO" ADD CONSTRAINT "PK_USER_INFO" PRIMARY KEY ("U_SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "NSR"."NOTICE" MODIFY ("N_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."NOTICE" MODIFY ("U_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."NOTICE" MODIFY ("N_TITLE" NOT NULL ENABLE);
  ALTER TABLE "NSR"."NOTICE" MODIFY ("N_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NSR"."NOTICE" MODIFY ("N_STATUS" NOT NULL ENABLE);
  ALTER TABLE "NSR"."NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY ("N_SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table G_RECOMMANDLIST
--------------------------------------------------------

  ALTER TABLE "NSR"."G_RECOMMANDLIST" MODIFY ("R_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."G_RECOMMANDLIST" MODIFY ("G_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."G_RECOMMANDLIST" MODIFY ("U_SEQ" NOT NULL ENABLE);
  ALTER TABLE "NSR"."G_RECOMMANDLIST" ADD CONSTRAINT "PK_G_RECOMMANDLIST" PRIMARY KEY ("R_SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
