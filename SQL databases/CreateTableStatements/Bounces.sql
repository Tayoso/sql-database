USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.Bounces]    Script Date: 5/15/2018 11:39:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IM.Bounces](
	[BounceID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignID] [int] NOT NULL,
	[ContactID] [int] NOT NULL,
	[BounceDate] [datetime] NOT NULL,
	[BounceReasonID] [int] NULL,
	[ForwardID] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BounceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[IM.Bounces] ADD  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [dbo].[IM.Bounces]  WITH CHECK ADD  CONSTRAINT [FK_IM.Bounces_IM.BounceReason] FOREIGN KEY([BounceReasonID])
REFERENCES [dbo].[IM.BounceReason] ([BounceReasonID])
GO

ALTER TABLE [dbo].[IM.Bounces] CHECK CONSTRAINT [FK_IM.Bounces_IM.BounceReason]
GO

