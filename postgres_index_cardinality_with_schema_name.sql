--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- PostgreSQL index cardinality with schema name
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x 11.x, 12.x, 13.0

SELECT
    schema_name,
    relname,
    reltuples AS "cardinality (reltuples)",
    relpages
FROM (
    SELECT
        pg_catalog.pg_namespace.nspname AS schema_name,
        relname,
        reltuples,
        relpages
    FROM
        pg_class
    JOIN
        pg_namespace ON relnamespace = pg_namespace.oid
    WHERE
        relkind = 'i'
) t
WHERE
    schema_name NOT ILIKE 'pg_%'
      AND
    schema_name <> 'information_schema'
--    AND
--  relname LIKE 'someprefix%';
      AND
    relname NOT ILIKE 'pg_%'
ORDER BY
    3 DESC,
    schema_name,
    relname;
