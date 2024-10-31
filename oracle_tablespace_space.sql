--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- Oracle - Show Tablespace Size, Space Used vs Free in GB and as a Percentage
--
-- Tested on Oracle 19c

SELECT
    df.tablespace_name "Tablespace",
    df.bytes / (1024 * 1024 * 1024) "Size (GB)",
    (df.bytes - SUM(fs.bytes)) / (1024 * 1024 * 1024) "Used Space (GB)",
    SUM(fs.bytes) / (1024 * 1024 * 1024) "Free Space (GB)",
    ROUND(SUM(fs.bytes) / df.bytes * 100, 2) "Free Space %"
FROM
    dba_free_space fs,
    (SELECT
        tablespace_name,
        SUM(bytes) bytes
    FROM
        dba_data_files
    GROUP BY
        tablespace_name) df
WHERE
    fs.tablespace_name (+) = df.tablespace_name
GROUP BY
     df.tablespace_name,
     df.bytes
ORDER BY
     "Free Space (GB)" DESC,
     "Used Space (GB)" DESC;
