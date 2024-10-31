--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- MySQL databases by size descending
--
-- Tested on MySQL 5.5, 5.6, 5.7, 8.0 and MariaDB 5.5, 10.0 - 10.5

SELECT
    table_schema,
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 3) AS 'Database Size (MB)',
    ROUND(SUM(data_free) / 1024 / 1024, 3) AS 'Free Space (MB)'
FROM
    information_schema.tables
GROUP BY
    table_schema
ORDER BY
    2 DESC;
