/*resultado sem os joins ( ineficaz e em tabelas diferentes )*/
select * from DimCustomer
where CustomerKey = 333

select top(1) * from FactOnlineSales

select * from DimProduct
where ProductKey = 782

/* resultado usando joins ( eficaz e organizado em uma tabela só ) */

select
	DimCustomer.FirstName as 'nome',
		DimCustomer.LastName as 'sobrenome',
			DimProduct.ProductName as 'nome do produto',
				format(FactOnlineSales.UnitPrice, 'c', 'pt-br') as 'moeda brasileira'
					from
						FactOnlineSales
							full join
					DimCustomer
				on
			DimCustomer.CustomerKey = FactOnlineSales.CustomerKey
		full join
	DimProduct
		on
			DimProduct.ProductKey = FactOnlineSales.ProductKey
				where
					DimCustomer.CustomerKey = 333 and DimProduct.ProductKey = 782
