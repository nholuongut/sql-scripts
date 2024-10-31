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

-- looking at bounces and time on site are not good features for model training and prediction since of the top 10 customers by time on site only 1 purchased!

SELECT
    * EXCEPT(fullVisitorId)
FROM

    # features
    (SELECT
        fullVisitorId,
        IFNULL(totals.bounces, 0) AS bounces,
        IFNULL(totals.timeOnSite, 0) AS time_on_site
    FROM
        `data-to-insights.ecommerce.web_analytics`
    WHERE
        totals.newVisits = 1)
    JOIN
    (SELECT
        fullvisitorid,
        IF(
            COUNTIF(
                totals.transactions > 0
                    AND
                totals.newVisits IS NULL
            ) > 0, 1, 0
        ) AS will_buy_on_return_visit
    FROM
        `data-to-insights.ecommerce.web_analytics`
    GROUP BY fullvisitorid)
    USING (fullVisitorId)
ORDER BY
    time_on_site DESC
LIMIT 10;
