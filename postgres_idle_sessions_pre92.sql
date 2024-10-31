--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- List PostgreSQL stale connections that have been idle > 10 mins
--
-- Can be used to kill connections using the procpids returned, eg.
--
-- SELECT pg_terminate_backend(procpid)
--
-- Requires PostgreSQL <= 9.1
--
-- Tested on PostgreSQL 8.4, 9.0, 9.1

SELECT
    rank() over (partition by client_addr order by backend_start ASC) as rank,
    procpid,
    backend_start,
    query_start,
    waiting,
    datname,
    usename,
    client_addr
FROM
    pg_stat_activity
WHERE
    -- don't kill yourself
    procpid <> pg_backend_pid()
    --  AND
    -- don't kill your admin tools
    --application_name !~ '(?:psql)|(?:pgAdmin.+)'
    --  AND
    --usename not in ('postgres')
        AND
    current_query in ('')
        AND
    (
      (current_timestamp - query_start) > interval '10 minutes'
          OR
      (query_start IS NULL AND (current_timestamp - backend_start) > interval '10 minutes')
    )
;
