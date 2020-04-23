USE InsightMail
GO

CREATE Procedure [uspAddCampaign]  
			@CampaignType nchar(10),
			@Subjectline nvarchar(25),
			@PreviewText nvarchar(50) = NULL,
			@FromName nvarchar(25),
			@FromEmail nvarchar(25),
			@TemplateID int,
			@MailingOptions nvarchar(25),
			@SendDate datetime = NULL,
			@ListID int,
			@CampaignReportID int,
			@CampaignLink nvarchar(50),
			@UserCampaignID int,
			@EmailBody nvarchar(50)
AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION
			SET NOCOUNT ON
			INSERT INTO [IM.Campaign]
         		(
				[CampaignType],
				[Subjectline],
				[PreviewText],
				[FromName],
				[FromEmail],
				[TemplateID],
				[MailingOptions],
				[CreationDate],
				[ModifiedDate],
				[SendDate],
				[ListID],
				[CampaignReportID],
				[CampaignLink],
				[UserCampaignID],
				[EmailBody]
			 	)
			VALUES  
				(
				@CampaignType,
				@Subjectline,
				@PreviewText,
				@FromName,
				@FromEmail,
				@TemplateID,
				@MailingOptions,
				getdate(),
				getdate(),
				@SendDate,
				@ListID,
				@CampaignReportID,
				@CampaignLink,
				@UserCampaignID,
				@EmailBody
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