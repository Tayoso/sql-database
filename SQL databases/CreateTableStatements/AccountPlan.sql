USE [InsightMail]
GO

/****** Object:  Table [dbo].[IM.AccountPlan]    Script Date: 5/15/2018 11:38:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IM.AccountPlan](
	[AccountPlanID] [int] IDENTITY(1,1) NOT NULL,
	[PlanID] [int] NOT NULL,
	[PlanStatusID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[PaymentOrderNumber] [int] NOT NULL,
	[PaymentID] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountPlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[IM.AccountPlan] ADD  DEFAULT (newid()) FOR [rowguid]
GO

ALTER TABLE [dbo].[IM.AccountPlan]  WITH CHECK ADD  CONSTRAINT [FK_IM.AccountPlan_IM.Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[IM.Account] ([AccountID])
GO

ALTER TABLE [dbo].[IM.AccountPlan] CHECK CONSTRAINT [FK_IM.AccountPlan_IM.Account]
GO

ALTER TABLE [dbo].[IM.AccountPlan]  WITH CHECK ADD  CONSTRAINT [FK_IM.AccountPlan_IM.Payment] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[IM.Payment] ([PaymentID])
GO

ALTER TABLE [dbo].[IM.AccountPlan] CHECK CONSTRAINT [FK_IM.AccountPlan_IM.Payment]
GO

ALTER TABLE [dbo].[IM.AccountPlan]  WITH CHECK ADD  CONSTRAINT [FK_IM.AccountPlan_IM.Plans] FOREIGN KEY([PlanID])
REFERENCES [dbo].[IM.Plans] ([PlanID])
GO

ALTER TABLE [dbo].[IM.AccountPlan] CHECK CONSTRAINT [FK_IM.AccountPlan_IM.Plans]
GO

