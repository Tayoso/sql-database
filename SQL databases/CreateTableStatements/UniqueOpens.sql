USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.UniqueOpens]    Script Date: 5/15/2018 11:41:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IM.UniqueOpens](
	[UniqueOpenID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignID] [int] NOT NULL,
	[ContactID] [int] NOT NULL,
	[UniqueOpenDate] [datetime] NOT NULL,
	[IP] [varbinary](16) NOT NULL,
	[UserAgent] [nvarchar](50) NULL,
	[ForwardID] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UniqueOpenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[IM.UniqueOpens] ADD  DEFAULT (newid()) FOR [rowguid]
GO

