CREATE Procedure [uspEditCampaign]  
			@CampaignID int,
			@CampaignName nvarchar(50),
			@CampaignType nchar(10),
			@Subjectline nvarchar(25),
			@PreviewText nvarchar(50) = NULL,
			@FromName nvarchar(25),
			@FromEmail nvarchar(25),
			@TemplateID int,
			@MailingOptions nvarchar(25),
			@ModifiedDate datetime,
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
			UPDATE [IM.Campaign]
			SET
				[CampaignName] = @CampaignName,
				[CampaignType] = @CampaignType,
				[Subjectline] = @Subjectline,
				[PreviewText] = @PreviewText,
				[FromName] = @FromName,
				[FromEmail] = @FromEmail,
				[TemplateID] = @TemplateID,
				[MailingOptions] = @MailingOptions,
				[ModifiedDate] = getdate(),
				[SendDate] = @SendDate,
				[ListID] = @ListID,
				[CampaignReportID] = @CampaignReportID,
				[CampaignLink] = @CampaignLink,
				[UserCampaignID] = @UserCampaignID,
				[EmailBody] = @EmailBody	
			WHERE CampaignID = @CampaignID
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		Print 'Error - Unable to change user details'
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


