USE [MainSchoolDB]
GO
/****** Object:  Table [dbo].[AttendanceTB]    Script Date: 11-01-2023 10:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttendanceTB](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[SRNO] [int] NOT NULL,
	[ADate] [varchar](50) NULL,
	[AAttendance] [varchar](50) NULL,
	[remove_status] [int] NULL,
 CONSTRAINT [PK_AttendanceTB] PRIMARY KEY CLUSTERED 
(
	[SRNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeesTB]    Script Date: 11-01-2023 10:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeesTB](
	[FId] [int] IDENTITY(1,1) NOT NULL,
	[SRNO] [int] NOT NULL,
	[FMoney] [int] NULL,
	[FDate] [varchar](50) NULL,
	[remove_status] [int] NULL,
 CONSTRAINT [PK_FeesTB] PRIMARY KEY CLUSTERED 
(
	[SRNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NotificationTB]    Script Date: 11-01-2023 10:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NotificationTB](
	[NId] [int] IDENTITY(1,1) NOT NULL,
	[NTitle] [varchar](50) NULL,
	[NDate] [varchar](50) NULL,
	[NDescription] [varchar](50) NULL,
	[remove_status] [int] NULL,
 CONSTRAINT [PK_NotificationTB] PRIMARY KEY CLUSTERED 
(
	[NId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResultTB]    Script Date: 11-01-2023 10:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResultTB](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[SRNO] [int] NOT NULL,
	[Total] [int] NULL,
	[Percentage] [varchar](50) NULL,
	[Grade] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[remove_status] [int] NULL,
 CONSTRAINT [PK_ResultTB] PRIMARY KEY CLUSTERED 
(
	[SRNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StaffTB]    Script Date: 11-01-2023 10:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaffTB](
	[Eid] [int] IDENTITY(1,1) NOT NULL,
	[Ename] [varchar](50) NULL,
	[ECourse] [varchar](50) NULL,
	[EEmail] [varchar](50) NULL,
	[EMobile] [bigint] NULL,
	[EPassword] [varchar](50) NULL,
	[roles] [varchar](50) NULL,
	[remove_status] [int] NULL,
 CONSTRAINT [PK_StaffTB] PRIMARY KEY CLUSTERED 
(
	[Eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentTB]    Script Date: 11-01-2023 10:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentTB](
	[SId] [int] IDENTITY(1,1) NOT NULL,
	[SRNO] [int] NOT NULL,
	[SName] [varchar](50) NULL,
	[SEmail] [varchar](50) NULL,
	[SMobile] [bigint] NULL,
	[SDOB] [varchar](50) NULL,
	[SCourse] [varchar](50) NULL,
	[SPassword] [varchar](50) NULL,
	[remove_status] [int] NULL,
 CONSTRAINT [PK_StudentTB] PRIMARY KEY CLUSTERED 
(
	[SRNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
