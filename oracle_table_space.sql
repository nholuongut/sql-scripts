--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- Oracle - Show Tables' Space Used vs Free and Free Percentage
--
--          where the tables are over 20% utilized
--
--  Calculations assume an 8KB block size, which you should verify like this:
--
--      SELECT value FROM v$parameter WHERE name = 'db_block_size';
--
-- Tested on Oracle 19c

SELECT
    owner,
    table_name,
    -- each block is 8KB, multiply it to GB, round to two decimal places
    ROUND(blocks * 8 / 1024 / 1024, 2) AS total_gb,
    -- estimate data size from rows vs average row size, round to two decimal places
    ROUND(num_rows * avg_row_len / 1024 / 1024 / 1024, 2) AS actual_data_gb,
    -- estimate free space by subtracting the two above calculations
    ROUND((blocks * 8 / 1024 / 1024) - (num_rows * avg_row_len / 1024 / 1024 / 1024), 2) AS free_space_gb,
    -- calculate free space percentage from the above three calculations
    ROUND(
        ( (blocks * 8 / 1024 / 1024) - (num_rows * avg_row_len / 1024 / 1024 / 1024) ) /
        (blocks * 8 / 1024 / 1024) * 100, 2) AS free_space_pct
FROM
    dba_tables
WHERE
    blocks > 0
        AND
    num_rows > 0
        AND
    ((blocks * 8 / 1024 / 1024) - (num_rows * avg_row_len / 1024 / 1024 / 1024)) /
    (blocks * 8 / 1024 / 1024) > 0.2  -- TUNE: currently only showing tables over 20% utilized
        AND
    owner NOT IN
      ('SYS', 'SYSTEM', 'SYSAUX', 'RDSADMIN')
ORDER BY
    free_space_gb DESC,
    total_gb DESC;
