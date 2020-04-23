USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.AccountClosure]    Script Date: 5/15/2018 11:38:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IM.AccountClosure](
	[AccountClosureID] [int] IDENTITY(1,1) NOT NULL,
	[AccountClosureReason] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[AccountID] [int] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountClosureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[IM.AccountClosure] ADD  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [dbo].[IM.AccountClosure]  WITH CHECK ADD  CONSTRAINT [FK_IM.AccountClosure_IM.Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[IM.Account] ([AccountID])
GO

ALTER TABLE [dbo].[IM.AccountClosure] CHECK CONSTRAINT [FK_IM.AccountClosure_IM.Account]
GO

