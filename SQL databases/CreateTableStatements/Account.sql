USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.Account]    Script Date: 5/16/2018 3:13:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IM.Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](25) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[NumberOfEmployees] [int] NULL,
	[Website] [nvarchar](50) NOT NULL,
	[Facebook] [nvarchar](50) NULL,
	[Twitter] [nvarchar](50) NULL,
	[SalesPerson] [nvarchar](50) NULL,
	[Activation] [bit] NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[IM.Account] ADD  DEFAULT ((0)) FOR [Activation]
GO

ALTER TABLE [dbo].[IM.Account] ADD  DEFAULT (newid()) FOR [rowguid]
GO

