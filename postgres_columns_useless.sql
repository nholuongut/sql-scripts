--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- Finds useless PostgreSQL columns containing only a single value
--
-- eg. all NULLs or a redundant non-distinguishing field
--
-- Only returns columns with over 100 rows
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0


SELECT
    nspname,
    relname,
    attname,
    typname,
    (stanullfrac*100)::int AS null_percent,
    case
        when stadistinct >= 0
            then stadistinct
        else
            abs(stadistinct)*reltuples
    end AS "distinct",
    case 1
        when stakind1
            then stavalues1
        when stakind2
            then stavalues2
    end AS "values"
FROM
    pg_class c
JOIN
    pg_namespace ns
ON
    (ns.oid=relnamespace)
JOIN
    pg_attribute
ON
    (c.oid=attrelid)
JOIN
    pg_type t
ON
    (t.oid=atttypid)
JOIN
    pg_statistic
ON
    (c.oid=starelid AND staattnum=attnum)
WHERE
    nspname NOT LIKE E'pg\\_%'
        AND
    nspname != 'information_schema'
        AND
    relkind = 'r'
        AND
    NOT attisdropped
        AND
    attstattarget != 0
        AND
    reltuples >= 100
        AND
    stadistinct BETWEEN 0 AND 1
ORDER BY
    nspname,
    relname,
    attname;
