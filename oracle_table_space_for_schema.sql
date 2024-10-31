--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- Oracle - Show Tables' Space Used vs Free and Free Percentage in a given Tablespace
--
--          for tables over 20% utilized
--
--  Calculations assume an 8KB block size, which you should verify like this:
--
--      SELECT value FROM v$parameter WHERE name = 'db_block_size';
--
-- Tested on Oracle 19c

SELECT
    t.owner,
    t.table_name,
    -- each block is 8KB, multiply it to GB, round to two decimal places
    ROUND(t.blocks * 8 / 1024 / 1024, 2) AS total_gb_from_tables,
    -- estimate from segments
    ROUND(s.bytes / 1024 / 1024 / 1024, 2) AS total_gb_from_segments,
    -- estimate data size from rows vs average row size, round to two decimal places
    ROUND(t.num_rows * t.avg_row_len / 1024 / 1024 / 1024, 2) AS actual_data_gb,
    -- estimate free space by subtracting the two above calculations
    ROUND(((t.blocks * 8 / 1024) - (t.num_rows * t.avg_row_len / 1024 / 1024)) / 1024, 2) AS free_space_gb,
    -- calculate free space percentage from the above three calculations
    ROUND(
        ( (t.blocks * 8) - (t.num_rows * t.avg_row_len / 1024) ) /
        (t.blocks * 8) * 100, 2) AS free_space_pct,
    t.last_analyzed
FROM
    dba_tables t
JOIN
    dba_segments s
ON
    t.owner = s.owner
        AND
    t.table_name = s.segment_name
WHERE
    t.blocks > 0
        AND
    t.num_rows > 0
        AND
    -- TUNE: currently only showing tables over 20% utilized
    ((t.blocks * 8 / 1024) - (t.num_rows * t.avg_row_len / 1024 / 1024)) / (t.blocks * 8 / 1024) > 0.2
        AND
    t.owner = 'USERS'  -- XXX: Change this to your owner schema
ORDER BY
    free_space_gb DESC,
    total_gb_from_segments DESC;
