/* APDEX SCORE */
SELECT apdex(duration) AS 'Apdex Score' FROM 
Transaction FACET `appName` LIMIT 346 SINCE 1 days ago 
EXTRAPOLATE WHERE 
appName NOT LIKE 'uat%' AND 
appName NOT LIKE 'dev%' AND 
appName NOT LIKE 'preprod%' AND 
appName NOT LIKE 'vjoin-preprod%' AND 
appName NOT LIKE '%test%'

/* ERROR SCORE */
SELECT percentage(count(*), WHERE error is true) AS 'Error rate' FROM 
Transaction FACET `appName` LIMIT 346 SINCE 1 days ago 
EXTRAPOLATE WHERE 
appName NOT LIKE 'uat%' AND 
appName NOT LIKE 'dev%' AND 
appName NOT LIKE 'preprod%' AND 
appName NOT LIKE 'vjoin-preprod%' AND 
appName NOT LIKE '%test%'

/* WEB RESPONSE SCORE */
SELECT average(duration) AS 'Web Response Score' FROM 
Transaction FACET `appName` LIMIT 346 SINCE 1 days ago 
EXTRAPOLATE WHERE 
appName NOT LIKE 'uat%' AND 
appName NOT LIKE 'dev%' AND 
appName NOT LIKE 'preprod%' AND 
appName NOT LIKE 'vjoin-preprod%' AND 
appName NOT LIKE '%test%'

/* Response Code 500 */
SELECT uniqueCount(httpResponseCode) FROM 
Transaction FACET `appName` WHERE httpResponseCode LIKE '500' LIMIT 346 SINCE 1 days ago 
EXTRAPOLATE WHERE 
appName NOT LIKE 'uat%' AND 
appName NOT LIKE 'dev%' AND 
appName NOT LIKE 'preprod%' AND 
appName NOT LIKE '%test%'

/* Response Code 502 */
SELECT uniqueCount(httpResponseCode) FROM 
Transaction FACET `appName` WHERE httpResponseCode LIKE '502' LIMIT 346 SINCE 1 days ago 
EXTRAPOLATE WHERE 
appName NOT LIKE 'uat%' AND 
appName NOT LIKE 'dev%' AND 
appName NOT LIKE 'preprod%' AND 
appName NOT LIKE '%test%'

/* Response Code 504 */
SELECT uniqueCount(httpResponseCode) FROM 
Transaction FACET `appName` WHERE httpResponseCode LIKE '504' LIMIT 346 SINCE 1 days ago 
EXTRAPOLATE WHERE 
appName NOT LIKE 'uat%' AND 
appName NOT LIKE 'dev%' AND 
appName NOT LIKE 'preprod%' AND 
appName NOT LIKE '%test%'

/* Test */
SELECT uniqueCount(httpResponseCode) FROM 
Transaction FACET `appName` WHERE httpResponseCode LIKE '504' LIMIT 346 SINCE 1 days ago 
EXTRAPOLATE WHERE 
appName NOT LIKE 'uat%' AND 
appName NOT LIKE 'dev%' AND 
appName NOT LIKE 'preprod%' AND 
appName NOT LIKE '%test%'
AND (
    (
      (
        weekdayOf(timestamp) in ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
        AND (
          (
            (
              hourOf(timestamp) = 9 AND minuteOf(timestamp) >= 0
            )
            OR (
              hourOf(timestamp) > 9 AND hourOf(timestamp) < 12
            )
          )
          OR (
            (
              hourOf(timestamp) = 12 AND minuteOf(timestamp) = 0
            )
          )
        )
      )
    )
    OR (
      (
        weekdayOf(timestamp) in ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
        AND (
          (
            (
              hourOf(timestamp) = 13 AND minuteOf(timestamp) >= 0
            )
            OR (
              hourOf(timestamp) > 13 AND hourOf(timestamp) < 17
            )
          )
          OR (
            (
              hourOf(timestamp) = 17 AND minuteOf(timestamp) = 0
            )
          )
        )
      )
    )
  )