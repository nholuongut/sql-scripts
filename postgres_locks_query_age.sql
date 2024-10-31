--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- PostgreSQL locks with query and age
--
-- Requires PostgreSQL 9.2+
--
-- Tested on PostgreSQL 9.2+, 10.x, 11.x, 12.x, 13.0

-- https://wiki.postgresql.org/wiki/Lock_Monitoring

SELECT
    a.datname,
    l.relation::regclass,
    l.transactionid,
    l.mode,
    l.GRANTED,
    a.usename,
    a.query,
    a.query_start,
    age(now(), a.query_start) AS "age",
    a.pid
FROM
    pg_stat_activity a
JOIN
    pg_locks l
ON
    l.pid = a.pid
ORDER BY
    a.query_start;
