--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- MySQL views across schemas (useful for finding views)
--
-- Tested on MySQL 5.5, 5.6, 5.7, 8.0 and MariaDB 5.5, 10.0 - 10.5

SELECT
    -- table_catalog,
    table_schema,
    table_name,
    IS_UPDATABLE,
    DEFINER,
    SECURITY_TYPE
FROM
    information_schema.views
ORDER BY
    table_schema,
    table_name;
