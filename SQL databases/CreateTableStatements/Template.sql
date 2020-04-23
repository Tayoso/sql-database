USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.Template]    Script Date: 5/15/2018 11:47:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IM.Template](
	[TemplateID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateType] [nchar](25) NOT NULL,
	[TemplateName] [nvarchar](25) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__IM.Templ__F87ADD078DE683C7] PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[IM.Template] ADD  CONSTRAINT [DF__IM.Templa__rowgu__47DBAE45]  DEFAULT (newid()) FOR [rowguid]
GO

