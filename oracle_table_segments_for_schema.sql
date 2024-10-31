--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- Oracle - Show Tables' Segments Size in a given Tablespace
--
-- Tested on Oracle 19c

SELECT
    segment_name,
    segment_type,
    tablespace_name,
    bytes/1024/1024/1024 AS size_gb,
    blocks
FROM
    dba_segments
WHERE
    owner = 'USERS'  -- XXX: Edit this
        AND
    segment_type = 'TABLE'
        AND
    blocks > 8
    -- to look at only specific tables
    --  AND
    --segment_name IN
    --('MY_TABLE_1',
    -- 'MY_TABLE_2',
    -- 'MY_TABLE_3',
    -- 'MY_TABLE_4')
ORDER BY
    size_gb DESC;
