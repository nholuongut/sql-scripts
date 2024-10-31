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
-- Lists columns and their details in a given dataset
--
-- Processes 10MB of data when run

-- https://cloud.google.com/bigquery/docs/tables#columns_view

SELECT
    table_catalog,
    table_schema,
    table_name,
    column_name,
    ordinal_position,
    is_nullable,
    data_type,
    is_generated,
    generation_expression,
    is_stored,
    is_hidden,
    is_updatable,
    is_system_defined,
    is_partitioning_column,
    clustering_ordinal_position
FROM
    -- XXX: replace bigquery-public-data.github_repos with myproject.mydataset
    `bigquery-public-data.github_repos.INFORMATION_SCHEMA.COLUMNS`;
