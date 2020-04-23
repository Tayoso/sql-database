CREATE Procedure [uspSearchTemplate]  
			@search nvarchar(50),
			@TemplateID int,
			@TemplateType nchar(25),
			@TemplateName nvarchar(25)
AS 
BEGIN 
	SET NOCOUNT ON
	SELECT * FROM [IM.Template]
    WHERE TemplateName like '%'+@search+'%' AND TemplateID = @TemplateID
	OR TemplateType like '%'+@search+'%' AND TemplateID = @TemplateID 
END
