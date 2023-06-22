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