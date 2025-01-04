/* conseguindo informa��o da tabela de vendas online */

select top (1) * from FactOnlineSales

/* fazendo um select da m�dia total do pre�o por unidade para os produtos vendidos */

select
avg(UnitPrice) as 'm�dia'
from
FactOnlineSales

/* fazendo um join com subconsulta onde s� me retorne top 3 produtos vendidos com valor acima da m�dia,
somente na moeda USD e usando a fun��o format para deixar a moeda formatada em d�lar   */

select top(3)
	DimProduct.ProductName as 'nomes dos produtos',
	format(FactOnlineSales.UnitPrice , 'c', 'en-us') as 'valores acima da m�dia',
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
	FactOnlineSales.UnitPrice > (select avg(UnitPrice) as 'm�dia' from FactOnlineSales ) and DimCurrency.CurrencyName = 'USD'
order by
	FactOnlineSales.UnitPrice desc