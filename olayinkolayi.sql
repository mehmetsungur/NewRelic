-- Olayın Kolayı Apdex Score Last 24 Hours --
SELECT apdex(duration) AS 'Apdex Score'
FROM Transaction
WHERE (
    appName LIKE '%newg%'
    OR appName LIKE 'prod-k8s-techsin-aegondirektapi'
    OR appName LIKE 'prod-k8s-sales-aegon-blacklist-service'
    OR appName LIKE 'prod-k8s-sales-aegon-policy-creation-service'
    OR appName LIKE 'prod-k8s-aegon-kps-service'
  )
  AND appName NOT LIKE 'uat%'
  AND appName NOT LIKE 'dev%'
  AND appName NOT LIKE 'preprod%'
  AND appName NOT LIKE 'vjoin-preprod%'
  AND appName NOT LIKE '%test%'
SINCE 1 day ago
EXTRAPOLATE
FACET appName
ORDER BY `Apdex Score`

-- Olayın Kolayı Error Rates Last 24 Hours --
SELECT percentage(count(*), WHERE error is true) AS 'Error rate' 
FROM Transaction
WHERE (
    appName LIKE '%newg%'
    OR appName LIKE 'prod-k8s-techsin-aegondirektapi'
    OR appName LIKE 'prod-k8s-sales-aegon-blacklist-service'
    OR appName LIKE 'prod-k8s-sales-aegon-policy-creation-service'
    OR appName LIKE 'prod-k8s-aegon-kps-service'
  )
  AND appName NOT LIKE 'uat%'
  AND appName NOT LIKE 'dev%'
  AND appName NOT LIKE 'preprod%'
  AND appName NOT LIKE 'vjoin-preprod%'
  AND appName NOT LIKE '%test%'
SINCE 1 day ago
EXTRAPOLATE
FACET appName
ORDER BY `Error rate`

-- Olayın Kolayı Web Response Last 24 Hours --
SELECT average(duration) AS 'Web Response Score'
FROM Transaction
WHERE (
    appName LIKE '%newg%'
    OR appName LIKE 'prod-k8s-techsin-aegondirektapi'
    OR appName LIKE 'prod-k8s-sales-aegon-blacklist-service'
    OR appName LIKE 'prod-k8s-sales-aegon-policy-creation-service'
    OR appName LIKE 'prod-k8s-aegon-kps-service'
  )
  AND appName NOT LIKE 'uat%'
  AND appName NOT LIKE 'dev%'
  AND appName NOT LIKE 'preprod%'
  AND appName NOT LIKE 'vjoin-preprod%'
  AND appName NOT LIKE '%test%'
SINCE 1 day ago
EXTRAPOLATE
FACET appName
ORDER BY `Web Response Score`

-- Olayın Kolayı Response Code Not 200 Last 24 Hours --
SELECT uniqueCount(httpResponseCode) FROM 
Transaction FACET `appName` WHERE httpResponseCode NOT LIKE '200' LIMIT 346 SINCE 1 days ago 
EXTRAPOLATE
WHERE (
    appName LIKE '%newg%'
    OR appName LIKE 'prod-k8s-techsin-aegondirektapi'
    OR appName LIKE 'prod-k8s-sales-aegon-blacklist-service'
    OR appName LIKE 'prod-k8s-sales-aegon-policy-creation-service'
    OR appName LIKE 'prod-k8s-aegon-kps-service'
  )
  AND appName NOT LIKE 'uat%'
  AND appName NOT LIKE 'dev%'
  AND appName NOT LIKE 'preprod%'
  AND appName NOT LIKE 'vjoin-preprod%'
  AND appName NOT LIKE '%test%'

-- Olayın Kolayı Response Code 500 Last 24 Hours --
SELECT uniqueCount(httpResponseCode) FROM 
Transaction FACET `appName` WHERE httpResponseCode LIKE '500' LIMIT 346 SINCE 1 days ago 
EXTRAPOLATE
WHERE (
    appName LIKE '%newg%'
    OR appName LIKE 'prod-k8s-techsin-aegondirektapi'
    OR appName LIKE 'prod-k8s-sales-aegon-blacklist-service'
    OR appName LIKE 'prod-k8s-sales-aegon-policy-creation-service'
    OR appName LIKE 'prod-k8s-aegon-kps-service'
  )
  AND appName NOT LIKE 'uat%'
  AND appName NOT LIKE 'dev%'
  AND appName NOT LIKE 'preprod%'
  AND appName NOT LIKE 'vjoin-preprod%'
  AND appName NOT LIKE '%test%'

-- Olayın Kolayı Response Code 502 Last 24 Hours --
SELECT uniqueCount(httpResponseCode) FROM 
Transaction FACET `appName` WHERE httpResponseCode LIKE '502' LIMIT 346 SINCE 1 days ago 
EXTRAPOLATE
WHERE (
    appName LIKE '%newg%'
    OR appName LIKE 'prod-k8s-techsin-aegondirektapi'
    OR appName LIKE 'prod-k8s-sales-aegon-blacklist-service'
    OR appName LIKE 'prod-k8s-sales-aegon-policy-creation-service'
    OR appName LIKE 'prod-k8s-aegon-kps-service'
  )
  AND appName NOT LIKE 'uat%'
  AND appName NOT LIKE 'dev%'
  AND appName NOT LIKE 'preprod%'
  AND appName NOT LIKE 'vjoin-preprod%'
  AND appName NOT LIKE '%test%'

-- Olayın Kolayı Response Code 504 Last 24 Hours --
SELECT uniqueCount(httpResponseCode) FROM 
Transaction FACET `appName` WHERE httpResponseCode LIKE '504' LIMIT 346 SINCE 1 days ago 
EXTRAPOLATE
WHERE (
    appName LIKE '%newg%'
    OR appName LIKE 'prod-k8s-techsin-aegondirektapi'
    OR appName LIKE 'prod-k8s-sales-aegon-blacklist-service'
    OR appName LIKE 'prod-k8s-sales-aegon-policy-creation-service'
    OR appName LIKE 'prod-k8s-aegon-kps-service'
  )
  AND appName NOT LIKE 'uat%'
  AND appName NOT LIKE 'dev%'
  AND appName NOT LIKE 'preprod%'
  AND appName NOT LIKE 'vjoin-preprod%'
  AND appName NOT LIKE '%test%'