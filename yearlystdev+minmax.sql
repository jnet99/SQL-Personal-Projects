SELECT btc.company, 
	AVG(btsp.[close]) AS AvgClose, 
	STDEV(btsp.[close]) AS StdevClose,
	SUM(CAST(btsp.volume AS bigint)) AS TotalVolume,  
	MAX(btsp.high) AS HighestPrice, 
	MIN(btsp.low) AS LowestPrice,  
	YEAR(btsp.date) AS Y
FROM big_stock_data.dbo.big_tech_companies AS btc
INNER JOIN big_stock_data.dbo.big_tech_stock_prices AS btsp ON btc.stock_symbol = btsp.stock_symbol
GROUP BY btc.company,  YEAR(btsp.date)
ORDER BY btc.company, Y ASC; 
