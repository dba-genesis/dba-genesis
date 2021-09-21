/* this script will generate CREATE USER statement for a specific user */

set long 100000
set pagesize 0 ;
set linesize 1000; 
set feedback off ;
set verify off ;
set trimspool on;

/* ask user to input username */
ACCEPT user_name CHAR PROMPT 'Enter the user name > '

/* print the DDL command */
SELECT DBMS_METADATA.GET_DDL('USER',upper('&user_name')) FROM dual;
