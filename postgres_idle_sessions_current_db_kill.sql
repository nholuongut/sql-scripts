--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- Kills idle PostgreSQL sessions for the currently select DB that haven't been used in > 15 minutes
--
-- Requires PostgreSQL 9.2+
--
-- Tested on PostgreSQL 9.2+, 10.x, 11.x, 12.x, 13.0

SELECT
    pg_terminate_backend(pid)
FROM
    pg_stat_activity
WHERE
    -- don't kill yourself
    pid <> pg_backend_pid()
    --  AND
    -- don't kill your admin tools
    --application_name !~ '(?:psql)|(?:pgAdmin.+)'
    --  AND
    --usename not in ('postgres')
        AND
    datname = current_database()
        AND
    query in ('')
        AND
    state in ('idle', 'idle in transaction', 'idle in transaction (aborted)', 'disabled')
        AND
    --state_change < current_timestamp - INTERVAL '15' MINUTE;
    (
      (current_timestamp - query_start) > interval '15 minutes'
          OR
      (query_start IS NULL AND (current_timestamp - backend_start) > interval '15 minutes')
    )
;
