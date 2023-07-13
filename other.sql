SELECT count(`apm.service.external.host.duration`) FROM Metric WHERE appName LIKE '%' SINCE LAST WEEK FACET external.host limit max

SELECT uniqueCount(httpResponseCode) 
FROM Transaction 
WHERE appId = 174468149 AND request.uri= '/api/Funnel/SendEmail' AND httpResponseCode = 200