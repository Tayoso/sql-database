USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.Campaign]    Script Date: 5/18/2018 9:17:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IM.Campaign](
	[CampaignID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignName] [nvarchar](50) NOT NULL,
	[CampaignType] [nchar](10) NOT NULL,
	[Subjectline] [nvarchar](25) NOT NULL,
	[PreviewText] [nvarchar](50) NULL,
	[FromName] [nvarchar](25) NOT NULL,
	[FromEmail] [nvarchar](25) NOT NULL,
	[TemplateID] [int] NOT NULL,
	[MailingOptions] [nvarchar](25) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SendDate] [datetime] NULL,
	[ListID] [int] NOT NULL,
	[CampaignReportID] [int] NOT NULL,
	[CampaignLink] [nvarchar](50) NOT NULL,
	[UserCampaignID] [int] NOT NULL,
	[EmailBody] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__IM.Campa__3F5E8D797312F877] PRIMARY KEY CLUSTERED 
(
	[CampaignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[IM.Campaign] ADD  CONSTRAINT [DF__IM.Campai__rowgu__7B5B524B]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [dbo].[IM.Campaign]  WITH CHECK ADD  CONSTRAINT [FK_IM.Campaign_IM.CampaignReport] FOREIGN KEY([CampaignReportID])
REFERENCES [dbo].[IM.CampaignReport] ([CampaignReportID])
GO

ALTER TABLE [dbo].[IM.Campaign] CHECK CONSTRAINT [FK_IM.Campaign_IM.CampaignReport]
GO

ALTER TABLE [dbo].[IM.Campaign]  WITH CHECK ADD  CONSTRAINT [FK_IM.Campaign_IM.List] FOREIGN KEY([ListID])
REFERENCES [dbo].[IM.List] ([ListID])
GO

ALTER TABLE [dbo].[IM.Campaign] CHECK CONSTRAINT [FK_IM.Campaign_IM.List]
GO

ALTER TABLE [dbo].[IM.Campaign]  WITH CHECK ADD  CONSTRAINT [FK_IM.Campaign_IM.Template] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[IM.Template] ([TemplateID])
GO

ALTER TABLE [dbo].[IM.Campaign] CHECK CONSTRAINT [FK_IM.Campaign_IM.Template]
GO

ALTER TABLE [dbo].[IM.Campaign]  WITH CHECK ADD  CONSTRAINT [FK_IM.Campaign_IM.UserCampaign] FOREIGN KEY([UserCampaignID])
REFERENCES [dbo].[IM.UserCampaign] ([UserCampaignID])
GO

ALTER TABLE [dbo].[IM.Campaign] CHECK CONSTRAINT [FK_IM.Campaign_IM.UserCampaign]
GO

