--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- Oracle - Show Tablespace Size, Space Used GB and Percentage Used
--
--  Calculations assume an 8KB block size, which you should verify like this:
--
--      SELECT value FROM v$parameter WHERE name = 'db_block_size';
--
-- Tested on Oracle 19c

SELECT
    tablespace_name "Tablespace",
    -- convert used_space in blocks to GB as each block is 8KB
    ROUND(used_space * 8 / 1024 / 1024, 2) AS "Used Space (GB)",
    -- convert tablespace_size in blocks to GB as each block is 8KB
    ROUND(tablespace_size * 8 / 1024 / 1024, 2) AS "Total Space (GB)",
    ROUND(used_percent, 2) AS "Used Space %"
FROM
    dba_tablespace_usage_metrics
ORDER BY
    "Used Space %" DESC;
