CREATE Procedure [uspDeactivateUserAccount]  
	@Email nvarchar(50),
   	@Password nvarchar(128)
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			SET NOCOUNT ON
			DECLARE @UserID int
			DECLARE @UserLevel nvarchar(25)
			SELECT @UserID = UserID
			FROM [IM.User] WHERE Email = @Email AND [PasswordHash] = HASHBYTES ('SHA2_512', @Password)
				 IF @UserId IS NOT NULL
				 BEGIN
					IF (SELECT Email FROM [IM.User] WHERE UserID = @UserID) = 'True'
					BEGIN
						UPDATE [IM.User]
						SET Activation = 0
						WHERE UserID = @UserID AND UserLevel = 'MainUser'
						SELECT 1 -- User Deactivated
					END
				END
				ELSE
				BEGIN
				SELECT 0 -- Error!
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		Print 'Error - Could not complete deactivation process'
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
