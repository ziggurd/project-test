--Создание процедуры--
 Create Procedure dbo.usp_MakeFamilyPurchase
	@FamilySurname varchar(255)
AS
Begin


					--Проверка сущетсвования семьи в таблице Family
If NOT Exists (Select * From family Where Surname=@FamilySurName)
Begin
	Throw 50000, 'Такой семьи не существует', 1;
End;


Update family
set BudgetValue = (Select SUM(Value) from Basket Where ID_Family =(
						Select ID_Family from Family Where Surname =@FamilySurname))
					Where Surname=@FamilySurName;
--
End;

