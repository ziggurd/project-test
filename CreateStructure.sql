
  -- Cоздание таблицы dbo.SKU---
  IF OBJECT_ID('dbo.SKU', 'U') IS NOT NULL DROP TABLE dbo.SKU;
  Create table dbo.SKU (
	ID INT identity primary key
	,Code Varchar (20)
	,Name Varchar(100)
	,Constraint UQ_SKU_Code Unique (Code)
  );

  --Создание вычисляемого поля Code								Column names in each table must be unique. Column name 'Code' in table 'dbo.SKU' is specified more than once.
  Alter table dbo.SKU
  ADD Code AS 's'--+CAST(ID as varchar(10));
  
  --создание таблицы dbo.Family
  IF OBJECT_ID('dbo.Family', 'U') IS NOT NULL DROP TABLE dbo.Family;
  create Table dbo.Family (
	 ID Int Identity Primary Key
	 ,SurName Varchar(100)
	 ,BudgetValue Decimal(18,2)
  );
  --Создание таблицы dbo.Basket
  IF OBJECT_ID('dbo.Basket', 'U') IS NOT NULL DROP TABLE dbo.Basket;
  Create table dbo.Basket (
	 ID int Identity primary Key
	,ID_SKU int foreign key references dbo.SKU(ID)
	,ID_Family int foreign key references dbo.family(ID)
	,quantity INT check (Quantity>=0)
	,Value decimal(18,2) check (Value>=0)
	,PurchaseDate Date Default getdate()
	,DiscountValue Decimal(18,2)
  );