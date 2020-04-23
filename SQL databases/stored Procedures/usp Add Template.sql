CREATE Procedure [uspAddTemplate]  
			@TemplateType nchar(25),
			@TemplateName nvarchar(25)
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			SET NOCOUNT ON
			INSERT INTO [IM.Template]
         		(
				[TemplateType],
				[TemplateName],
				[CreationDate],
				[ModifiedDate]
           		)
			VALUES  
				(
				@TemplateType,
				@TemplateName,
				getdate(),
				getdate()
				)
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
