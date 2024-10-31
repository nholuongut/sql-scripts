--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- Oracle - Show Table Candidates to Move / Shrink in a given Tablespace
--
--          where the tables are over 20% utilized
--
-- Tested on Oracle 19c

SELECT
    segment_name,
    segment_type,
    ROUND(SUM(bytes)/1024/1024/1024, 2) AS size_gb
FROM
    dba_segments
WHERE
    tablespace_name = 'USERS' -- XXX: Edit
GROUP BY
    segment_name,
    segment_type
HAVING
    SUM(bytes)/1024/1024/1024 > 1
ORDER BY
    size_gb DESC;
