--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- Oracle - Show All Users Recyclebins via DBA Recyclebin
--
-- Tested on Oracle 19c

SELECT
    owner,
    object_name,
    original_name,
    type,
    droptime,
    space
FROM
    dba_recyclebin
ORDER BY
    owner,
    droptime
DESC;
