--
-- Author: Nho Luong
-- Date: Tue Feb 4 09:53:28 2020 +0000
--
--  vim:ts=2:sts=2:sw=2:et
--  https://github.com/nholuongut/sql-scripts
-- If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
--
--
--
-- BigQuery Information Schema
--
-- Lists partitioned and/or clustered columns in a dataset
--
-- Processes 10MB of data when run


SELECT
    *
FROM
    -- XXX: replace bigquery-public-data.github_repos with myproject.mydataset
    `bigquery-public-data.github_repos.INFORMATION_SCHEMA.COLUMNS`
WHERE
    is_partitioning_column = 'YES'
        OR
    clustering_ordinal_position IS NOT NULL;
