USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.Roles]    Script Date: 5/16/2018 3:13:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IM.Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[UserLevel] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[ModifyAccount] [bit] NOT NULL,
	[ModifyUsers] [bit] NOT NULL,
	[ModifyPermission] [bit] NOT NULL,
	[ModifyContacts] [bit] NOT NULL,
	[ModifyCampaigns] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__IM.Roles__8AFACE3ABAD9F400] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[IM.Roles] ADD  CONSTRAINT [DF__IM.Roles__rowgui__634EBE90]  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [dbo].[IM.Roles]  WITH CHECK ADD  CONSTRAINT [FK_IM.Roles_IM.Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[IM.Account] ([AccountID])
GO

ALTER TABLE [dbo].[IM.Roles] CHECK CONSTRAINT [FK_IM.Roles_IM.Account]
GO

ALTER TABLE [dbo].[IM.Roles]  WITH CHECK ADD  CONSTRAINT [FK_IM.Roles_IM.User] FOREIGN KEY([UserID])
REFERENCES [dbo].[IM.User] ([UserID])
GO

ALTER TABLE [dbo].[IM.Roles] CHECK CONSTRAINT [FK_IM.Roles_IM.User]
GO

