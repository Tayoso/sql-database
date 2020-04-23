CREATE Procedure [uspSearchCampaign]  
			@search nvarchar(50),
			@CampaignID int,
			@CampaignName nvarchar(50),
			@CampaignType nchar(10)
AS 
BEGIN 
	SET NOCOUNT ON
	SELECT * FROM [IM.Campaign]
	WHERE CampaignName like '%'+@search+'%' AND CampaignID = @CampaignID
	OR CampaignType like '%'+@search+'%' AND CampaignID = @CampaignID
END
