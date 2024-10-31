--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- PostgreSQL Vacuum and Analyze info
--
-- Requires PostgreSQL 9.4+ (see postgres_last_vacuum_analyze_pre94.sql for earlier versions)
--
-- Tested on PostgreSQL 9.4+, 10.x, 11.x, 12.x, 13.0

SELECT
    schemaname,
    relname,
    n_live_tup,
    n_dead_tup,
    n_dead_tup / GREATEST(n_live_tup + n_dead_tup, 1)::float * 100 AS dead_percentage,
    n_mod_since_analyze,
    last_vacuum,
    last_autovacuum,
    last_analyze,
    last_autoanalyze,
    vacuum_count,
    autovacuum_count,
    analyze_count,
    autoanalyze_count
FROM
    pg_stat_user_tables
ORDER BY
    n_dead_tup DESC,
    n_mod_since_analyze DESC,
    last_vacuum DESC,
    last_analyze DESC,
    last_autovacuum DESC,
    last_autoanalyze DESC;
