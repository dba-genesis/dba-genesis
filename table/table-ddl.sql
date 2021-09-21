/* this script will generate CREATE TABLE DDL command */

set long 100000
set pagesize 0 ;
set linesize 1000; 
set feedback off ;
set verify off ;
set trimspool on;

/* this will only print the create table with respective tablespace details only */
BEGIN
DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SQLTERMINATOR', true);
DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'PRETTY', true);
DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SEGMENT_ATTRIBUTES', true);
DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'STORAGE', false);
END;
/

/* ask user to input table name and owner */
ACCEPT table_name CHAR PROMPT 'Enter the table name > '
ACCEPT schema_name CHAR PROMPT 'Enter table schema (owner) name > '

/* print the DDL command */
SELECT DBMS_METADATA.get_ddl ('TABLE', upper('&table_name'),upper('&schema_name')) from dual;
