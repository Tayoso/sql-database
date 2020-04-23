USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.Contact]    Script Date: 5/15/2018 11:39:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IM.Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[ContactEmail] [nvarchar](50) NOT NULL,
	[Origin] [nvarchar](50) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ContactRating] [decimal](2, 1) NULL,
	[IP] [varbinary](16) NULL,
	[SusbscriptionStatus] [bit] NOT NULL,
	[GeolocationID] [int] NOT NULL,
	[ListID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[IM.Contact] ADD  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [dbo].[IM.Contact]  WITH CHECK ADD  CONSTRAINT [FK_IM.Contact_IM.Geolocation] FOREIGN KEY([GeolocationID])
REFERENCES [dbo].[IM.Geolocation] ([GeolocationID])
GO

ALTER TABLE [dbo].[IM.Contact] CHECK CONSTRAINT [FK_IM.Contact_IM.Geolocation]
GO

ALTER TABLE [dbo].[IM.Contact]  WITH CHECK ADD  CONSTRAINT [FK_IM.Contact_IM.List] FOREIGN KEY([ListID])
REFERENCES [dbo].[IM.List] ([ListID])
GO

ALTER TABLE [dbo].[IM.Contact] CHECK CONSTRAINT [FK_IM.Contact_IM.List]
GO

