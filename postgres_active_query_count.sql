--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- PostgreSQL number of active queries
--
-- If COUNT consistently > CPU Cores, then upgrade/scale
--
-- Requires PostgreSQL >= 9.2 for state column in pg_stat_activity
--
-- Tested on PostgreSQL 9.2+, 10.x, 11.x, 12.x, 13.0

SELECT
    COUNT(*) as active_query_count
FROM
    pg_stat_activity
WHERE
    state='active';
