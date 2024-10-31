--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- Running queries for PostgreSQL <= 9.1
--
-- Requires PostgreSQL <= 9.1
--
-- Tested on PostgreSQL 8.4, 9.0, 9.1

SELECT
    procpid,
    age(clock_timestamp(), query_start),
    usename,
    current_query
FROM
    pg_stat_activity
WHERE
    current_query != '<IDLE>'
      AND
    current_query NOT ILIKE '%pg_stat_activity%'
ORDER BY
    query_start DESC;
