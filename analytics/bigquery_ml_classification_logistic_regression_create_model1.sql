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

-- ran for 2 minutes to build the trained model
--
-- This statement created a new model named <project>:ecommerce.classification_model1
--
-- - click "Go to model" on the far right of the line

-- this model is weak in feature selection - see model2 for a much better more realistic model

CREATE OR REPLACE MODEL `ecommerce.classification_model1`
OPTIONS (
    model_type='logistic_reg',
    labels = ['will_buy_on_return_visit']
) AS

-- training data provided below via SELECT statement

SELECT
    * EXCEPT(fullVisitorId)
FROM

    -- features
    (
      SELECT
        fullVisitorId,
        IFNULL(totals.bounces, 0) AS bounces,
        IFNULL(totals.timeOnSite, 0) AS time_on_site
      FROM
        `data-to-insights.ecommerce.web_analytics`
      WHERE
        totals.newVisits = 1
        -- train on subset of the data so we can test on the rest of the data
        AND date BETWEEN '20160801' AND '20170430'
    )
    JOIN
    (
      SELECT
        fullvisitorid,
        -- the label of answers to train on
        IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, 1, 0) AS will_buy_on_return_visit
      FROM
        `data-to-insights.ecommerce.web_analytics`
      GROUP BY
        fullvisitorid
    )
    USING
      (fullVisitorId)
;
