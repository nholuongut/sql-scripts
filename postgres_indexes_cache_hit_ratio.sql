--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- PostgreSQL Indexes Cache-hit Ratio
--
-- should be closer to 1, eg. 0.99
--
-- Tested on PostgreSQL 8.4, 9.x, 10.x, 11.x, 12.x, 13.0

SELECT
    SUM(idx_blks_read) AS idx_blks_read,
    SUM(idx_blks_hit)  AS idx_blks_hit,
             SUM(idx_blks_hit) /
    GREATEST(SUM(idx_blks_hit) + SUM(idx_blks_read), 1)::float
                AS ratio
FROM
    pg_statio_user_indexes;
