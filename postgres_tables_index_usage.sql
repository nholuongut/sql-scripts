--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- PostgreSQL % of times indexes are used on tables by table size descending (might want to tweak to list by % descending)
--
-- If not near 99% index usage on tables > 10,000 rows, consider adding an index to match your query patterns (CREATE INDEX CONCURRENTLY in prod to avoid locking table)
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0

SELECT
    relname AS table,
    100 * idx_scan / GREATEST(seq_scan + idx_scan, 1) AS percent_of_times_index_used,
    n_live_tup AS rows_in_table
FROM
    pg_stat_user_tables
WHERE
    seq_scan + idx_scan > 0
ORDER BY
    rows_in_table DESC,
    percent_of_times_index_used DESC;
