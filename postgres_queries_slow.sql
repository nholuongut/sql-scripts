--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- PostgreSQL queries currently executing that have taken over 30 secs
--
-- a current snapshot alternative to slow query log
--
-- Requires PostgreSQL 9.6+ (see postgres_queries_slow_pre96.sql and postgres_queries_slow_pre92.sql)
--
-- Tested on PostgreSQL 9.6+, 10x, 11.x, 12.x, 13.0

SELECT
    now() - query_start as "runtime",
    usename,
    datname,
    -- not available on PostgreSQL < 9.6
    wait_event,
    -- not available on PostgreSQL < 9.2
    state,
    -- current_query on PostgreSQL < 9.2
    query
FROM
    pg_stat_activity
WHERE
    -- can't use 'runtime' here
    now() - query_start > '30 seconds'::interval
ORDER BY
    runtime DESC;
