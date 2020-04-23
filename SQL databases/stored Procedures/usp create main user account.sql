USE InsightMail
GO

--This sp updates both the account and user tables

CREATE Procedure [uspAddCompanyAccount]  
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
		@Password varchar(128)
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			SET NOCOUNT ON
			INSERT INTO [IM.Account]
				(
				[Phone]
				,[CompanyName]
				,[NumberOfEmployees]
				,[Website]
				,[Facebook]
				,[Twitter]
				,[SalesPerson]
				,[CreationDate]
				,[ModifiedDate]
				)
			VALUES  
				(
				@Phone
				,@CompanyName
				,@NumberOfEmployees
				,@Website
				,@Facebook
				,@Twitter
				,@SalesPerson
				,getdate()
				,getdate()
				)

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
				(select AccountID from [IM.Account] where @AccountID = AccountID)
				,@Email
				,@UserName
				,@FirstName
				,@LastName
				,HASHBYTES ('SHA2_512', @Password)
				,'MainUser'
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