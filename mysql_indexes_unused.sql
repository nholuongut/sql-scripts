--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- MySQL unused indexes
--
-- Requires MySQL 5.7+
-- Requires MariaDB N/A
--
-- Tested on MySQL 5.7, 8.0
--
-- sys doesn't exist in MySQL <= 5.6 or MariaDB 10.5

-- requires Performance Schema to be enabled
--
-- in my.cnf:
--
-- [mysqld]
-- performance_schema=ON
--
-- 1 = true, 0 = false
SELECT IF (@@performance_schema, 'TRUE', 'FALSE') AS 'Performance Schema enabled';

\! echo "Unused Indexes since startup:";

SELECT
    *
FROM
    sys.schema_unused_indexes
ORDER BY
    object_schema,
    object_name,
    index_name;
