--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- Show PostgreSQL SSL settings
--
-- eg. ssl on/off, ssl_cert_file, ssl_ciphers etc.
--
-- Requires PostgreSQL 9.5+
--
-- Tested on PostgreSQL 9.5, 9.6, 10.x 11.x, 12.x, 13.0

-- https://www.postgresql.org/docs/12/runtime-config-connection.html#RUNTIME-CONFIG-CONNECTION-SSL

SELECT
    name,
    setting,
    -- category
    vartype,
    short_desc,
    enumvals,
    boot_val,
    reset_val,
    -- not available on PostgreSQL < 9.5
    pending_restart
FROM
    pg_settings
WHERE
    name ILIKE '%ssl%'
      OR
    -- Connections and Authentication / SSL
    category ILIKE '%SSL%'
      OR
    short_desc ILIKE '%SSL%';
