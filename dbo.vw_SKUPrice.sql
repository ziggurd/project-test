
--создаем представление--
create View dbo.vw_SKUPrice
as
Select SKU.*, dbo.udf_GetSKUPrice(SKU.ID) AS Price From dbo.SKU;