--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- Show PostgreSQL client connection default settings
--
-- eg. client_min_messages, transaction_isolation / default_transaction_isolation, statement_timeout, lock_timeout, TimeZone, lc_ctype, server_encoding, search_path
--
-- Requires PostgreSQL 9.5+
--
-- Tested on PostgreSQL 9.5, 9.6, 10.x 11.x, 12.x, 13.0

-- https://www.postgresql.org/docs/12/runtime-config-client.html

SELECT
    name,
    setting,
    -- category,
    vartype,
    short_desc,
    enumvals,
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
    -- Client Connection Defaults / Statement Behavior
    -- Client Connection Defaults / Locale and Formatting
    -- Client Connection Defaults / Other Defaults
    -- Client Connection Defaults / Shared Library Preloading
    category ILIKE '%Client Connection Defaults%';
