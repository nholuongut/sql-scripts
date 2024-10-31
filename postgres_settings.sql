--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- Show PostgreSQL running settings and those set in postgres.conf
--
-- Requires PostgreSQL 9.5+
--
-- Tested on PostgreSQL 9.5, 9.6, 10.x, 11.x, 12.x, 13.0

--\pset title 'pg_settings'
\echo pg_settings:
SELECT
    name,
    setting,
    unit,
    context
FROM
    pg_settings;

\echo

--\pset title 'pg_file_settings'
\echo pg_file_settings:
SELECT
    *
FROM
    pg_file_settings;
