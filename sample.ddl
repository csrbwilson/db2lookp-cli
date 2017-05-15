-- This CLP file was created using DB2LOOK Version "10.5" 
-- Timestamp: 2017/05/10 6:47:49 PM
-- Database Name: SAMPLE         
-- Database Manager Version: DB2/NT64 Version 10.5.8       
-- Database Codepage: 1208
-- Database Collating Sequence is: IDENTITY
-- Alternate collating sequence(alt_collate): null
-- varchar2 compatibility(varchar2_compat): OFF


CONNECT TO SAMPLE;

------------------------------------------------
-- DDL Statements for Schemas
------------------------------------------------

-- Running the DDL below will explicitly create a schema in the
-- new database that corresponds to an implicitly created schema
-- in the original database.

CREATE SCHEMA "CRAIG   ";

CREATE SCHEMA "DB2ADMIN";

CREATE SCHEMA "T       ";


---------------------------------
-- DDL Statements for Sequences
---------------------------------


CREATE SEQUENCE "CRAIG   "."SAMPSEQUENCE" AS BIGINT
	MINVALUE 1 MAXVALUE 9223372036854775807
	START WITH 1 INCREMENT BY 1
	CACHE 20 NO CYCLE NO ORDER;



------------------------------------------------
-- DDL Statements for Table "CRAIG   "."CL_SCHED"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."CL_SCHED"  (
		  "CLASS_CODE" CHAR(7 OCTETS) , 
		  "DAY" SMALLINT , 
		  "STARTING" TIME , 
		  "ENDING" TIME )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "CRAIG   "."DEPARTMENT"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."DEPARTMENT"  (
		  "DEPTNO" CHAR(3 OCTETS) NOT NULL , 
		  "DEPTNAME" VARCHAR(36 OCTETS) NOT NULL , 
		  "MGRNO" CHAR(6 OCTETS) , 
		  "ADMRDEPT" CHAR(3 OCTETS) NOT NULL , 
		  "LOCATION" CHAR(16 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."DEPARTMENT"

ALTER TABLE "CRAIG   "."DEPARTMENT" 
	ADD CONSTRAINT "PK_DEPARTMENT" PRIMARY KEY
		("DEPTNO");



-- DDL Statements for Indexes on Table "CRAIG   "."DEPARTMENT"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CRAIG   "."XDEPT2" ON "CRAIG   "."DEPARTMENT" 
		("MGRNO" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

-- DDL Statements for Indexes on Table "CRAIG   "."DEPARTMENT"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CRAIG   "."XDEPT3" ON "CRAIG   "."DEPARTMENT" 
		("ADMRDEPT" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "CRAIG   "."EMPLOYEE"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."EMPLOYEE"  (
		  "EMPNO" CHAR(6 OCTETS) NOT NULL , 
		  "FIRSTNME" VARCHAR(12 OCTETS) NOT NULL , 
		  "MIDINIT" CHAR(1 OCTETS) , 
		  "LASTNAME" VARCHAR(15 OCTETS) NOT NULL , 
		  "WORKDEPT" CHAR(3 OCTETS) , 
		  "PHONENO" CHAR(4 OCTETS) , 
		  "HIREDATE" DATE , 
		  "JOB" CHAR(8 OCTETS) , 
		  "EDLEVEL" SMALLINT NOT NULL , 
		  "SEX" CHAR(1 OCTETS) , 
		  "BIRTHDATE" DATE , 
		  "SALARY" DECIMAL(9,2) , 
		  "BONUS" DECIMAL(9,2) , 
		  "COMM" DECIMAL(9,2) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."EMPLOYEE"

ALTER TABLE "CRAIG   "."EMPLOYEE" 
	ADD CONSTRAINT "PK_EMPLOYEE" PRIMARY KEY
		("EMPNO");



-- DDL Statements for Indexes on Table "CRAIG   "."EMPLOYEE"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CRAIG   "."XEMP2" ON "CRAIG   "."EMPLOYEE" 
		("WORKDEPT" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "CRAIG   "."EMP_PHOTO"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."EMP_PHOTO"  (
		  "EMPNO" CHAR(6 OCTETS) NOT NULL , 
		  "PHOTO_FORMAT" VARCHAR(10 OCTETS) NOT NULL , 
		  "PICTURE" BLOB(102400) LOGGED NOT COMPACT )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."EMP_PHOTO"

ALTER TABLE "CRAIG   "."EMP_PHOTO" 
	ADD CONSTRAINT "PK_EMP_PHOTO" PRIMARY KEY
		("EMPNO",
		 "PHOTO_FORMAT");


------------------------------------------------
-- DDL Statements for Table "CRAIG   "."EMP_RESUME"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."EMP_RESUME"  (
		  "EMPNO" CHAR(6 OCTETS) NOT NULL , 
		  "RESUME_FORMAT" VARCHAR(10 OCTETS) NOT NULL , 
		  "RESUME" CLOB(5120 OCTETS) LOGGED NOT COMPACT )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."EMP_RESUME"

ALTER TABLE "CRAIG   "."EMP_RESUME" 
	ADD CONSTRAINT "PK_EMP_RESUME" PRIMARY KEY
		("EMPNO",
		 "RESUME_FORMAT");


------------------------------------------------
-- DDL Statements for Table "CRAIG   "."PROJECT"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."PROJECT"  (
		  "PROJNO" CHAR(6 OCTETS) NOT NULL , 
		  "PROJNAME" VARCHAR(24 OCTETS) NOT NULL WITH DEFAULT '' , 
		  "DEPTNO" CHAR(3 OCTETS) NOT NULL , 
		  "RESPEMP" CHAR(6 OCTETS) NOT NULL , 
		  "PRSTAFF" DECIMAL(5,2) , 
		  "PRSTDATE" DATE , 
		  "PRENDATE" DATE , 
		  "MAJPROJ" CHAR(6 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."PROJECT"

ALTER TABLE "CRAIG   "."PROJECT" 
	ADD CONSTRAINT "PK_PROJECT" PRIMARY KEY
		("PROJNO");



-- DDL Statements for Indexes on Table "CRAIG   "."PROJECT"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CRAIG   "."XPROJ2" ON "CRAIG   "."PROJECT" 
		("RESPEMP" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "CRAIG   "."PROJACT"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."PROJACT"  (
		  "PROJNO" CHAR(6 OCTETS) NOT NULL , 
		  "ACTNO" SMALLINT NOT NULL , 
		  "ACSTAFF" DECIMAL(5,2) , 
		  "ACSTDATE" DATE NOT NULL , 
		  "ACENDATE" DATE )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."PROJACT"

ALTER TABLE "CRAIG   "."PROJACT" 
	ADD CONSTRAINT "PK_PROJACT" PRIMARY KEY
		("PROJNO",
		 "ACTNO",
		 "ACSTDATE");


------------------------------------------------
-- DDL Statements for Table "CRAIG   "."EMPPROJACT"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."EMPPROJACT"  (
		  "EMPNO" CHAR(6 OCTETS) NOT NULL , 
		  "PROJNO" CHAR(6 OCTETS) NOT NULL , 
		  "ACTNO" SMALLINT NOT NULL , 
		  "EMPTIME" DECIMAL(5,2) , 
		  "EMSTDATE" DATE , 
		  "EMENDATE" DATE )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "CRAIG   "."ACT"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."ACT"  (
		  "ACTNO" SMALLINT NOT NULL , 
		  "ACTKWD" CHAR(6 OCTETS) NOT NULL , 
		  "ACTDESC" VARCHAR(20 OCTETS) NOT NULL )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."ACT"

ALTER TABLE "CRAIG   "."ACT" 
	ADD CONSTRAINT "PK_ACT" PRIMARY KEY
		("ACTNO");



-- DDL Statements for Indexes on Table "CRAIG   "."ACT"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE UNIQUE INDEX "CRAIG   "."XACT2" ON "CRAIG   "."ACT" 
		("ACTNO" ASC,
		 "ACTKWD" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "CRAIG   "."IN_TRAY"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."IN_TRAY"  (
		  "RECEIVED" TIMESTAMP , 
		  "SOURCE" CHAR(8 OCTETS) , 
		  "SUBJECT" CHAR(64 OCTETS) , 
		  "NOTE_TEXT" VARCHAR(3000 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "CRAIG   "."ORG"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."ORG"  (
		  "DEPTNUMB" SMALLINT NOT NULL , 
		  "DEPTNAME" VARCHAR(14 OCTETS) , 
		  "MANAGER" SMALLINT , 
		  "DIVISION" VARCHAR(10 OCTETS) , 
		  "LOCATION" VARCHAR(13 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "CRAIG   "."STAFF"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."STAFF"  (
		  "ID" SMALLINT NOT NULL , 
		  "NAME" VARCHAR(9 OCTETS) , 
		  "DEPT" SMALLINT , 
		  "JOB" CHAR(5 OCTETS) , 
		  "YEARS" SMALLINT , 
		  "SALARY" DECIMAL(7,2) , 
		  "COMM" DECIMAL(7,2) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "CRAIG   "."SALES"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."SALES"  (
		  "SALES_DATE" DATE , 
		  "SALES_PERSON" VARCHAR(15 OCTETS) , 
		  "REGION" VARCHAR(15 OCTETS) , 
		  "SALES" INTEGER )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "CRAIG   "."STAFFG"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."STAFFG"  (
		  "ID" SMALLINT NOT NULL , 
		  "NAME" VARGRAPHIC(9 CODEUNITS16) , 
		  "DEPT" SMALLINT , 
		  "JOB" GRAPHIC(5 CODEUNITS16) , 
		  "YEARS" SMALLINT , 
		  "SALARY" DECIMAL(9,0) , 
		  "COMM" DECIMAL(9,0) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "CRAIG   "."ADEFUSR"
------------------------------------------------
 SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";

CREATE SUMMARY TABLE ADEFUSR AS (SELECT workdept, count(*) AS no_of_employees FROM employee GROUP BY workdept) DATA INITIALLY DEFERRED REFRESH IMMEDIATE ENABLE QUERY OPTIMIZATION MAINTAINED BY SYSTEM IN "USERSPACE1" 		ORGANIZE BY ROW;


ALTER TABLE "CRAIG   "."ADEFUSR" DEACTIVATE ROW ACCESS CONTROL;





------------------------------------------------
-- DDL Statements for Table "CRAIG   "."EMPMDC"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."EMPMDC"  (
		  "EMPNO" INTEGER , 
		  "DEPT" INTEGER , 
		  "DIV" INTEGER )   
		 IN "IBMDB2SAMPLEREL"  
		 ORGANIZE BY ROW USING ( 
		  ( "DEPT" ) , 
		  ( "DIV" ) ) 
		 ; 





------------------------------------------------
-- DDL Statements for Table "CRAIG   "."PRODUCT"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."PRODUCT"  (
		  "PID" VARCHAR(10 OCTETS) NOT NULL , 
		  "NAME" VARCHAR(128 OCTETS) , 
		  "PRICE" DECIMAL(30,2) , 
		  "PROMOPRICE" DECIMAL(30,2) , 
		  "PROMOSTART" DATE , 
		  "PROMOEND" DATE , 
		  "DESCRIPTION" XML )   
		 IN "IBMDB2SAMPLEXML"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."PRODUCT"

ALTER TABLE "CRAIG   "."PRODUCT" 
	ADD CONSTRAINT "PK_PRODUCT" PRIMARY KEY
		("PID");



-- DDL Statements for Indexes on Table "CRAIG   "."PRODUCT"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CRAIG   "."PROD_NAME_XMLIDX" ON "CRAIG   "."PRODUCT" 
		("DESCRIPTION" ASC)
		GENERATE KEY USING XMLPATTERN '/product/description/name'
		  AS SQL VARCHAR  ( 128 OCTETS ) IGNORE INVALID VALUES 
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

-- DDL Statements for Indexes on Table "CRAIG   "."PRODUCT"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CRAIG   "."PROD_DETAIL_XMLIDX" ON "CRAIG   "."PRODUCT" 
		("DESCRIPTION" ASC)
		GENERATE KEY USING XMLPATTERN '/product/description/detail'
		  AS SQL VARCHAR  HASHED IGNORE INVALID VALUES 
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "CRAIG   "."INVENTORY"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."INVENTORY"  (
		  "PID" VARCHAR(10 OCTETS) NOT NULL , 
		  "QUANTITY" INTEGER , 
		  "LOCATION" VARCHAR(128 OCTETS) )   
		 IN "IBMDB2SAMPLEXML"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."INVENTORY"

ALTER TABLE "CRAIG   "."INVENTORY" 
	ADD CONSTRAINT "PK_INVENTORY" PRIMARY KEY
		("PID");


------------------------------------------------
-- DDL Statements for Table "CRAIG   "."CUSTOMER"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."CUSTOMER"  (
		  "CID" BIGINT NOT NULL , 
		  "INFO" XML , 
		  "HISTORY" XML )   
		 IN "IBMDB2SAMPLEXML"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."CUSTOMER"

ALTER TABLE "CRAIG   "."CUSTOMER" 
	ADD CONSTRAINT "PK_CUSTOMER" PRIMARY KEY
		("CID");



-- DDL Statements for Indexes on Table "CRAIG   "."CUSTOMER"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE UNIQUE INDEX "CRAIG   "."CUST_CID_XMLIDX" ON "CRAIG   "."CUSTOMER" 
		("INFO" ASC)
		GENERATE KEY USING XMLPATTERN '/customerinfo/@Cid'
		  AS SQL DOUBLE   IGNORE INVALID VALUES 
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

-- DDL Statements for Indexes on Table "CRAIG   "."CUSTOMER"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CRAIG   "."CUST_NAME_XMLIDX" ON "CRAIG   "."CUSTOMER" 
		("INFO" ASC)
		GENERATE KEY USING XMLPATTERN '/customerinfo/name'
		  AS SQL VARCHAR  ( 50 OCTETS ) IGNORE INVALID VALUES 
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

-- DDL Statements for Indexes on Table "CRAIG   "."CUSTOMER"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CRAIG   "."CUST_PHONES_XMLIDX" ON "CRAIG   "."CUSTOMER" 
		("INFO" ASC)
		GENERATE KEY USING XMLPATTERN '/customerinfo/phone'
		  AS SQL VARCHAR  ( 25 OCTETS ) IGNORE INVALID VALUES 
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

-- DDL Statements for Indexes on Table "CRAIG   "."CUSTOMER"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CRAIG   "."CUST_PHONET_XMLIDX" ON "CRAIG   "."CUSTOMER" 
		("INFO" ASC)
		GENERATE KEY USING XMLPATTERN '/customerinfo/phone/@type'
		  AS SQL VARCHAR  ( 25 OCTETS ) IGNORE INVALID VALUES 
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "CRAIG   "."PURCHASEORDER"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."PURCHASEORDER"  (
		  "POID" BIGINT NOT NULL , 
		  "STATUS" VARCHAR(10 OCTETS) NOT NULL WITH DEFAULT 'Unshipped' , 
		  "CUSTID" BIGINT , 
		  "ORDERDATE" DATE , 
		  "PORDER" XML , 
		  "COMMENTS" VARCHAR(1000 OCTETS) )   
		 IN "IBMDB2SAMPLEXML"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."PURCHASEORDER"

ALTER TABLE "CRAIG   "."PURCHASEORDER" 
	ADD CONSTRAINT "PK_PURCHASEORDER" PRIMARY KEY
		("POID");



-- DDL Statements for Indexes on Table "CRAIG   "."PURCHASEORDER"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CRAIG   "."PO_PRODS_XMLIDX" ON "CRAIG   "."PURCHASEORDER" 
		("PORDER" ASC)
		GENERATE KEY USING XMLPATTERN '/PurchaseOrder/itemlist/item/product/@pid'
		  AS SQL DOUBLE   IGNORE INVALID VALUES 
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

-- DDL Statements for Indexes on Table "CRAIG   "."PURCHASEORDER"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CRAIG   "."PO_CID_XMLIDX" ON "CRAIG   "."PURCHASEORDER" 
		("PORDER" ASC)
		GENERATE KEY USING XMLPATTERN '/PurchaseOrder/@Cid'
		  AS SQL DOUBLE   IGNORE INVALID VALUES 
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;

-- DDL Statements for Indexes on Table "CRAIG   "."PURCHASEORDER"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "CRAIG   "."PO_ZIP_XMLIDX" ON "CRAIG   "."PURCHASEORDER" 
		("PORDER" ASC)
		GENERATE KEY USING XMLPATTERN '/PurchaseOrder/customerAdr/addr/pcode-zip'
		  AS SQL VARCHAR  ( 16 OCTETS ) IGNORE INVALID VALUES 
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "CRAIG   "."CATALOG"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."CATALOG"  (
		  "NAME" VARCHAR(128 OCTETS) NOT NULL , 
		  "CATLOG" XML )   
		 IN "IBMDB2SAMPLEXML"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."CATALOG"

ALTER TABLE "CRAIG   "."CATALOG" 
	ADD CONSTRAINT "PK_CATALOG" PRIMARY KEY
		("NAME");


------------------------------------------------
-- DDL Statements for Table "CRAIG   "."SUPPLIERS"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."SUPPLIERS"  (
		  "SID" VARCHAR(10 OCTETS) NOT NULL , 
		  "ADDR" XML )   
		 IN "IBMDB2SAMPLEXML"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."SUPPLIERS"

ALTER TABLE "CRAIG   "."SUPPLIERS" 
	ADD CONSTRAINT "PK_PRODUCTSUPPLIER" PRIMARY KEY
		("SID");


------------------------------------------------
-- DDL Statements for Table "CRAIG   "."PRODUCTSUPPLIER"
------------------------------------------------
 

CREATE TABLE "CRAIG   "."PRODUCTSUPPLIER"  (
		  "PID" VARCHAR(10 OCTETS) NOT NULL , 
		  "SID" VARCHAR(10 OCTETS) NOT NULL )   
		 IN "IBMDB2SAMPLEXML"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "CRAIG   "."PRODUCTSUPPLIER"

ALTER TABLE "CRAIG   "."PRODUCTSUPPLIER" 
	ADD CONSTRAINT "PK_PRODUCTSUPPLIER" PRIMARY KEY
		("PID",
		 "SID");


------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."ANIMALS"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."ANIMALS"  (
		  "ID" INTEGER , 
		  "BREED" VARCHAR(32 OCTETS) , 
		  "NAME" CHAR(16 OCTETS) , 
		  "WEIGHT" DECIMAL(7,2) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."ANIMAL_PICS"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."ANIMAL_PICS"  (
		  "NAME" VARCHAR(32 OCTETS) , 
		  "PICTURE" BLOB(1048576) LOGGED NOT COMPACT )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."DEPARTMENT"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."DEPARTMENT"  (
		  "DEPTNO" CHAR(3 OCTETS) NOT NULL , 
		  "DEPTNAME" VARCHAR(29 OCTETS) NOT NULL , 
		  "MGRNO" CHAR(6 OCTETS) , 
		  "ADMRDEPT" CHAR(3 OCTETS) NOT NULL , 
		  "LOCATION" CHAR(16 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."EMP_ACT"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."EMP_ACT"  (
		  "EMPNO" CHAR(6 OCTETS) NOT NULL , 
		  "PROJNO" CHAR(6 OCTETS) NOT NULL , 
		  "ACTNO" SMALLINT NOT NULL , 
		  "EMPTIME" DECIMAL(5,2) , 
		  "EMSTDATE" DATE , 
		  "EMENDATE" DATE )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."EMPLOYEE"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."EMPLOYEE"  (
		  "EMPNO" CHAR(6 OCTETS) NOT NULL , 
		  "FIRSTNME" VARCHAR(12 OCTETS) NOT NULL , 
		  "MIDINIT" CHAR(1 OCTETS) NOT NULL , 
		  "LASTNAME" VARCHAR(15 OCTETS) NOT NULL , 
		  "WORKDEPT" CHAR(3 OCTETS) , 
		  "PHONENO" CHAR(4 OCTETS) , 
		  "HIREDATE" DATE , 
		  "JOB" CHAR(8 OCTETS) , 
		  "EDLEVEL" SMALLINT NOT NULL , 
		  "SEX" CHAR(1 OCTETS) , 
		  "BIRTHDATE" DATE , 
		  "SALARY" DECIMAL(9,2) , 
		  "BONUS" DECIMAL(9,2) , 
		  "COMM" DECIMAL(9,2) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."EMP_PHOTO"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."EMP_PHOTO"  (
		  "EMPNO" CHAR(6 OCTETS) NOT NULL , 
		  "PHOTO_FORMAT" VARCHAR(10 OCTETS) NOT NULL , 
		  "PICTURE" BLOB(1048576) LOGGED NOT COMPACT )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "DB2ADMIN"."EMP_PHOTO"

ALTER TABLE "DB2ADMIN"."EMP_PHOTO" 
	ADD PRIMARY KEY
		("EMPNO",
		 "PHOTO_FORMAT");


------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."ORG"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."ORG"  (
		  "DEPTNUMB" SMALLINT NOT NULL , 
		  "DEPTNAME" VARCHAR(14 OCTETS) , 
		  "MANAGER" SMALLINT , 
		  "DIVISION" VARCHAR(10 OCTETS) , 
		  "LOCATION" VARCHAR(13 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."PROJECT"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."PROJECT"  (
		  "PROJNO" CHAR(6 OCTETS) NOT NULL , 
		  "PROJNAME" VARCHAR(24 OCTETS) NOT NULL , 
		  "DEPTNO" CHAR(3 OCTETS) NOT NULL , 
		  "RESPEMP" CHAR(6 OCTETS) NOT NULL , 
		  "PRSTAFF" DECIMAL(5,2) , 
		  "PRSTDATE" DATE , 
		  "PRENDATE" DATE , 
		  "MAJPROJ" CHAR(6 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."SALES"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."SALES"  (
		  "SALES_DATE" DATE , 
		  "SALES_PERSON" VARCHAR(15 OCTETS) , 
		  "REGION" VARCHAR(15 OCTETS) , 
		  "SALES" INTEGER )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."STAFF"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."STAFF"  (
		  "ID" SMALLINT NOT NULL , 
		  "NAME" VARCHAR(9 OCTETS) , 
		  "DEPT" SMALLINT , 
		  "JOB" CHAR(5 OCTETS) , 
		  "YEARS" SMALLINT , 
		  "SALARY" DECIMAL(7,2) , 
		  "COMM" DECIMAL(7,2) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."T_STRING"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."T_STRING"  (
		  "A" INTEGER , 
		  "B" DOUBLE , 
		  "C" VARCHAR(100 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."TEST_KEYS"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."TEST_KEYS"  (
		  "NAME" VARCHAR(30 OCTETS) NOT NULL , 
		  "IDF" INTEGER NOT NULL )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "DB2ADMIN"."TEST_KEYS"

ALTER TABLE "DB2ADMIN"."TEST_KEYS" 
	ADD PRIMARY KEY
		("NAME");


------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."TEST_PRIMARY_KEYS"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."TEST_PRIMARY_KEYS"  (
		  "ID" INTEGER NOT NULL )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "DB2ADMIN"."TEST_PRIMARY_KEYS"

ALTER TABLE "DB2ADMIN"."TEST_PRIMARY_KEYS" 
	ADD PRIMARY KEY
		("ID");


------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."TEST_FOREIGN_KEYS"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."TEST_FOREIGN_KEYS"  (
		  "IDF" INTEGER NOT NULL )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."DATETEST"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."DATETEST"  (
		  "ID" INTEGER , 
		  "MYDATE" DATE )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."NUMERICLITERAL"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."NUMERICLITERAL"  (
		  "ID" INTEGER , 
		  "DATA" VARCHAR(50 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."FTEST"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."FTEST"  (
		  "TEST" INTEGER , 
		  "test" INTEGER , 
		  "Test" INTEGER )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."PICTURES"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."PICTURES"  (
		  "ID" INTEGER , 
		  "PICTURE" BLOB(1048576) LOGGED NOT COMPACT )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."SPTB"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."SPTB"  (
		  "C1" INTEGER , 
		  "C2" DOUBLE , 
		  "C3" VARCHAR(10 OCTETS) , 
		  "C4" BIGINT , 
		  "C5" CLOB(1048576 OCTETS) LOGGED NOT COMPACT )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."FETCH_TEST"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."FETCH_TEST"  (
		  "COL1" VARCHAR(20 OCTETS) , 
		  "COL2" CLOB(20 OCTETS) LOGGED NOT COMPACT , 
		  "COL3" INTEGER )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."TEST_195"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."TEST_195"  (
		  "ID" INTEGER , 
		  "DATA" XML )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."XML_TEST"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."XML_TEST"  (
		  "ID" INTEGER , 
		  "DATA" VARCHAR(50 OCTETS) , 
		  "XMLCOL" XML )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."INDEX_TEST"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."INDEX_TEST"  (
		  "ID" INTEGER , 
		  "DATA" VARCHAR(50 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 






-- DDL Statements for Indexes on Table "DB2ADMIN"."INDEX_TEST"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE UNIQUE INDEX "DB2ADMIN"."INDEX1" ON "DB2ADMIN"."INDEX_TEST" 
		("ID" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."INDEX_TEST2"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."INDEX_TEST2"  (
		  "ID" INTEGER , 
		  "DATA" VARCHAR(50 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 






-- DDL Statements for Indexes on Table "DB2ADMIN"."INDEX_TEST2"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "DB2ADMIN"."INDEX2" ON "DB2ADMIN"."INDEX_TEST2" 
		("DATA" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."TAB_BIGINT"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."TAB_BIGINT"  (
		  "COL1" BIGINT , 
		  "COL2" BIGINT , 
		  "COL3" BIGINT , 
		  "COL4" BIGINT )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."TEST"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."TEST"  (
		  "ID" INTEGER , 
		  "NAME" VARCHAR(10 OCTETS) , 
		  "CLOB_COL" CLOB(1048576 OCTETS) LOGGED NOT COMPACT , 
		  "SOME_VAR" XML )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."TAB_NUM_LITERALS"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."TAB_NUM_LITERALS"  (
		  "COL1" INTEGER , 
		  "COL2" DOUBLE , 
		  "COL3" DECIMAL(7,2) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."TEST_STORED"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."TEST_STORED"  (
		  "ID" INTEGER , 
		  "NAME" VARCHAR(50 OCTETS) , 
		  "AGE" INTEGER , 
		  "CV" VARCHAR(200 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."TABLE_6755"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."TABLE_6755"  (
		  "COL1" VARCHAR(20 OCTETS) , 
		  "COL2" CLOB(20 OCTETS) LOGGED NOT COMPACT )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."TABLE_6792"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."TABLE_6792"  (
		  "COL1" TIME , 
		  "COL2" DATE , 
		  "COL3" TIMESTAMP , 
		  "COL4" TIMESTAMP )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."TAB_DATETIME"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."TAB_DATETIME"  (
		  "COL1" TIME , 
		  "COL2" DATE , 
		  "COL3" TIMESTAMP )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."STOCKPRICE"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."STOCKPRICE"  (
		  "ID" SMALLINT NOT NULL , 
		  "COMPANY" VARCHAR(30 OCTETS) , 
		  "STOCKSHARE" DECIMAL(7,2) , 
		  "STOCKPRICE" DECFLOAT(16) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."STOCKSHARE"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."STOCKSHARE"  (
		  "ID" SMALLINT NOT NULL , 
		  "COMPANY" VARCHAR(30 OCTETS) , 
		  "STOCKSHARE" DECIMAL(7,2) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."TABMANY"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."TABMANY"  (
		  "ID" SMALLINT NOT NULL , 
		  "NAME" VARCHAR(32 OCTETS) )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."WITH_CLOB"
------------------------------------------------
 

CREATE TABLE "DB2ADMIN"."WITH_CLOB"  (
		  "ID" SMALLINT NOT NULL , 
		  "CLOB_COL" CLOB(1024 OCTETS) LOGGED NOT COMPACT )   
		 IN "USERSPACE1"  
		 ORGANIZE BY ROW; 





-- DDL Statements for Foreign Keys on Table "CRAIG   "."DEPARTMENT"

ALTER TABLE "CRAIG   "."DEPARTMENT" 
	ADD CONSTRAINT "RDE" FOREIGN KEY
		("MGRNO")
	REFERENCES "CRAIG   "."EMPLOYEE"
		("EMPNO")
	ON DELETE SET NULL
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "CRAIG   "."DEPARTMENT" 
	ADD CONSTRAINT "ROD" FOREIGN KEY
		("ADMRDEPT")
	REFERENCES "CRAIG   "."DEPARTMENT"
		("DEPTNO")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for Foreign Keys on Table "CRAIG   "."EMPLOYEE"

ALTER TABLE "CRAIG   "."EMPLOYEE" 
	ADD CONSTRAINT "RED" FOREIGN KEY
		("WORKDEPT")
	REFERENCES "CRAIG   "."DEPARTMENT"
		("DEPTNO")
	ON DELETE SET NULL
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for Check Constraints on Table "CRAIG   "."EMPLOYEE"

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';

ALTER TABLE "CRAIG   "."EMPLOYEE" 
	ADD CONSTRAINT "NUMBER" CHECK 
		(PHONENO >= '0000' AND PHONENO <= '9999')
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for Foreign Keys on Table "CRAIG   "."EMP_PHOTO"

ALTER TABLE "CRAIG   "."EMP_PHOTO" 
	ADD CONSTRAINT "FK_EMP_PHOTO" FOREIGN KEY
		("EMPNO")
	REFERENCES "CRAIG   "."EMPLOYEE"
		("EMPNO")
	ON DELETE RESTRICT
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for Foreign Keys on Table "CRAIG   "."EMP_RESUME"

ALTER TABLE "CRAIG   "."EMP_RESUME" 
	ADD CONSTRAINT "FK_EMP_RESUME" FOREIGN KEY
		("EMPNO")
	REFERENCES "CRAIG   "."EMPLOYEE"
		("EMPNO")
	ON DELETE RESTRICT
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for Foreign Keys on Table "CRAIG   "."PROJECT"

ALTER TABLE "CRAIG   "."PROJECT" 
	ADD CONSTRAINT "FK_PROJECT_1" FOREIGN KEY
		("DEPTNO")
	REFERENCES "CRAIG   "."DEPARTMENT"
		("DEPTNO")
	ON DELETE RESTRICT
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "CRAIG   "."PROJECT" 
	ADD CONSTRAINT "FK_PROJECT_2" FOREIGN KEY
		("RESPEMP")
	REFERENCES "CRAIG   "."EMPLOYEE"
		("EMPNO")
	ON DELETE RESTRICT
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

ALTER TABLE "CRAIG   "."PROJECT" 
	ADD CONSTRAINT "RPP" FOREIGN KEY
		("MAJPROJ")
	REFERENCES "CRAIG   "."PROJECT"
		("PROJNO")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for Foreign Keys on Table "CRAIG   "."PROJACT"

ALTER TABLE "CRAIG   "."PROJACT" 
	ADD CONSTRAINT "RPAP" FOREIGN KEY
		("PROJNO")
	REFERENCES "CRAIG   "."PROJECT"
		("PROJNO")
	ON DELETE RESTRICT
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for Foreign Keys on Table "CRAIG   "."EMPPROJACT"

ALTER TABLE "CRAIG   "."EMPPROJACT" 
	ADD CONSTRAINT "REPAPA" FOREIGN KEY
		("PROJNO",
		 "ACTNO",
		 "EMSTDATE")
	REFERENCES "CRAIG   "."PROJACT"
		("PROJNO",
		 "ACTNO",
		 "ACSTDATE")
	ON DELETE RESTRICT
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for Foreign Keys on Table "CRAIG   "."ACT"

ALTER TABLE "CRAIG   "."ACT" 
	ADD CONSTRAINT "RPAA" FOREIGN KEY
		("ACTNO")
	REFERENCES "CRAIG   "."ACT"
		("ACTNO")
	ON DELETE RESTRICT
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for Foreign Keys on Table "CRAIG   "."PURCHASEORDER"

ALTER TABLE "CRAIG   "."PURCHASEORDER" 
	ADD CONSTRAINT "FK_PO_CUST" FOREIGN KEY
		("CUSTID")
	REFERENCES "CRAIG   "."CUSTOMER"
		("CID")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for Foreign Keys on Table "DB2ADMIN"."TEST_FOREIGN_KEYS"

ALTER TABLE "DB2ADMIN"."TEST_FOREIGN_KEYS" 
	ADD CONSTRAINT "SQL170509204604450" FOREIGN KEY
		("IDF")
	REFERENCES "DB2ADMIN"."TEST_PRIMARY_KEYS"
		("ID")
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;






---------------------------------
-- DDL Statements for User Defined Functions
---------------------------------


SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";

CREATE FUNCTION resign_employee (number CHAR(6))
  RETURNS TABLE (empno  CHAR(6),
                 salary DOUBLE,
                 dept   CHAR(3))
  MODIFIES SQL DATA
  LANGUAGE SQL
  BEGIN ATOMIC
-- -------------------------------------------------------------------------------------
-- Routine type:  SQL table function
-- Routine name:  resign_employee
--
-- Purpose:  This procedure takes in an employee number, then removes that
--           employee from the EMPLOYEE table.
--           A useful extension to this function would be to archive the
--           original record into an archive table.
--
-- --------------------------------------------------------------------------------------
    DECLARE l_salary DOUBLE;--
    DECLARE l_job CHAR(3);--

    SET (l_salary, l_job) = (SELECT salary, job
                               FROM OLD TABLE (DELETE FROM employee
                                                WHERE employee.empno = number));--

    RETURN VALUES (number,l_salary, l_job);--
  END
;


----------------------------

-- DDL Statements for Views

----------------------------
SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VDEPT      AS SELECT ALL DEPTNO,   DEPTNAME,   MGRNO,   ADMRDEPT
  FROM DEPT;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VHDEPT    AS SELECT ALL DEPTNO ,   DEPTNAME,   MGRNO ,   ADMRDEPT,
  LOCATION   FROM DEPT;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VEMP    AS SELECT ALL EMPNO ,   FIRSTNME,   MIDINIT ,   LASTNAME,
  WORKDEPT   FROM EMP;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VPROJ    AS SELECT ALL PROJNO, PROJNAME, DEPTNO, RESPEMP, PRSTAFF,
PRSTDATE, PRENDATE, MAJPROJ FROM PROJ;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VACT AS SELECT ALL ACTNO ,   ACTKWD ,   ACTDESC FROM ACT;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VPROJACT    AS SELECT ALL PROJNO,ACTNO, ACSTAFF, ACSTDATE, ACENDATE
FROM PROJACT;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VEMPPROJACT AS SELECT ALL EMPNO, PROJNO, ACTNO, EMPTIME, EMSTDATE,
EMENDATE FROM EMPPROJACT;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VDEPMG1 (DEPTNO, DEPTNAME, MGRNO, FIRSTNME, MIDINIT,   LASTNAME,
ADMRDEPT) AS SELECT ALL DEPTNO, DEPTNAME, EMPNO, FIRSTNME, MIDINIT,   LASTNAME,
ADMRDEPT FROM DEPT LEFT OUTER  JOIN EMP ON MGRNO = EMPNO;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VEMPDPT1 (DEPTNO, DEPTNAME, EMPNO, FRSTINIT, MIDINIT,   LASTNAME,
WORKDEPT) AS SELECT ALL DEPTNO, DEPTNAME, EMPNO, SUBSTR(FIRSTNME, 1, 1),
MIDINIT,   LASTNAME, WORKDEPT FROM DEPT  RIGHT OUTER JOIN EMP ON WORKDEPT
= DEPTNO;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VASTRDE1   (DEPT1NO,DEPT1NAM,EMP1NO,EMP1FN,EMP1MI,EMP1LN,TYPE2,
  DEPT2NO,DEPT2NAM,EMP2NO,EMP2FN,EMP2MI,EMP2LN) AS SELECT ALL   D1.DEPTNO,D1.DEPTNAME,D1.MGRNO,D1.FIRSTNME,D1.MIDINIT,
  D1.LASTNAME, '1',   D2.DEPTNO,D2.DEPTNAME,D2.MGRNO,D2.FIRSTNME,D2.MIDINIT,
  D2.LASTNAME FROM VDEPMG1 D1, VDEPMG1 D2 WHERE D1.DEPTNO = D2.ADMRDEPT;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VASTRDE2   (DEPT1NO,DEPT1NAM,EMP1NO,EMP1FN,EMP1MI,EMP1LN,TYPE2,
  DEPT2NO,DEPT2NAM,EMP2NO,EMP2FN,EMP2MI,EMP2LN) AS SELECT ALL   D1.DEPTNO,D1.DEPTNAME,D1.MGRNO,D1.FIRSTNME,D1.MIDINIT,
  D1.LASTNAME,'2',   D1.DEPTNO,D1.DEPTNAME,E2.EMPNO,E2.FIRSTNME,E2.MIDINIT,
  E2.LASTNAME FROM VDEPMG1 D1, EMP E2 WHERE D1.DEPTNO = E2.WORKDEPT;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VPROJRE1   (PROJNO,PROJNAME,PROJDEP,RESPEMP,FIRSTNME,MIDINIT,
  LASTNAME,MAJPROJ) AS SELECT ALL   PROJNO,PROJNAME,DEPTNO,EMPNO,FIRSTNME,MIDINIT,
  LASTNAME,MAJPROJ FROM PROJ, EMP WHERE RESPEMP = EMPNO;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VPSTRDE1   (PROJ1NO,PROJ1NAME,RESP1NO,RESP1FN,RESP1MI,RESP1LN,
  PROJ2NO,PROJ2NAME,RESP2NO,RESP2FN,RESP2MI,RESP2LN) AS SELECT ALL   P1.PROJNO,P1.PROJNAME,P1.RESPEMP,P1.FIRSTNME,P1.MIDINIT,
  P1.LASTNAME,   P2.PROJNO,P2.PROJNAME,P2.RESPEMP,P2.FIRSTNME,P2.MIDINIT,
  P2.LASTNAME FROM VPROJRE1 P1,   VPROJRE1 P2 WHERE P1.PROJNO = P2.MAJPROJ;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VPSTRDE2   (PROJ1NO,PROJ1NAME,RESP1NO,RESP1FN,RESP1MI,RESP1LN,
  PROJ2NO,PROJ2NAME,RESP2NO,RESP2FN,RESP2MI,RESP2LN) AS SELECT ALL   P1.PROJNO,P1.PROJNAME,P1.RESPEMP,P1.FIRSTNME,P1.MIDINIT,
  P1.LASTNAME,   P1.PROJNO,P1.PROJNAME,P1.RESPEMP,P1.FIRSTNME,P1.MIDINIT,
  P1.LASTNAME FROM VPROJRE1 P1 WHERE NOT EXISTS (SELECT * FROM VPROJRE1
P2 WHERE P1.PROJNO = P2.MAJPROJ);

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VFORPLA   (PROJNO,PROJNAME,RESPEMP,PROJDEP,FRSTINIT,MIDINIT,LASTNAME)
AS SELECT ALL F1.PROJNO,PROJNAME,RESPEMP,PROJDEP, SUBSTR(FIRSTNME, 1, 1),
  MIDINIT, LASTNAME FROM VPROJRE1 F1 LEFT OUTER JOIN EMPPROJACT F2 ON F1.PROJNO
= F2.PROJNO;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VSTAFAC1(PROJNO, ACTNO, ACTDESC, EMPNO, FIRSTNME, MIDINIT, 
    LASTNAME, EMPTIME,STDATE,ENDATE, TYPE) AS SELECT ALL PA.PROJNO, PA.ACTNO,
AC.ACTDESC,' ', ' ', ' ', ' ',   PA.ACSTAFF, PA.ACSTDATE,   PA.ACENDATE,'1'
FROM PROJACT PA, ACT AC  WHERE PA.ACTNO = AC.ACTNO;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VSTAFAC2 (PROJNO, ACTNO, ACTDESC, EMPNO, FIRSTNME, MIDINIT,
LASTNAME, EMPTIME,STDATE, ENDATE, TYPE) AS SELECT ALL EP.PROJNO, EP.ACTNO,
AC.ACTDESC, EP.EMPNO,EM.FIRSTNME, EM.MIDINIT, EM.LASTNAME, EP.EMPTIME,
EP.EMSTDATE,   EP.EMENDATE,'2' FROM EMPPROJACT EP, ACT AC, EMP EM WHERE
EP.ACTNO = AC.ACTNO AND EP.EMPNO = EM.EMPNO;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VPHONE   (LASTNAME,   FIRSTNAME,   MIDDLEINITIAL,   PHONENUMBER,
  EMPLOYEENUMBER,   DEPTNUMBER,   DEPTNAME) AS SELECT ALL LASTNAME,   FIRSTNME,
  MIDINIT ,   VALUE(PHONENO,' '),   EMPNO,   DEPTNO,   DEPTNAME FROM EMP,
DEPT WHERE WORKDEPT = DEPTNO;

SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE VIEW VEMPLP   (EMPLOYEENUMBER,   PHONENUMBER) AS SELECT ALL EMPNO
,   PHONENO FROM EMP;

SET CURRENT SCHEMA = "DB2ADMIN";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";
CREATE VIEW anime_cat AS
      SELECT name, breed FROM animals
      WHERE id = 0;



-- DDL Statements for Aliases

CREATE ALIAS "CRAIG   "."DEPT" FOR TABLE "CRAIG   "."DEPARTMENT";

CREATE ALIAS "CRAIG   "."EMP" FOR TABLE "CRAIG   "."EMPLOYEE";

CREATE ALIAS "CRAIG   "."EMPACT" FOR TABLE "CRAIG   "."EMPPROJACT";

CREATE ALIAS "CRAIG   "."EMP_ACT" FOR TABLE "CRAIG   "."EMPPROJACT";

CREATE ALIAS "CRAIG   "."PROJ" FOR TABLE "CRAIG   "."PROJECT";


---------------------------------
-- DDL Statements for Stored Procedures
---------------------------------


SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";

CREATE PROCEDURE bonus_increase                            (IN p_bonusFactor
DECIMAL (3,2),                              IN p_bonusMaxSumForDept DECIMAL
(9,2),                              OUT p_deptsWithoutNewBonuses VARCHAR(255),
                             OUT p_countDeptsViewed INTEGER,          
                   OUT p_countDeptsBonusChanged INTEGER,              
               OUT p_errorMsg VARCHAR(255)) SPECIFIC BONUS_INCREASE
LANGUAGE SQL
DYNAMIC RESULT SETS 1

BEGIN
-- -------------------------------------------------------------------------------------
-- Routine type:  SQL stored procedure
-- Routine name:  bonus_increase
--
-- Purpose:  This procedure takes in a multiplier value that is used to update
--           employee bonus values.  The employee bonus updates are done department
--           by department.  Updated employee bonus values are only committed if the
--           sum of the bonuses for a department does not exceed the threshold amount
--           specified by another input parameter.  A result is returned listing, by
--           department, employee numbers and currently set bonus values.
--
-- Features shown:
--           - IN and OUT parameters
--           - Variable declaration and setting
--           - Condition handler declaration and use
--           - Use of CURSOR WITH HOLD
--           - Use of SAVEPOINT and ROLLBACK to SAVEPOINT
--           - Returning of a result set to the caller
--           - Use of a WHILE loop control-statement
--           - Use of IF/ELSE statement
--           - Use of labels and GOTO statement
--           - Use of RETURN statement
--
-- Parameters:
-- IN  p_bonusFactor:      Constant multiple by which employee bonuses are updated
-- IN  p_bonusMaxSumForDept:    Maximum amount for departmental bonuses without review
-- OUT p_deptsWithoutNewBonuses:  Comma delimited list of departments that require
--                                   a manual setting and review of bonus amounts
-- OUT p_countDeptsViewed:     Number of departments processed
-- OUT p_countDeptsBonusChanged:  Number of departments for which bonuses were set
-- OUT p_errorMsg:       Error message string
-- --------------------------------------------------------------------------------------
    DECLARE v_dept, v_actdept CHAR(3);--
    DECLARE v_bonus, v_deptbonus, v_newbonus DECIMAL(9,2);--
    DECLARE v_empno CHAR(6);--
    DECLARE v_atend SMALLINT DEFAULT 0;--

    -- Cursor that lists employee numbers and bonuses ordered by department
    -- This cursor is declared as WITH HOLD so that on rollbacks it remains
    -- open.  It is declared as FOR UPDATE OF bonus, so that the employee
    -- bonus column field can be updated as the cursor iterates through the rows.

    DECLARE cSales CURSOR WITH HOLD FOR
          SELECT workdept, bonus, empno FROM employee ORDER BY workdept
      FOR UPDATE OF bonus;--

    -- This cursor, declared with WITH RETURN TO CALLER, is used to return
    -- a result set to the caller when this procedure returns.  The result
    -- set contains a list of the employees and their bonus values ordered
    -- by the department numbers.

    DECLARE cEmpBonuses CURSOR WITH RETURN TO CALLER FOR
          SELECT workdept, empno, bonus FROM employee ORDER BY workdept;--

    -- This continue handler is used to catch the NOT FOUND error
    -- associated with the end of the iteration over the cursor cSales.
    -- It is used to set v_atend which flags the end of the WHILE loop.

     DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_atend=1;--

    -- This continue handler is used to catch any numeric overflows

    DECLARE EXIT HANDLER FOR SQLSTATE '22003'
    BEGIN
      SET p_errorMsg = 'SQLSTATE 22003 - Numeric overflow occurred setting bonus';--
    END;--

    DECLARE EXIT HANDLER FOR SQLEXCEPTION SET v_atend=1;--

    -- Initialize local variables

    SET p_errorMsg = '';--
    SET p_deptsWithoutNewBonuses = '';--
    SET p_countDeptsViewed = 0;--
    SET p_countDeptsBonusChanged = 0;--

    -- Check input parameter is valid

    IF (p_bonusFactor < 1 OR p_bonusFactor > 2) THEN
      SET p_errorMsg = 'E01 Checking parameter p_bonusFactor, validation';--
      GOTO error_found;--
    END IF;--

    OPEN cSales;--

    FETCH cSales INTO v_dept, v_bonus, v_empno;--

    nextdept:
        IF v_atend = 0 THEN

            -- This savepoint is used to rollback the bonuses assigned to employees if
            -- the sum of bonuses for a department exceeds a threshold amount

            SAVEPOINT svpt_bonus ON ROLLBACK RETAIN CURSORS;--

            SET v_actdept = v_dept;--
            SET v_deptbonus = 0;--

            WHILE ( v_actdept = v_dept ) AND ( v_atend = 0 ) DO
                    SET v_newbonus = v_bonus * p_bonusFactor;--
                    UPDATE employee SET bonus = v_newbonus WHERE empno = v_empno;--
                    SET v_deptbonus = v_deptbonus + v_newbonus;--
                    FETCH cSales INTO v_dept, v_bonus, v_empno;--
            END WHILE;--

            SET p_countDeptsViewed = p_countDeptsViewed + 1;--

            IF v_deptbonus <= p_bonusMaxSumForDept THEN
                SET p_countDeptsBonusChanged = p_countDeptsBonusChanged + 1;--
                COMMIT;--
            ELSE
                     ROLLBACK TO SAVEPOINT svpt_bonus;--
                     RELEASE SAVEPOINT svpt_bonus;--
                     SET p_deptsWithoutNewBonuses =
                                     (CASE WHEN p_deptsWithoutNewBonuses = ''
                                           THEN v_actdept
                                      ELSE
                                           p_deptsWithoutNewBonuses || ', ' || v_actdept
                                      END);--
            END IF;--
            GOTO nextdept;--
        END IF;--

    OPEN cEmpBonuses;--

    RETURN 0;--

error_found:
    SET p_errorMsg = p_errorMsg || ' failed.';--
    RETURN -1;--

END;

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
SET CURRENT SCHEMA = "DB2ADMIN";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";


      CREATE PROCEDURE match_animal(IN first_name VARCHAR(128), INOUT second_name VARCHAR(128), OUT animal_weight DOUBLE)
      DYNAMIC RESULT SETS 1
      LANGUAGE SQL
      BEGIN
       DECLARE match_name INT DEFAULT 0;--
       DECLARE c1 CURSOR FOR
        SELECT COUNT(*) FROM animals
        WHERE name IN (second_name);--

       DECLARE c2 CURSOR FOR
        SELECT SUM(weight) FROM animals
        WHERE name in (first_name, second_name);--

       DECLARE c3 CURSOR WITH RETURN FOR
        SELECT name, breed, weight FROM animals
        WHERE name BETWEEN first_name AND second_name
        ORDER BY name;--

       OPEN c1;--
       FETCH c1 INTO match_name;--
       IF (match_name > 0)
        THEN SET second_name = 'TRUE';--
       END IF;--
       CLOSE c1;--

       OPEN c2;--
       FETCH c2 INTO animal_weight;--
       CLOSE c2;--

       OPEN c3;--
      END;

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
SET CURRENT SCHEMA = "DB2ADMIN";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE sp(OUT out1 INTEGER, OUT out2 FLOAT, OUT out3 VARCHAR(10),
OUT out4 BIGINT, OUT out5 CLOB)
                 DYNAMIC RESULT SETS 1 LANGUAGE SQL BEGIN
                 SELECT c1, c2, c3, c4, c5 INTO out1, out2, out3, out4, out5 FROM sptb; END;

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
SET CURRENT SCHEMA = "DB2ADMIN";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE multiResults ()
        RESULT SETS 3
        LANGUAGE SQL
        BEGIN
         DECLARE c1 CURSOR WITH RETURN FOR
          SELECT name, id
          FROM animals
          ORDER BY name;--
    
         DECLARE c2 CURSOR WITH RETURN FOR
          SELECT name, id, breed, weight
          FROM animals
          ORDER BY name DESC;--
    
         DECLARE c3 CURSOR WITH RETURN FOR
          SELECT name
          FROM animals
          ORDER BY name;--
    
         OPEN c1;--
         OPEN c2;--
         OPEN c3;--
        END;

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
SET CURRENT SCHEMA = "DB2ADMIN";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE processint(OUT risorsa int) LANGUAGE SQL BEGIN SELECT age
INTO risorsa FROM test_stored WHERE ID = 1; END;

SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
SET CURRENT SCHEMA = "DB2ADMIN";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","DB2ADMIN";

CREATE PROCEDURE processvar(OUT risorsa varchar(50)) LANGUAGE SQL BEGIN
SELECT name INTO risorsa FROM test_stored WHERE ID = 1; END;

-------------------------------
-- DDL Statements for Triggers
-------------------------------


SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE TRIGGER do_not_del_sales NO CASCADE BEFORE DELETE ON staff REFERENCING
OLD AS oldstaff FOR EACH ROW MODE DB2SQL WHEN(oldstaff.job = 'Sales') BEGIN
ATOMIC SIGNAL SQLSTATE '75000' ('Sales staff cannot be deleted... see the DO_NOT_DEL_SALES trigger.');
END;


SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
SET CURRENT SCHEMA = "CRAIG   ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","CRAIG";
CREATE TRIGGER min_salary NO CASCADE BEFORE INSERT ON staff REFERENCING
NEW AS newstaff FOR EACH ROW MODE DB2SQL BEGIN ATOMIC SET newstaff.salary
= CASE WHEN newstaff.job = 'Mgr' AND newstaff.salary < 17000.00 THEN 17000.00
WHEN newstaff.job = 'Sales' AND newstaff.salary < 14000.00 THEN 14000.00
WHEN newstaff.job = 'Clerk' AND newstaff.salary < 10000.00 THEN 10000.00
ELSE newstaff.salary END; END;


COMMIT WORK;

CONNECT RESET;

TERMINATE;

