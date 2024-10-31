--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- PostgreSQL count of sessions in each state
--
-- Requires 9.2 <= PostgreSQL < 10
--
-- Tested on PostgreSQL 9.2 - 9.6, 10.x, 11.x, 12.x, 13.0

SELECT
    pid,
    usename,
    client_addr,
    client_hostname,
    client_port,
    backend_start,
    query_start,
    state
FROM
    pg_stat_activity;
