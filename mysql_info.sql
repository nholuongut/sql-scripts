--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--

-- Useful MySQL funcs & info
--
-- Useful for debugging intended vs actual user auth to fix mysql.user table
--
-- Tested on MySQL 5.5, 5.6, 5.7, 8.0 and MariaDB 5.5, 10.0 - 10.5


-- https://dev.mysql.com/doc/refman/8.0/en/sql-function-reference.html


-- some of these allow not using the brackets but use them for portability between MySQL 5.x and 8.x
SELECT
    VERSION(),
    USER(),         -- client's reported user + host, same as SESSION_USER(), SYSTEM_USER()
    CURRENT_USER(), -- authenticated user name + host name - this is the one you want for debugging your mysql.user table configuration
    DATABASE(),     -- SCHEMA()
    NOW(),
    CURDATE(),
    CURTIME(),
    UTC_DATE(),
    UTC_TIME(),
    UTC_TIMESTAMP(),
    SYSDATE(),      -- returns date of function completion
    -- PS_CURRENT_THREAD_ID(),  -- MySQL 8.0.16+
    UUID_SHORT(),   -- integer
    UUID()          -- alnum
;
