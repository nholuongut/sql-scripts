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

WITH visitors AS(
    SELECT
    COUNT(DISTINCT fullVisitorId) AS total_visitors
    FROM `data-to-insights.ecommerce.web_analytics`
),

purchasers AS(
    SELECT
    COUNT(DISTINCT fullVisitorId) AS total_purchasers
    FROM `data-to-insights.ecommerce.web_analytics`
    WHERE totals.transactions IS NOT NULL
)

SELECT
    total_visitors,
    total_purchasers,
    total_purchasers / total_visitors AS conversion_rate,
    ROUND(total_purchasers / total_visitors * 100, 2) AS conversion_percentage
FROM
    visitors,
    purchasers
;
