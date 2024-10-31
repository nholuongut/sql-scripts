--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
-- PostgreSQL recovery info
--
-- Requires PostgreSQL 10+
--
-- Tested on PostgreSQL 10.x, 11.x, 12.x, 13.0

SELECT
    pg_is_in_backup(),
    pg_is_in_recovery(),
    pg_backup_start_time(),
    -- the following recovery control functions can only be executed during recovery - to get just the above use postgres_funcs.sql
    ( CASE WHEN pg_is_in_recovery() THEN pg_is_wal_replay_paused() END)       AS "pg_is_wal_replay_paused()",
    ( CASE WHEN pg_is_in_recovery() THEN pg_last_wal_receive_lsn() END)       AS "pg_last_wal_receive_lsn()",
    ( CASE WHEN pg_is_in_recovery() THEN pg_last_wal_replay_lsn() END)        AS "pg_last_wal_replay_lsn()",
    ( CASE WHEN pg_is_in_recovery() THEN pg_last_xact_replay_timestamp() END) AS "pg_last_xact_replay_timestamp()"
;
