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
-- Requires MySQL 5.6+
-- Requires MariaDB 10
--
-- Tested on MySQL 5.6, 5.7, 8.0 and MariaDB 10.0 - 10.5

SELECT
    host,
    user,
    max_connections,
    max_user_connections,
    -- not available on MySQL 5.5
    password_expired
    -- these fields don't exist in MySQL < 8.0 / MariaDB 10
    -- password_last_changed,
    -- password_lifetime,
    -- account_locked,
    -- password_reuse_time,
    -- password_require_current
FROM
    mysql.user
ORDER BY
    host,
    user;
