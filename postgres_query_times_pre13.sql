--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- PostgreSQL query times from pg_stat_statements
--
-- Requires 9.5 <= PostgreSQL <= 12
--
-- Tested on PostgreSQL 9.5+, 10.x, 11.x, 12.x

-- postgresql.conf needs before start:
-- shared_preload_libraries = 'pg_stat_statements'
--
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

SELECT
    calls,
    rows,
    ROUND((total_time::numeric / 1000), 4) AS total_secs,
    -- newer versions of PostgreSQL have mean_time field, don't need to calculate
    --ROUND((total_time / 1000 / calls)::numeric, 4) AS average_secs,
    ROUND(mean_time::numeric / 1000, 4) AS average_secs,
    ROUND(min_time::numeric / 1000, 4) AS min_secs,
    ROUND(max_time::numeric / 1000, 4) AS max_secs,
    ROUND(stddev_time::numeric / 1000, 4) AS stddev_secs,
    query
FROM
    pg_stat_statements
ORDER BY
    average_secs DESC,
    calls DESC,
    rows DESC
LIMIT 100;
