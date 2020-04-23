CREATE Procedure [uspSearchContacts]  
			@search nvarchar(50),
			@ListID int
AS 
BEGIN 
	SET NOCOUNT ON
	SELECT * FROM [IM.Contact]
	WHERE ContactName like '%'+@search+'%' AND ListID = @ListID
	OR ContactEmail like '%'+@search+'%' AND ListID = @ListID
END
