CREATE Procedure [uspEditTemplate]  
			@TemplateID int,
			@TemplateType nchar(25),
			@TemplateName nvarchar(25)
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			SET NOCOUNT ON
			UPDATE [IM.Template]
			SET    	
				[TemplateType] = @TemplateType,
				[TemplateName] = @TemplateName,
				[ModifiedDate] = getdate()
			WHERE TemplateID = @TemplateID and TemplateName = @TemplateName
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		Print 'Error'
		SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_STATE() AS ErrorState,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage
	END CATCH
END
GO
