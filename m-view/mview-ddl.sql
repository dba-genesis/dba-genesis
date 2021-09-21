/* this script will generate CREATE MATERIALIZED VIEW statement for a specific view */

set long 100000
set pagesize 0 ;
set linesize 1000; 
set feedback off ;
set verify off ;
set trimspool on;

/* ask user to input table name and owner */
ACCEPT mview_name CHAR PROMPT 'Enter the materialized view name > '
ACCEPT schema_name CHAR PROMPT 'Enter materialized view schema(owner) name > '

/* print the DDL command */
SELECT DBMS_METADATA.get_ddl ('MATERIALIZED_VIEW', upper('&mview_name'),upper('&schema_name')) from dual;
