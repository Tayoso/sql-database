CREATE Procedure [uspRemoveContacts]  
			@ContactID int,
			@ContactName nvarchar(50) = NULL,
			@ContactEmail nvarchar(50),
			@Origin nvarchar(50),
			@ContactRating decimal(2, 1) = NULL,
			@IP varbinary(16) = NULL,
			@SubscriptionStatus bit,
			@GeolocationID int,
			@ListID int
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			SET NOCOUNT ON
			DELETE FROM [IM.Contact]
			WHERE ContactID = @ContactID and ContactName = @ContactName
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
