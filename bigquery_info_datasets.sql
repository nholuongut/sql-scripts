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
-- Lists datasets in the current project along with their descriptions, sorted by last modified time
--
-- Processes 20MB

SELECT
    s.*,
    TIMESTAMP_DIFF(CURRENT_TIMESTAMP(), creation_time, DAY) AS days_live,
    option_value AS dataset_description
FROM
    -- XXX: can prefix INFORMATION_SCHEMA with your '<project_id>.' to select from another project, but defaulting to the current project is more convenient than editing this
    `INFORMATION_SCHEMA.SCHEMATA` AS s
    LEFT JOIN `INFORMATION_SCHEMA.SCHEMATA_OPTIONS` AS so
    USING (schema_name)
-- will miss all the datasets without descriptions like this
--WHERE
--    so.option_name = 'description'
ORDER BY
    last_modified_time DESC
LIMIT 15;
