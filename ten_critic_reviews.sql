USE [Video_Games]
GO

/****** Object:  Table [dbo].[ten_critic_reviews]    Script Date: 2/29/2024 4:04:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ten_critic_reviews](
	[cr_score] [float] NULL,
	[cr_games_reviewed] [int] NULL,
	[Year] [smallint] NOT NULL
) ON [PRIMARY]
GO

