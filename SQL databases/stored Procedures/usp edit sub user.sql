CREATE Procedure [uspEditSubUser]  
			@UserID int,
			@Email nvarchar(50),
			@UserName nvarchar(50),
			@FirstName nvarchar(50),
			@LastName nvarchar(50) = NULL,
			@Password varchar(128),
			@ModifiedDate datetime
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			SET NOCOUNT ON
			UPDATE [IM.User]
			SET	         
				[UserName] = @UserName
           		,[FirstName] = @FirstName
           		,[LastName] = @LastName 
           		,[PasswordHash] = HASHBYTES ('SHA2_512', @Password)
				,[ModifiedDate] = getdate()
			WHERE UserID = @UserID and UserLevel = 'SubUser' and Email = @Email
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		Print 'Error - Unable to change user account details'
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

