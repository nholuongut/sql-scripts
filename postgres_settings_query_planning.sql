--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- Show PostgreSQL Query Tuning & Query Statistics Collection settings
--
-- eg. enable_indexscan, enable_hashjoin, jit, track_activities, track_counts
--
-- Requires PostgreSQL 9.5+
--
-- Tested on PostgreSQL 9.5, 9.6, 10.x 11.x, 12.x, 13.0

-- https://www.postgresql.org/docs/12/runtime-config-query.html

SELECT
    name,
    setting,
    -- category,
    vartype,
    short_desc,
    -- enumvals,
    source,
    min_val,
    max_val,
    boot_val,
    reset_val,
    -- not available on PostgreSQL < 9.5
    pending_restart
FROM
    pg_settings
WHERE
    -- Query Tuning / Planner Method Configuration
    -- Query Tuning / Planner Cost Constants
    -- Query Tuning / Other Planner Options
    -- Query Tuning / Genetic Query Optimizer
    -- Statistics / Query and Index Statistics Collector
    --
    -- more general to pull in 'track_activities' from category 'Statistics / Query and Index Statistics Collector'
    --category ILIKE '%Query Tuning%';
    category ILIKE '%Query%';
