/* this script will generate CREATE TABLE DDL command */

set long 100000
set pagesize 0 ;
set linesize 1000; 
set feedback off ;
set verify off ;
set trimspool on;

ACCEPT table_name CHAR PROMPT 'Enter the table name > '
ACCEPT schema_name CHAR PROMPT 'Enter table schema (owner) name > '

SELECT DBMS_METADATA.get_ddl ('TABLE', upper('&table_name'),upper('&schema_name')) from dual;
