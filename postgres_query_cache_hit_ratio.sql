--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- PostgreSQL queries cache-hit ratio from pg_stat_statements
--
-- Requires PostgreSQL 9.1+
--
-- Tested on PostgreSQL 9.1+, 10.x, 11.x, 12.x, 13.0

-- postgresql.conf needs before start:
-- shared_preload_libraries = 'pg_stat_statements'
--
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

SELECT
    calls,
    rows,
    shared_blks_hit,
    shared_blks_read,
    -- using greatest() to avoid divide by zero error, by ensuring we divide by at least 1
      shared_blks_hit /
      GREATEST(shared_blks_hit + shared_blks_read, 1)::float AS shared_blks_hit_ratio,
      -- casting divisor to float to avoid getting integer maths returning zeros instead of fractional ratios
    local_blks_hit,
    local_blks_read,
      local_blks_hit /
      GREATEST(local_blks_hit + local_blks_read, 1)::float AS local_blks_hit_ratio,
    query
FROM
    pg_stat_statements
--ORDER BY rows DESC
ORDER BY
    shared_blks_hit_ratio DESC,
    local_blks_hit_ratio DESC,
    rows DESC
LIMIT 100;
