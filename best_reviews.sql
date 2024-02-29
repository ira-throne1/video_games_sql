USE [Video_Games]
GO

/****** Object:  Table [dbo].[best_reviews]    Script Date: 2/29/2024 4:03:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[best_reviews](
	[cr_score] [float] NULL,
	[cr_games_reviewed] [int] NULL,
	[us_score] [float] NULL,
	[us_games_reviewed] [int] NULL,
	[Year] [smallint] NOT NULL
) ON [PRIMARY]
GO

