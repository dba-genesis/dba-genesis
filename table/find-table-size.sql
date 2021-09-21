-- This script will give you table size

/* ask user to input table name */
ACCEPT table_name CHAR PROMPT 'Enter the table name > '

select segment_name, segment_type, sum(bytes/1024/1024/1024) GB
 from dba_segments
 where segment_name='&table_name' 
group by segment_name, segment_type;
