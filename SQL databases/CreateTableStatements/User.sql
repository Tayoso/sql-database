USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.User]    Script Date: 5/16/2018 3:03:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IM.User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PasswordHash] [varchar](128) NOT NULL,
	[UserLevel] [nvarchar](25) NOT NULL,
	[Activation] [bit] NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__IM.User__1788CCAC413B831D] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[IM.User] ADD  CONSTRAINT [DF__IM.User__Activat__2F10007B]  DEFAULT ((0)) FOR [Activation]
GO

ALTER TABLE [dbo].[IM.User] ADD  CONSTRAINT [DF__IM.User__rowguid__300424B4]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [dbo].[IM.User]  WITH CHECK ADD  CONSTRAINT [FK_IM.User_IM.Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[IM.Account] ([AccountID])
GO

ALTER TABLE [dbo].[IM.User] CHECK CONSTRAINT [FK_IM.User_IM.Account]
GO

