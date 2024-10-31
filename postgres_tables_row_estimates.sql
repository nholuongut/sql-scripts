--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- PostgreSQL table row count estimates in one place
--
-- Useful when comparing tables or when a table becomes so large you don't want the expense
-- of 'SELECT COUNT(*)' and are happy to use the internal statistics instead
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0

SELECT
    schemaname,
    relname,
    n_live_tup
FROM
    --pg_stat_all_tables
    pg_stat_user_tables
ORDER BY
    n_live_tup DESC;
