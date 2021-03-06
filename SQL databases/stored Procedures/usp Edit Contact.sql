CREATE Procedure [uspEditContacts]  
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
			UPDATE [IM.Contact]
			SET
				[ContactName] = @ContactName
				,[ContactEmail] = @ContactEmail
				,[Origin] = @Origin
				,[ModifiedDate] = getdate()
				,[ContactRating] = @ContactRating
				,[IP] = @IP
				,[SusbscriptionStatus] = '1'
				,[GeolocationID] = @GeolocationID
				,[ListID] = @ListID			
			WHERE ContactID = @ContactID
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		Print 'Error - Unable to change contact details'
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
