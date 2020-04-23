CREATE Procedure [uspAddSubUserAccount]  
			@AccountID int,
			@Email nvarchar(50),
			@UserName nvarchar(50),
			@FirstName nvarchar(50),
			@LastName nvarchar(50) = NULL,
			@PasswordHash varchar(128),
			@UserLevel nvarchar(25),
			@Activation bit,
			@CreationDate datetime,
			@ModifiedDate datetime
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			SET NOCOUNT ON
			INSERT INTO [IM.User]
         		(
           		[AccountID]
				,[Email]
           		,[UserName]
           		,[FirstName]
				,[LastName]
           		,[PasswordHash]
           		,[UserLevel]
           		,[Activation]
				,[CreationDate]
				,[ModifiedDate]
				)
			VALUES  
				(
				@AccountID
				,@Email
				,@UserName
				,@FirstName
				,@LastName
				,HASHBYTES ('SHA2_512', @PasswordHash)
				,'SubUser'
				,'0'
				,getdate()
				,getdate()
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