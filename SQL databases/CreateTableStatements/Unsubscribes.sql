USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.Unsubscribes]    Script Date: 5/15/2018 11:41:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IM.Unsubscribes](
	[UnsubscribeID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignID] [int] NOT NULL,
	[ContactID] [int] NOT NULL,
	[UnsubscribeDate] [datetime] NOT NULL,
	[UnsubscribeReasonID] [int] NULL,
	[IP] [varbinary](16) NOT NULL,
	[UserAgent] [nvarchar](50) NULL,
	[ForwardID] [int] NOT NULL,
	[Comments] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UnsubscribeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[IM.Unsubscribes] ADD  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [dbo].[IM.Unsubscribes]  WITH CHECK ADD  CONSTRAINT [FK_IM.Unsubscribes_IM.UnsubscribeReason] FOREIGN KEY([UnsubscribeReasonID])
REFERENCES [dbo].[IM.UnsubscribeReason] ([UnsubscribeReasonID])
GO

ALTER TABLE [dbo].[IM.Unsubscribes] CHECK CONSTRAINT [FK_IM.Unsubscribes_IM.UnsubscribeReason]
GO

