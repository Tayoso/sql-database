CREATE Procedure [uspRemoveSubUser]  
			@UserID int,
			@AccountID int,
			@Email nvarchar(50),
			@UserName nvarchar(50),
			@FirstName nvarchar(50),
			@LastName nvarchar(50) = NULL,
			@PasswordHash varchar(128),
			@UserLevel nvarchar(25)
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			SET NOCOUNT ON
			DELETE FROM [IM.User]
			WHERE UserID = @UserID and UserLevel = 'SubUser' and Email = @Email
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		Print 'Error - Unable to delete user details'
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
