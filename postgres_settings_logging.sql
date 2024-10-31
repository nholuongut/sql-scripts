--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- Show PostgreSQL logging settings
--
-- eg. log_destination, logging_collector, log_rotation_age, log_filename (format), log_connections, log_hostname, log_disconnections, log_checkpoints, log_lock_waits etc.
--
-- Requires PostgreSQL 9.5+
--
-- Tested on PostgreSQL 9.5, 9.6, 10.x 11.x, 12.x, 13.0

-- https://www.postgresql.org/docs/12/runtime-config-logging.html

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
    -- Reporting and Logging / What to Log
    -- broader '%Log%' pulls in WAL settings which we don't want here
    category ILIKE '%Logging%';
