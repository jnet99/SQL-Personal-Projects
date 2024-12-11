SELECT btc.company, 
	ROUND(POWER(STDEV(btsp.[close]),2),2,1) AS Variance,
	MONTH(btsp.date) AS M, 
	YEAR(btsp.date) AS Y
FROM big_stock_data.dbo.big_tech_companies AS btc
INNER JOIN big_stock_data.dbo.big_tech_stock_prices AS btsp ON btc.stock_symbol = btsp.stock_symbol
GROUP BY btc.company,  YEAR(btsp.date), MONTH(btsp.date)
ORDER BY btc.company, Y, M ASC; 