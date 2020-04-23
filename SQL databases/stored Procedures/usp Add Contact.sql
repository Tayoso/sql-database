CREATE Procedure [uspAddContacts]  
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
			INSERT INTO [IM.Contact]
         		(
				[ContactID]
				,[ContactName]
				,[ContactEmail]
				,[Origin]
				,[CreationDate]
				,[ModifiedDate]
				,[ContactRating]
				,[IP]
				,[SusbscriptionStatus]
				,[GeolocationID]
				,[ListID]
				)
			VALUES  
				(
				@ContactID,
				@ContactName,
				@ContactEmail,
				@Origin,
				getdate(),
				getdate(),
				@ContactRating,
				@IP,
				'1',
				@GeolocationID,
				@ListID
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