--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- Oracle Show Checkpoint Dates on DBF data files (relevant for DBA recoveries)
--
-- Tested on Oracle 9i, 10g, 11g, 19c


SELECT
    checkpoint_time,
    file#
FROM
    v$datafile
ORDER BY
    checkpoint_time;
