--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- Show PostgreSQL WAL settings
--
-- eg. fsync, wal_level, wal_buffers, wal_sync_method, synchronous_commit, checkpoint_timeout, archive_mode etc.
--
-- Requires PostgreSQL 9.5+
--
-- Tested on PostgreSQL 9.5, 9.6, 10.x 11.x, 12.x, 13.0

-- https://www.postgresql.org/docs/12/runtime-config-wal.html

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
    -- Write-Ahead Log / Settings
    -- Write-Ahead Log / Recovery Target
    -- Write-Ahead Log / Checkpoints
    -- Write-Ahead Log / Archive Recovery
    -- Write-Ahead Log / Archiving
    category ILIKE '%Write-Ahead Log%';
