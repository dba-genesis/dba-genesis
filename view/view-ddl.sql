/* this script will generate CREATE VIEW statement for a specific view */

set long 100000
set pagesize 0 ;
set linesize 1000; 
set feedback off ;
set verify off ;
set trimspool on;

/* ask user to input table name and owner */
ACCEPT view_name CHAR PROMPT 'Enter the view name > '
ACCEPT schema_name CHAR PROMPT 'Enter view schema (owner) name > '

/* print the DDL command */
SELECT DBMS_METADATA.get_ddl ('VIEW', upper('&view_name'),upper('&schema_name')) from dual;
