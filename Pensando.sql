select * from v$parameter p where UPPER(p.NAME) like '%LOCK%'
select * from v$parameter p where UPPER(p.NAME) like '%TIME%'
alter system set ddl_lock_timeout=60


SELECT * FROM SISTEMA FOR UPDATE WAIT 1
