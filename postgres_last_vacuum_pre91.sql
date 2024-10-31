--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- PostgreSQL Vacuum info for tables with deleted rows
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0

SELECT
    schemaname,
    relname,
    n_live_tup,
    n_dead_tup,
    n_dead_tup / GREATEST(n_live_tup + n_dead_tup, 1)::float * 100 AS dead_percentage,
    last_vacuum,
    last_autovacuum
    -- not available on PostgreSQL <= 9.0
    --vacuum_count,
    --autovacuum_count
FROM pg_stat_user_tables
WHERE
    n_dead_tup > 0
ORDER BY
    n_dead_tup DESC,
    last_vacuum DESC,
    last_autovacuum DESC;
