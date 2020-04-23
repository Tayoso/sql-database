USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.CampaignReport]    Script Date: 5/16/2018 3:19:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IM.CampaignReport](
	[CampaignReportID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignID] [int] NOT NULL,
	[Recipients] [int] NOT NULL,
	[SuccessfulDeliveries] [int] NOT NULL,
	[Bounces] [int] NOT NULL,
	[UniqueOpens] [int] NOT NULL,
	[Opens] [int] NOT NULL,
	[OpenRate]  AS (CONVERT([decimal](18,1),(CONVERT([decimal](18,1),[Opens])*(100))/[Recipients])),
	[Unopens] [int] NOT NULL,
	[Forwards] [int] NOT NULL,
	[Unsubscribes] [int] NOT NULL,
	[SpamReports] [int] NOT NULL,
	[Clicks] [int] NOT NULL,
	[ClickRate]  AS (CONVERT([decimal](18,1),(CONVERT([decimal](18,1),[Clicks])*(100))/[Recipients])),
	[SendDate] [datetime] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__IM.Campa__AB783E0675D0FD8A] PRIMARY KEY CLUSTERED 
(
	[CampaignReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[IM.CampaignReport] ADD  CONSTRAINT [DF__IM.Campai__rowgu__01142BA1]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [dbo].[IM.CampaignReport]  WITH CHECK ADD  CONSTRAINT [FK_IM.CampaignReport_IM.Bounces] FOREIGN KEY([Bounces])
REFERENCES [dbo].[IM.Bounces] ([BounceID])
GO

ALTER TABLE [dbo].[IM.CampaignReport] CHECK CONSTRAINT [FK_IM.CampaignReport_IM.Bounces]
GO

ALTER TABLE [dbo].[IM.CampaignReport]  WITH CHECK ADD  CONSTRAINT [FK_IM.CampaignReport_IM.Clicks] FOREIGN KEY([Clicks])
REFERENCES [dbo].[IM.Clicks] ([ClickID])
GO

ALTER TABLE [dbo].[IM.CampaignReport] CHECK CONSTRAINT [FK_IM.CampaignReport_IM.Clicks]
GO

ALTER TABLE [dbo].[IM.CampaignReport]  WITH CHECK ADD  CONSTRAINT [FK_IM.CampaignReport_IM.Forwards] FOREIGN KEY([Forwards])
REFERENCES [dbo].[IM.Forwards] ([ForwardID])
GO

ALTER TABLE [dbo].[IM.CampaignReport] CHECK CONSTRAINT [FK_IM.CampaignReport_IM.Forwards]
GO

ALTER TABLE [dbo].[IM.CampaignReport]  WITH CHECK ADD  CONSTRAINT [FK_IM.CampaignReport_IM.Opens] FOREIGN KEY([Opens])
REFERENCES [dbo].[IM.Opens] ([OpenID])
GO

ALTER TABLE [dbo].[IM.CampaignReport] CHECK CONSTRAINT [FK_IM.CampaignReport_IM.Opens]
GO

ALTER TABLE [dbo].[IM.CampaignReport]  WITH CHECK ADD  CONSTRAINT [FK_IM.CampaignReport_IM.Recipients] FOREIGN KEY([Recipients])
REFERENCES [dbo].[IM.Recipients] ([RecipientID])
GO

ALTER TABLE [dbo].[IM.CampaignReport] CHECK CONSTRAINT [FK_IM.CampaignReport_IM.Recipients]
GO

ALTER TABLE [dbo].[IM.CampaignReport]  WITH CHECK ADD  CONSTRAINT [FK_IM.CampaignReport_IM.SpamReports] FOREIGN KEY([SpamReports])
REFERENCES [dbo].[IM.SpamReports] ([SpamReportID])
GO

ALTER TABLE [dbo].[IM.CampaignReport] CHECK CONSTRAINT [FK_IM.CampaignReport_IM.SpamReports]
GO

ALTER TABLE [dbo].[IM.CampaignReport]  WITH CHECK ADD  CONSTRAINT [FK_IM.CampaignReport_IM.UniqueOpens] FOREIGN KEY([UniqueOpens])
REFERENCES [dbo].[IM.UniqueOpens] ([UniqueOpenID])
GO

ALTER TABLE [dbo].[IM.CampaignReport] CHECK CONSTRAINT [FK_IM.CampaignReport_IM.UniqueOpens]
GO

ALTER TABLE [dbo].[IM.CampaignReport]  WITH CHECK ADD  CONSTRAINT [FK_IM.CampaignReport_IM.Unsubscribes] FOREIGN KEY([Unsubscribes])
REFERENCES [dbo].[IM.Unsubscribes] ([UnsubscribeID])
GO

ALTER TABLE [dbo].[IM.CampaignReport] CHECK CONSTRAINT [FK_IM.CampaignReport_IM.Unsubscribes]
GO

