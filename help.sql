prompt "## Welcome to DBA Genesis Scripts ##"
prompt "Current Version 1.0 published on 21-sep-21"
prompt
prompt "you are connect to"
select name, open_mode, pdb from v$database;
