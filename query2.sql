
SELECT DISTINCT a.Company,
         a.Highest_Hourly_Price,
         ts AS datetime,
         a.hour
FROM 
    (SELECT name AS Company,
         (EXTRACT(HOUR
    FROM (CAST(ts AS TIMESTAMP))) - 4) AS hour, max(high) AS Highest_Hourly_Price
    FROM sta9760f2020yfinance
    GROUP BY  1, 2
    ORDER BY  1, 2 ) a, sta9760f2020yfinance b
WHERE a.Company=b.name
        AND a.hour = (EXTRACT(HOUR
FROM (CAST(ts AS TIMESTAMP))) - 4)
        AND a.Highest_Hourly_Price = b.high
ORDER BY  1, 4

