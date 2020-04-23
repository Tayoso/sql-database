USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.UserCampaign]    Script Date: 5/15/2018 11:42:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IM.UserCampaign](
	[UserCampaignID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CampaignID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserCampaignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[IM.UserCampaign] ADD  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [dbo].[IM.UserCampaign]  WITH CHECK ADD  CONSTRAINT [FK_IM.UserCampaign_IM.User] FOREIGN KEY([UserID])
REFERENCES [dbo].[IM.User] ([UserID])
GO

ALTER TABLE [dbo].[IM.UserCampaign] CHECK CONSTRAINT [FK_IM.UserCampaign_IM.User]
GO

