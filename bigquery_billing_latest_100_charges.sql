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

-- BigQuery Billing Query
--
-- latest 100 charges

SELECT
    product,
    resource_type,
    start_time,
    end_time,
    cost,
    project_id,
    project_name,
    project_labels_key,
    currency,
    currency_conversion_rate,
    usage_amount,
    usage_unit
FROM
    `myproject.mydataset.imported_billing_data`
WHERE
    cost > 0
ORDER BY
    end_time DESC
LIMIT 100;
