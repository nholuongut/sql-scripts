--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- Running queries for PostgreSQL >= 9.2
--
-- Requires PostgreSQL 9.2+
--
-- Tested on PostgreSQL 9.2+, 10.x, 11.x, 12.x, 13.0

SELECT
    pid,
    age(clock_timestamp(), query_start),
    usename,
    application_name,
    query
FROM
    pg_stat_activity
WHERE
    state != 'idle'
      AND
    query NOT ILIKE '%pg_stat_activity%'
ORDER BY
    query_start DESC;
