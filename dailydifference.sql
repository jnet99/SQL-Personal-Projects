SELECT btc.company, 
	btsp.date,
	btsp.[close],
	LAG(btsp.[close]) OVER (ORDER BY btc.company) AS previous_price,
	ROUND(btsp.[close]-LAG(btsp.[close]) OVER (ORDER BY btc.company), 2) AS daily_difference
FROM big_stock_data.dbo.big_tech_companies AS btc
INNER JOIN big_stock_data.dbo.big_tech_stock_prices AS btsp ON btc.stock_symbol=btsp.stock_symbol
GROUP BY btc.company, btsp.date, btsp.[close]
ORDER BY btc.company, btsp.date;
