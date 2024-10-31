--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- PostgreSQL locks with query and age for PostgreSQL <= 9.1
--
-- Requires PostgreSQL <= 9.1 (for newer versions see postgres_locks_query_age.sql)
--
-- Tested on PostgreSQL 8.4, 9.0, 9.1

-- https://wiki.postgresql.org/wiki/Lock_Monitoring

SELECT
    a.datname,
    c.relname,
    l.transactionid,
    l.mode,
    l.granted,
    a.usename,
    a.current_query,
    a.query_start,
    age(now(), a.query_start) as "age",
    a.procpid
FROM
    pg_stat_activity a
JOIN
    pg_locks l
ON
    l.pid = a.procpid
JOIN
    pg_class c
ON
    c.oid = l.relation
ORDER BY
    a.query_start;
