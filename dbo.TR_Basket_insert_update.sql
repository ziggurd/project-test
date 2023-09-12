
Create Trigger TR_Basket_insert_update
ON dbo.Basket
After Insert, Update
As
Begin
	Declare @ID_SKU INT
	Declare @Count INT
	Select @ID_SKU=ID_SKU FROM inserted -- Получаем значения ID_SKU  из вставленной записи
	Select @Count=Count(*) from dbo.Basket WHERE ID_SKU=@ID_SKU --Подсчитываем кол-во записей с таким же ID_SKU
	IF @Count>=2
	Begin
		Update dbo.Basket
		SET DiscountValue=Value*0.05
		Where ID_SKU=@ID_SKU
	End
	Else
	Begin
		Update dbo.Basket
		SET DiscountValue=0
		Where ID_SKU=@ID_SKU
	END
End