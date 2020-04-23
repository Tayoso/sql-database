USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.Plans]    Script Date: 5/15/2018 11:40:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IM.Plans](
	[PlanID] [int] IDENTITY(1,1) NOT NULL,
	[PlanName] [nvarchar](50) NOT NULL,
	[PlanType] [nchar](10) NULL,
	[PlanDuration] [nchar](10) NULL,
	[PlanPrice] [money] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[IM.Plans] ADD  DEFAULT ('Basic') FOR [PlanName]
GO

ALTER TABLE [dbo].[IM.Plans] ADD  DEFAULT ('0') FOR [PlanPrice]
GO

ALTER TABLE [dbo].[IM.Plans] ADD  DEFAULT (newid()) FOR [rowguid]
GO

