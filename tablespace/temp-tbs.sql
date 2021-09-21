/* All the temp tablespace related queries are kept here */

/* Check temp tablespace size */
set lines 200
select TABLESPACE_NAME, sum(BYTES_USED/1024/1024),sum(BYTES_FREE/1024/1024) 
from V$TEMP_SPACE_HEADER group by TABLESPACE_NAME;

/* check temp tablespace utilization (%) */
select (s.tot_used_blocks/f.total_blocks)*100 as "percent used"
from (select sum(used_blocks) tot_used_blocks
from v$sort_segment where tablespace_name='TEMP') s,
(select sum(blocks) total_blocks
from dba_temp_files where tablespace_name='TEMP') f;

/* find top 10 sessions using high temp tablespace */
cursor bigtemp_sids is
select * from (
select s.sid,
s.status,
s.sql_hash_value sesshash,
u.SQLHASH sorthash,
s.username,
u.tablespace,
sum(u.blocks*p.value/1024/1024) mbused ,
sum(u.extents) noexts,
nvl(s.module,s.program) proginfo,
floor(last_call_et/3600)||':'||
floor(mod(last_call_et,3600)/60)||':'||
mod(mod(last_call_et,3600),60) lastcallet
from v$sort_usage u,
v$session s,
v$parameter p
where u.session_addr = s.saddr
and p.name = 'db_block_size'
group by s.sid,s.status,s.sql_hash_value,u.sqlhash,s.username,u.tablespace,
nvl(s.module,s.program),
floor(last_call_et/3600)||':'||
floor(mod(last_call_et,3600)/60)||':'||
mod(mod(last_call_et,3600),60)
order by 7 desc,3)
where rownum < 11;
