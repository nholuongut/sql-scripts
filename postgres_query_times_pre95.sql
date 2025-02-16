--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- PostgreSQL query times from pg_stat_statements for PostgreSQL <= 9.4
--
-- Also works on later versions up to PostgreSQL 12, but primarily written to be able to be able to query earlier PostgreSQL versions
--
-- For PostgreSQL >= 9.5 recommend postgres_query_times_pre13.sql instead which returns more available information
--
-- Requires 9.1 <= PostgreSQL <= 12
--
-- Tested on PostgreSQL 9.1+, 10.x, 11.x, 12.x, 13.0

-- postgresql.conf needs before start:
-- shared_preload_libraries = 'pg_stat_statements'
--
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

SELECT
    calls,
    rows,
    ROUND(total_time::numeric / 1000, 4) AS total_secs,
    -- newer versions of PostgreSQL have mean_time field, but we have to calculate on PostgreSQL <= 9.4
    ROUND(total_time::numeric / 1000 / GREATEST(calls, 1), 4) AS average_secs,
    query
FROM
    pg_stat_statements
ORDER BY
    average_secs DESC,
    calls DESC,
    rows DESC
LIMIT 100;
