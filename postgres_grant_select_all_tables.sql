--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- 3rd party ETL tools often need a postgres user account with SELECT on all tables in a database, and this also handles granting it to future tables
--
-- XXX: replace 'fivetran' with the postgres user account used by the 3rd party ETL tool
--
-- https://fivetran.com/docs/databases/postgresql/gcs-setup-guide?embed=true#grantreadonlyaccess
--
-- Requires PostgreSQL 9.0+
--
-- Tested on PostgreSQL 9.x, 10.x, 11.x, 12.x, 13.0

CREATE USER fivetran;

GRANT USAGE ON SCHEMA "public" TO fivetran;
GRANT SELECT ON ALL TABLES IN SCHEMA "public" TO fivetran;
ALTER DEFAULT PRIVILEGES IN SCHEMA "public" GRANT SELECT ON TABLES TO fivetran;
