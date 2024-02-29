USE [Video_Games]
GO

/****** Object:  Table [dbo].[ten_user_reviews]    Script Date: 2/29/2024 4:04:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ten_user_reviews](
	[us_score] [float] NULL,
	[us_games_reviewed] [int] NULL,
	[Year] [smallint] NOT NULL
) ON [PRIMARY]
GO

