SELECT btc.company, MAX(btsp.high) AS Highest_Price, MIN(btsp.low) AS Lowest_Price, MONTH(btsp.date) AS Monthly, YEAR(btsp.date) AS Yr
FROM big_stock_data.dbo.big_tech_companies AS btc
INNER JOIN big_stock_data.dbo.big_tech_stock_prices AS btsp ON btc.stock_symbol = btsp.stock_symbol
GROUP BY btc.company, YEAR(btsp.date), MONTH(btsp.date)
ORDER BY btc.company, Yr, Monthly ASC; 
