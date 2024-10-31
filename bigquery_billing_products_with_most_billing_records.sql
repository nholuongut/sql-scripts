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
-- products with most billing records

SELECT
    product,
    COUNT(*) AS billing_records
FROM
    `myproject.mydataset.imported_billing_data`
GROUP BY
    product
ORDER BY
    billing_records DESC;
