--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- MySQL tables across schemas (useful for finding tables)
--
-- Tested on MySQL 5.5, 5.6, 5.7, 8.0 and MariaDB 5.5, 10.0 - 10.5

SELECT
    table_schema,
    table_name,
    table_type,
    engine,
    table_rows,
    avg_row_length,
    data_length,
    max_data_length,
    index_length,
    data_free,
    auto_increment,
    create_time,
    update_time,
    table_comment
FROM
    information_schema.tables
WHERE
    table_type NOT LIKE '%VIEW%'
ORDER BY
    table_schema,
    table_name;
