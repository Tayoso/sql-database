USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.Payment]    Script Date: 5/15/2018 11:40:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IM.Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](10) NULL,
	[PaymentTotal] [money] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[IM.Payment] ADD  DEFAULT (newid()) FOR [rowguid]
GO

