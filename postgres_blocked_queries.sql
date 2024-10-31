--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- Lists PostgreSQL queries blocked along with the pids of those holding the locks blocking them
--
-- Requires PostgreSQL >= 9.6
--
-- Tested on PostgreSQL 9.6+, 10.x 11.x, 12.x, 13.0

SELECT
    pid,
    usename,
    pg_blocking_pids(pid) AS blocked_by_pids,
    query AS blocked_query
FROM
    pg_stat_activity
WHERE
    cardinality(pg_blocking_pids(pid)) > 0;
