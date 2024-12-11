SELECT btc.company
      ,btsp.[date]
      ,btsp.[open]
      ,btsp.[high]
      ,btsp.[low]
      ,btsp.[close]
	  ,STDEV(btsp.[close]) AS StdevClose
      ,btsp.[adj_close]
      ,btsp.[volume]
FROM big_stock_data.dbo.big_tech_companies AS btc
INNER JOIN big_stock_data.dbo.big_tech_stock_prices AS btsp ON btc.stock_symbol = btsp.stock_symbol
GROUP BY btc.company, btsp.date, btsp.[open], btsp.[close], btsp.[high], btsp.[low], btsp.[close],btsp.[adj_close],btsp.[volume];


