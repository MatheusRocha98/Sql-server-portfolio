/* conseguindo informação da tabela de vendas online */

select top (1) * from FactOnlineSales

/* fazendo um select da média total do preço por unidade para os produtos vendidos */

select
avg(UnitPrice) as 'média'
from
FactOnlineSales

/* fazendo um join com subconsulta onde só me retorne top 3 produtos vendidos com valor acima da média,
somente na moeda USD e usando a função format para deixar a moeda formatada em dólar   */

select top(3)
	DimProduct.ProductName as 'nomes dos produtos',
	format(FactOnlineSales.UnitPrice , 'c', 'en-us') as 'valores acima da média',
	DimCurrency.CurrencyName as 'moeda'
from
	FactOnlineSales
inner join
	DimProduct
on
	FactOnlineSales.ProductKey = DimProduct.ProductKey
inner join
	DimCurrency
on
	FactOnlineSales.CurrencyKey = DimCurrency.CurrencyKey
where
	FactOnlineSales.UnitPrice > (select avg(UnitPrice) as 'média' from FactOnlineSales ) and DimCurrency.CurrencyName = 'USD'
order by
	FactOnlineSales.UnitPrice desc