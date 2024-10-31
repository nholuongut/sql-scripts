--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- List MySQL users ordered by host, user similar to auth resolution
--
-- Requires MySQL 8.0+
-- Requires MariaDB N/A
--
-- Tested on MySQL 8.0
--
-- some fields don't exist on MySQL < 8.0 and MariaDB 10.0 - 10.5, must use mysql_users_pre8.sql instead

SELECT
    host,
    user,
    max_connections,
    max_user_connections,
    password_expired,
    password_last_changed,
    password_lifetime,
    account_locked,
    password_reuse_time,
    password_require_current
FROM
    mysql.user
ORDER BY
    host,
    user;
