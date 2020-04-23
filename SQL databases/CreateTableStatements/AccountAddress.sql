USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.AccountAddress]    Script Date: 5/15/2018 11:38:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IM.AccountAddress](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[AddressType] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__IM.Accou__349DA586E0BE25F6] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[IM.AccountAddress] ADD  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [dbo].[IM.AccountAddress]  WITH CHECK ADD  CONSTRAINT [FK_IM.AccountAddress_IM.Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[IM.Account] ([AccountID])
GO

ALTER TABLE [dbo].[IM.AccountAddress] CHECK CONSTRAINT [FK_IM.AccountAddress_IM.Account]
GO

ALTER TABLE [dbo].[IM.AccountAddress]  WITH CHECK ADD  CONSTRAINT [FK_IM.AccountAddress_IM.Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[IM.Address] ([AddressID])
GO

ALTER TABLE [dbo].[IM.AccountAddress] CHECK CONSTRAINT [FK_IM.AccountAddress_IM.Address]
GO

