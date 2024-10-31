--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- PostgreSQL tables by size, excluding catalog and information schema
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0

SELECT
    --nspname || '.' || relname AS relation,
    nspname,
    relname,
    pg_size_pretty(pg_total_relation_size(C.oid)) AS total_size
FROM
    pg_class C
LEFT JOIN
    pg_namespace N ON (N.oid = C.relnamespace)
WHERE
    nspname NOT IN ('pg_catalog', 'information_schema')
        AND
    C.relkind <> 'i'
        AND
    nspname !~ '^pg_toast'
ORDER BY
    pg_total_relation_size(C.oid) DESC;
