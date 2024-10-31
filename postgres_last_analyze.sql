--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- PostgreSQL Analyze info for tables with rows modified since last analyze
--
-- Requires PostgreSQL 9.4+ (see postgres_last_analyze_pre94.sql for earlier versions)
--
-- Tested on PostgreSQL 9.4+, 10.x, 11.x, 12.x, 13.0

SELECT
    schemaname,
    relname,
    -- not available on PostgreSQL <= 9.3
    n_mod_since_analyze,
    last_analyze,
    last_autoanalyze,
    -- not available on PostgreSQL <= 9.0
    analyze_count,
    autoanalyze_count
FROM pg_stat_user_tables
ORDER BY
    n_mod_since_analyze DESC,
    last_analyze DESC,
    last_autoanalyze DESC;
