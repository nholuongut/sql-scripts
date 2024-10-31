--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- Oracle - Show User Sessions Using Temporary Tablespace
--
-- Check there are none before dropping an old temp tablespace file to avoid disruptions
--
-- Tested on Oracle 19c

SELECT
    s.sid,
    s.username,
    t.tablespace,
    t.blocks,
    t.segfile#,
    t.segblk#,
    t.contents,
    t.sql_id
FROM
    v$sort_usage t,
    v$session s
WHERE
    t.session_addr = s.saddr;
