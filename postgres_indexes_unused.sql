--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- PostgreSQL unused indexes
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0

SELECT
    relname AS table,
    indexrelname AS index,
    idx_scan,
    idx_tup_read,
    idx_tup_fetch,
    pg_size_pretty(pg_relation_size(indexrelname::regclass))
FROM
    pg_stat_all_indexes
WHERE
    schemaname = 'public'
        AND
    idx_scan = 0
        AND
    idx_tup_read = 0
        AND
    idx_tup_fetch = 0
ORDER BY
    pg_relation_size(indexrelname::regclass) DESC;
