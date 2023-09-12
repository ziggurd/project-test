--Создание функции
Create Function dbo.udf_GetSKUPrice ( @ID_SKU INT)
Returns decimal (18,2)
As
Begin
	Declare @Price Decimal (18,2)
	Select @Price=SUM(Value)/SUM(Quantity)
	From dbo.Basket
	Where ID_SKU=@ID_SKU
	Return @Price
End
