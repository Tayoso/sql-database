USE InsightMail
GO

--This sp updates both the account and user tables

CREATE Procedure [uspEditMainUserAccount] 
		@AccountID int,
		@Email nvarchar(50),
		@Phone nvarchar(25),
		@CompanyName nvarchar(50),
		@NumberOfEmployees	int = NULL,
		@Website nvarchar(50),
		@Facebook nvarchar(50) = NULL,
		@Twitter nvarchar(50) = NULL,
		@SalesPerson nvarchar(50) = NULL,
		@UserName nvarchar(50),
		@FirstName nvarchar(50),
		@LastName nvarchar(50),
		@Password varchar(128),
		@UserID int
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			SET NOCOUNT ON
			UPDATE [IM.Account]
			SET	 
           	[Phone] = @Phone
           	,[NumberOfEmployees] = @NumberOfEmployees
           	,[Website] = @LastName 
           	,[Facebook] = @Facebook
			,[Twitter] = @Twitter
			,[SalesPerson] = @SalesPerson
			,[ModifiedDate] = getdate()
			WHERE @AccountID = AccountID
			
			UPDATE [IM.User]
			SET	         
			[UserName] = @UserName
           	,[FirstName] = @FirstName
           	,[LastName] = @LastName 
           	,[PasswordHash] = HASHBYTES ('SHA2_512', @Password)
			,[ModifiedDate] = getdate()
			WHERE UserID = @UserID and UserLevel = 'MainUser' and Email = @Email
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

