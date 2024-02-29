USE [Video_Games]
GO

/****** Object:  Table [dbo].[all_critic_reviews]    Script Date: 2/29/2024 4:03:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[all_critic_reviews](
	[cr_score] [float] NULL,
	[Year] [smallint] NOT NULL
) ON [PRIMARY]
GO

