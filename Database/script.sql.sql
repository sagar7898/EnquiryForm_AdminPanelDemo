USE [db_MvcCore_EnquiryTask]
GO
/****** Object:  Table [dbo].[tbl_candidateDetails]    Script Date: 5/11/2025 10:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_candidateDetails](
	[candidate_id] [int] IDENTITY(1,1) NOT NULL,
	[candidate_name] [varchar](100) NOT NULL,
	[mobile_number] [varchar](20) NULL,
	[local_address] [varchar](100) NULL,
	[email_address] [varchar](50) NULL,
	[birthdate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[candidate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_candidate_qualification]    Script Date: 5/11/2025 10:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_candidate_qualification](
	[candidate_qualification_id] [int] IDENTITY(1,1) NOT NULL,
	[candidate_id] [int] NULL,
	[specialization_id] [int] NULL,
	[university] [varchar](100) NULL,
	[passingYear] [int] NULL,
	[medium] [varchar](10) NULL,
	[percentage] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[candidate_qualification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_candidate_enquiries]    Script Date: 5/11/2025 10:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_candidate_enquiries](
	[candidate_enquiries_id] [int] IDENTITY(1,1) NOT NULL,
	[candidate_id] [int] NULL,
	[enquiry_date] [date] NULL,
	[enquiry_for] [varchar](100) NULL,
	[enquiry_sources] [varchar](100) NULL,
	[training_topics] [varchar](100) NULL,
	[status] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[candidate_enquiries_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_candidate_specializations]    Script Date: 5/11/2025 10:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_candidate_specializations](
	[candidate_specialization_id] [int] IDENTITY(1,1) NOT NULL,
	[candidate_id] [int] NULL,
	[course_name] [varchar](50) NULL,
	[institute_name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[candidate_specialization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vtbl_candidate_data]    Script Date: 5/11/2025 10:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create View [dbo].[Vtbl_candidate_data] as select a.candidate_id,candidate_name,mobile_number,local_address,email_address,birthdate,specialization_id,university,passingYear,medium,percentage,course_name,institute_name from tbl_candidateDetails a join tbl_candidate_qualification b on a.candidate_id=b.candidate_id join tbl_candidate_specializations c on b.candidate_id=c.candidate_id join tbl_candidate_enquiries d on c.candidate_id=d.candidate_enquiries_id
GO
/****** Object:  Table [dbo].[tbl_enquiryFors]    Script Date: 5/11/2025 10:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_enquiryFors](
	[enquiry_id] [int] IDENTITY(1,1) NOT NULL,
	[enquiry_for] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[enquiry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Festivals]    Script Date: 5/11/2025 10:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Festivals](
	[festival_id] [int] IDENTITY(1,1) NOT NULL,
	[festival_name] [varchar](100) NULL,
	[festival_date] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[festival_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_followups]    Script Date: 5/11/2025 10:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_followups](
	[followup_id] [int] IDENTITY(1,1) NOT NULL,
	[candidate_enquiries_id] [int] NULL,
	[followup_date] [date] NULL,
	[followup_by] [varchar](100) NULL,
	[description] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[followup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_qualifications]    Script Date: 5/11/2025 10:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_qualifications](
	[qualification_id] [int] IDENTITY(1,1) NOT NULL,
	[qualification_name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[qualification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sources]    Script Date: 5/11/2025 10:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sources](
	[source_id] [int] IDENTITY(1,1) NOT NULL,
	[source_name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[source_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_specializations]    Script Date: 5/11/2025 10:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_specializations](
	[specialization_id] [int] IDENTITY(1,1) NOT NULL,
	[specialization_name] [varchar](100) NULL,
	[qualification_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[specialization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_trainingTopics]    Script Date: 5/11/2025 10:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_trainingTopics](
	[topic_id] [int] IDENTITY(1,1) NOT NULL,
	[topic_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_candidate_enquiries] ON 

INSERT [dbo].[tbl_candidate_enquiries] ([candidate_enquiries_id], [candidate_id], [enquiry_date], [enquiry_for], [enquiry_sources], [training_topics], [status]) VALUES (1, 5, CAST(N'2024-04-03' AS Date), N'Certification,Job Placement,College Project	,Internship', N'Email,Friend', N'.NET Core Web Apis,Asp.Net MVC,Data Structure,Machine Learning', N'Success')
INSERT [dbo].[tbl_candidate_enquiries] ([candidate_enquiries_id], [candidate_id], [enquiry_date], [enquiry_for], [enquiry_sources], [training_topics], [status]) VALUES (2, 4, CAST(N'2024-07-01' AS Date), N'Certification,Job Placement', N'Email', N'Asp.Net Mvc', N'success')
INSERT [dbo].[tbl_candidate_enquiries] ([candidate_enquiries_id], [candidate_id], [enquiry_date], [enquiry_for], [enquiry_sources], [training_topics], [status]) VALUES (3, 6, CAST(N'2024-04-03' AS Date), N'Certification,College Project	', N'Email,Other', N'.NET Core Web Apis,Asp.Net MVC', N'Success')
INSERT [dbo].[tbl_candidate_enquiries] ([candidate_enquiries_id], [candidate_id], [enquiry_date], [enquiry_for], [enquiry_sources], [training_topics], [status]) VALUES (4, 7, CAST(N'2024-04-03' AS Date), N'Certification,College Project	', N'Email,Other', N'.NET Core Web Apis,Asp.Net MVC', N'Success')
INSERT [dbo].[tbl_candidate_enquiries] ([candidate_enquiries_id], [candidate_id], [enquiry_date], [enquiry_for], [enquiry_sources], [training_topics], [status]) VALUES (6, 8, CAST(N'2024-04-03' AS Date), N'Certification,College Project	', N'Email,Other', N'.NET Core Web Apis,Asp.Net MVC', N'Success')
INSERT [dbo].[tbl_candidate_enquiries] ([candidate_enquiries_id], [candidate_id], [enquiry_date], [enquiry_for], [enquiry_sources], [training_topics], [status]) VALUES (7, 9, CAST(N'2024-04-03' AS Date), N'Certification,College Project	', N'Email,Other', N'.NET Core Web Apis,Asp.Net MVC', N'Success')
INSERT [dbo].[tbl_candidate_enquiries] ([candidate_enquiries_id], [candidate_id], [enquiry_date], [enquiry_for], [enquiry_sources], [training_topics], [status]) VALUES (8, 10, CAST(N'2024-04-03' AS Date), N'Certification,College Project	', N'Email,Friend', N'Data Structure,Machine Learning', N'Success')
INSERT [dbo].[tbl_candidate_enquiries] ([candidate_enquiries_id], [candidate_id], [enquiry_date], [enquiry_for], [enquiry_sources], [training_topics], [status]) VALUES (9, 11, CAST(N'2024-02-03' AS Date), N'Certification,College Project	', N'Email,Friend', N'Asp.Net MVC,C-Sharp', N'Success')
INSERT [dbo].[tbl_candidate_enquiries] ([candidate_enquiries_id], [candidate_id], [enquiry_date], [enquiry_for], [enquiry_sources], [training_topics], [status]) VALUES (10, 13, CAST(N'2024-02-03' AS Date), N'Job Placement,College Project	,Internship', N'Friend,Poster', N'ADO.NET,C-Sharp,DJango', N'Success')
INSERT [dbo].[tbl_candidate_enquiries] ([candidate_enquiries_id], [candidate_id], [enquiry_date], [enquiry_for], [enquiry_sources], [training_topics], [status]) VALUES (11, 14, CAST(N'2024-07-28' AS Date), N'Certification,Job Placement,College Project	', N'Other', N'.NET Core Web Apis,Asp.Net MVC', N'Success')
SET IDENTITY_INSERT [dbo].[tbl_candidate_enquiries] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_candidate_qualification] ON 

INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (3, 5, 21, N'pune', 2012, N'english', 85)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (4, 5, 17, N'pune', 2022, N'english', 96)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (5, 4, 21, N'pune', 2012, N'english', 85)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (6, 4, 21, N'pune', 2022, N'english', 85)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (7, 6, 21, N'pune', 2020, N'english', 78)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (8, 7, 9, N'pune', 2020, N'english', 96)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (9, 8, 21, N'jkbj', 985, N'huh', 21)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (10, 9, 21, N'pue', 2020, N'english', 78)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (11, 10, 9, N'pune', 2020, N'english', 96)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (12, 10, 1, N'pune', 2022, N'english', 65)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (13, 11, 9, N'pune', 2020, N'english', 58)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (14, 13, 9, N'pune', 2020, N'english', 52)
INSERT [dbo].[tbl_candidate_qualification] ([candidate_qualification_id], [candidate_id], [specialization_id], [university], [passingYear], [medium], [percentage]) VALUES (15, 14, 17, N'ss', 231, N'dd', 22)
SET IDENTITY_INSERT [dbo].[tbl_candidate_qualification] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_candidate_specializations] ON 

INSERT [dbo].[tbl_candidate_specializations] ([candidate_specialization_id], [candidate_id], [course_name], [institute_name]) VALUES (1, 5, N'computer', N'pune')
INSERT [dbo].[tbl_candidate_specializations] ([candidate_specialization_id], [candidate_id], [course_name], [institute_name]) VALUES (2, 4, N'computer', N'pune')
INSERT [dbo].[tbl_candidate_specializations] ([candidate_specialization_id], [candidate_id], [course_name], [institute_name]) VALUES (3, 6, N'ciit', N'pune')
INSERT [dbo].[tbl_candidate_specializations] ([candidate_specialization_id], [candidate_id], [course_name], [institute_name]) VALUES (4, 7, N'computer', N'pune')
INSERT [dbo].[tbl_candidate_specializations] ([candidate_specialization_id], [candidate_id], [course_name], [institute_name]) VALUES (5, 8, N'bgyu', N' bhjbh')
INSERT [dbo].[tbl_candidate_specializations] ([candidate_specialization_id], [candidate_id], [course_name], [institute_name]) VALUES (6, 9, N'wwww', N'qqq')
INSERT [dbo].[tbl_candidate_specializations] ([candidate_specialization_id], [candidate_id], [course_name], [institute_name]) VALUES (7, 10, N'.Net Developer', N'CIIT Instistute')
INSERT [dbo].[tbl_candidate_specializations] ([candidate_specialization_id], [candidate_id], [course_name], [institute_name]) VALUES (8, 11, NULL, NULL)
INSERT [dbo].[tbl_candidate_specializations] ([candidate_specialization_id], [candidate_id], [course_name], [institute_name]) VALUES (9, 13, N'bsc', N'ciit')
INSERT [dbo].[tbl_candidate_specializations] ([candidate_specialization_id], [candidate_id], [course_name], [institute_name]) VALUES (10, 14, N'ss', N'aa')
SET IDENTITY_INSERT [dbo].[tbl_candidate_specializations] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_candidateDetails] ON 

INSERT [dbo].[tbl_candidateDetails] ([candidate_id], [candidate_name], [mobile_number], [local_address], [email_address], [birthdate]) VALUES (4, N'sagar', N'962320145', N'mk n sns s  s iiiis is s ss', N'sagarnachankar77@gmail.com', CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbl_candidateDetails] ([candidate_id], [candidate_name], [mobile_number], [local_address], [email_address], [birthdate]) VALUES (5, N'sagar nachankar', N'9623302014', N'hadapsar pune', N'sagarnachnakar77@gmail.com', CAST(N'2024-07-10' AS Date))
INSERT [dbo].[tbl_candidateDetails] ([candidate_id], [candidate_name], [mobile_number], [local_address], [email_address], [birthdate]) VALUES (6, N'rutuja bodke', N'9623302014', N'Hadapsar
', N'rutujabodke17@gmail.com', CAST(N'2024-07-05' AS Date))
INSERT [dbo].[tbl_candidateDetails] ([candidate_id], [candidate_name], [mobile_number], [local_address], [email_address], [birthdate]) VALUES (7, N'Rutuja Bodke', N'90204587898', N'160 B TELI WADI SOMESHWAR RATNAGIRI', N'rutujabodke17@gmail.com', CAST(N'2024-07-20' AS Date))
INSERT [dbo].[tbl_candidateDetails] ([candidate_id], [candidate_name], [mobile_number], [local_address], [email_address], [birthdate]) VALUES (8, N'ndjkh', N'9855', N'jbu', N'9797987', CAST(N'2024-07-17' AS Date))
INSERT [dbo].[tbl_candidateDetails] ([candidate_id], [candidate_name], [mobile_number], [local_address], [email_address], [birthdate]) VALUES (9, N'sagar', N'69854', N'hadapsar', N'sadfg', CAST(N'2024-07-03' AS Date))
INSERT [dbo].[tbl_candidateDetails] ([candidate_id], [candidate_name], [mobile_number], [local_address], [email_address], [birthdate]) VALUES (10, N'Akash Nachankar', N'9623302014', N'hadapsar pune 28', N'rutujabodke17@gmail.com', CAST(N'2024-07-16' AS Date))
INSERT [dbo].[tbl_candidateDetails] ([candidate_id], [candidate_name], [mobile_number], [local_address], [email_address], [birthdate]) VALUES (11, N'prasad Sanas', N'965241253', N'hadapsar pune', N'rutujabodke17@gmail.com', CAST(N'2024-07-16' AS Date))
INSERT [dbo].[tbl_candidateDetails] ([candidate_id], [candidate_name], [mobile_number], [local_address], [email_address], [birthdate]) VALUES (13, N'SAGAR NACHANKAR', N'09623302014', N'Hadapsar
', N'rutujabodke17@gmail.com', CAST(N'2024-07-11' AS Date))
INSERT [dbo].[tbl_candidateDetails] ([candidate_id], [candidate_name], [mobile_number], [local_address], [email_address], [birthdate]) VALUES (14, N'akaksh', N'5444522111', N'hasappse', N'rutujabodke@gmail.com', CAST(N'2024-07-12' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_candidateDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_enquiryFors] ON 

INSERT [dbo].[tbl_enquiryFors] ([enquiry_id], [enquiry_for]) VALUES (1, N'Certification')
INSERT [dbo].[tbl_enquiryFors] ([enquiry_id], [enquiry_for]) VALUES (2, N'Job Placement')
INSERT [dbo].[tbl_enquiryFors] ([enquiry_id], [enquiry_for]) VALUES (3, N'Corporate Training')
INSERT [dbo].[tbl_enquiryFors] ([enquiry_id], [enquiry_for]) VALUES (4, N'College Project	')
INSERT [dbo].[tbl_enquiryFors] ([enquiry_id], [enquiry_for]) VALUES (5, N'Internship')
SET IDENTITY_INSERT [dbo].[tbl_enquiryFors] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Festivals] ON 

INSERT [dbo].[tbl_Festivals] ([festival_id], [festival_name], [festival_date]) VALUES (1, N'New Year’s Day', N'31-12')
INSERT [dbo].[tbl_Festivals] ([festival_id], [festival_name], [festival_date]) VALUES (2, N'Gandhi Jayanti', N'05-02')
INSERT [dbo].[tbl_Festivals] ([festival_id], [festival_name], [festival_date]) VALUES (3, N'Christmas', N'25-12')
SET IDENTITY_INSERT [dbo].[tbl_Festivals] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_followups] ON 

INSERT [dbo].[tbl_followups] ([followup_id], [candidate_enquiries_id], [followup_date], [followup_by], [description]) VALUES (1, 1, CAST(N'2024-07-01' AS Date), N'sagar', N'call not received')
INSERT [dbo].[tbl_followups] ([followup_id], [candidate_enquiries_id], [followup_date], [followup_by], [description]) VALUES (2, 1, CAST(N'2024-07-22' AS Date), N'sagar', N'join on monday')
INSERT [dbo].[tbl_followups] ([followup_id], [candidate_enquiries_id], [followup_date], [followup_by], [description]) VALUES (3, 2, CAST(N'2024-07-17' AS Date), N'sagar', N'call not recieved')
INSERT [dbo].[tbl_followups] ([followup_id], [candidate_enquiries_id], [followup_date], [followup_by], [description]) VALUES (4, 2, CAST(N'2024-07-24' AS Date), N'sagar', N'dghch')
INSERT [dbo].[tbl_followups] ([followup_id], [candidate_enquiries_id], [followup_date], [followup_by], [description]) VALUES (5, 2, CAST(N'2024-07-26' AS Date), N'sagar', N'call not recieved')
INSERT [dbo].[tbl_followups] ([followup_id], [candidate_enquiries_id], [followup_date], [followup_by], [description]) VALUES (6, 1, CAST(N'2024-07-03' AS Date), N'sagar', N'no comments')
SET IDENTITY_INSERT [dbo].[tbl_followups] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_qualifications] ON 

INSERT [dbo].[tbl_qualifications] ([qualification_id], [qualification_name]) VALUES (7, N'B.E.')
INSERT [dbo].[tbl_qualifications] ([qualification_id], [qualification_name]) VALUES (4, N'B.sc.')
INSERT [dbo].[tbl_qualifications] ([qualification_id], [qualification_name]) VALUES (6, N'BCA')
INSERT [dbo].[tbl_qualifications] ([qualification_id], [qualification_name]) VALUES (3, N'Diploma')
INSERT [dbo].[tbl_qualifications] ([qualification_id], [qualification_name]) VALUES (2, N'HSC')
INSERT [dbo].[tbl_qualifications] ([qualification_id], [qualification_name]) VALUES (5, N'MBBS')
INSERT [dbo].[tbl_qualifications] ([qualification_id], [qualification_name]) VALUES (8, N'Pharmacy')
INSERT [dbo].[tbl_qualifications] ([qualification_id], [qualification_name]) VALUES (1, N'SSC')
SET IDENTITY_INSERT [dbo].[tbl_qualifications] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_sources] ON 

INSERT [dbo].[tbl_sources] ([source_id], [source_name]) VALUES (2, N'Email')
INSERT [dbo].[tbl_sources] ([source_id], [source_name]) VALUES (1, N'Friend')
INSERT [dbo].[tbl_sources] ([source_id], [source_name]) VALUES (3, N'Newspaper')
INSERT [dbo].[tbl_sources] ([source_id], [source_name]) VALUES (6, N'Other')
INSERT [dbo].[tbl_sources] ([source_id], [source_name]) VALUES (5, N'Poster')
INSERT [dbo].[tbl_sources] ([source_id], [source_name]) VALUES (4, N'Social media')
SET IDENTITY_INSERT [dbo].[tbl_sources] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_specializations] ON 

INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (1, N'Arts', 2)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (2, N'Commerce', 2)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (3, N'Science', 2)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (4, N'Agriculture', 2)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (5, N'Mechanical', 3)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (6, N'Electrician', 3)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (7, N'Nursing', 3)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (8, N'Information Technology', 3)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (9, N'Botany', 4)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (10, N'Zoology', 4)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (11, N'Physics', 4)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (12, N'Chemistry', 4)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (13, N'Neurosurgeon', 5)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (14, N'Pediatrics', 5)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (15, N'Psychiatry', 5)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (16, N'Pathology', 5)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (17, N'Data Science', 6)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (18, N'Data Analytics', 6)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (19, N'Artificial Intelligence', 6)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (20, N'Cloud Computing', 6)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (21, N'Mechanical Engineering', 7)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (22, N'Electronics and Telecommunication Engineering', 7)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (23, N'Computer Engineering', 7)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (24, N'Civil Engineering', 7)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (25, N'Medicinal', 8)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (26, N'Cosmetology', 8)
INSERT [dbo].[tbl_specializations] ([specialization_id], [specialization_name], [qualification_id]) VALUES (27, N'Pharmacognocy', 8)
SET IDENTITY_INSERT [dbo].[tbl_specializations] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_trainingTopics] ON 

INSERT [dbo].[tbl_trainingTopics] ([topic_id], [topic_name]) VALUES (3, N'.NET Core Web Apis')
INSERT [dbo].[tbl_trainingTopics] ([topic_id], [topic_name]) VALUES (9, N'ADO.NET')
INSERT [dbo].[tbl_trainingTopics] ([topic_id], [topic_name]) VALUES (5, N'Advance Python')
INSERT [dbo].[tbl_trainingTopics] ([topic_id], [topic_name]) VALUES (2, N'Asp.Net MVC')
INSERT [dbo].[tbl_trainingTopics] ([topic_id], [topic_name]) VALUES (8, N'C-Sharp')
INSERT [dbo].[tbl_trainingTopics] ([topic_id], [topic_name]) VALUES (1, N'Core Java')
INSERT [dbo].[tbl_trainingTopics] ([topic_id], [topic_name]) VALUES (12, N'Data Structure')
INSERT [dbo].[tbl_trainingTopics] ([topic_id], [topic_name]) VALUES (6, N'DJango')
INSERT [dbo].[tbl_trainingTopics] ([topic_id], [topic_name]) VALUES (4, N'JQuery')
INSERT [dbo].[tbl_trainingTopics] ([topic_id], [topic_name]) VALUES (7, N'Machine Learning')
INSERT [dbo].[tbl_trainingTopics] ([topic_id], [topic_name]) VALUES (11, N'MySql')
INSERT [dbo].[tbl_trainingTopics] ([topic_id], [topic_name]) VALUES (10, N'Oracle SQL')
SET IDENTITY_INSERT [dbo].[tbl_trainingTopics] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_qual__F70508B540A3518F]    Script Date: 5/11/2025 10:39:48 PM ******/
ALTER TABLE [dbo].[tbl_qualifications] ADD UNIQUE NONCLUSTERED 
(
	[qualification_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_sour__52379DC15FBE2BA4]    Script Date: 5/11/2025 10:39:48 PM ******/
ALTER TABLE [dbo].[tbl_sources] ADD UNIQUE NONCLUSTERED 
(
	[source_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_spec__A28CFD794170BC31]    Script Date: 5/11/2025 10:39:48 PM ******/
ALTER TABLE [dbo].[tbl_specializations] ADD UNIQUE NONCLUSTERED 
(
	[specialization_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_trai__54BAE5EC032AC8EC]    Script Date: 5/11/2025 10:39:48 PM ******/
ALTER TABLE [dbo].[tbl_trainingTopics] ADD UNIQUE NONCLUSTERED 
(
	[topic_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_candidate_enquiries]  WITH CHECK ADD  CONSTRAINT [fkcanid] FOREIGN KEY([candidate_id])
REFERENCES [dbo].[tbl_candidateDetails] ([candidate_id])
GO
ALTER TABLE [dbo].[tbl_candidate_enquiries] CHECK CONSTRAINT [fkcanid]
GO
ALTER TABLE [dbo].[tbl_candidate_qualification]  WITH CHECK ADD  CONSTRAINT [fkcid] FOREIGN KEY([candidate_id])
REFERENCES [dbo].[tbl_candidateDetails] ([candidate_id])
GO
ALTER TABLE [dbo].[tbl_candidate_qualification] CHECK CONSTRAINT [fkcid]
GO
ALTER TABLE [dbo].[tbl_candidate_qualification]  WITH CHECK ADD  CONSTRAINT [fkspid] FOREIGN KEY([specialization_id])
REFERENCES [dbo].[tbl_specializations] ([specialization_id])
GO
ALTER TABLE [dbo].[tbl_candidate_qualification] CHECK CONSTRAINT [fkspid]
GO
ALTER TABLE [dbo].[tbl_candidate_specializations]  WITH CHECK ADD  CONSTRAINT [fkcaid] FOREIGN KEY([candidate_id])
REFERENCES [dbo].[tbl_candidateDetails] ([candidate_id])
GO
ALTER TABLE [dbo].[tbl_candidate_specializations] CHECK CONSTRAINT [fkcaid]
GO
ALTER TABLE [dbo].[tbl_followups]  WITH CHECK ADD  CONSTRAINT [fkenqid] FOREIGN KEY([candidate_enquiries_id])
REFERENCES [dbo].[tbl_candidate_enquiries] ([candidate_enquiries_id])
GO
ALTER TABLE [dbo].[tbl_followups] CHECK CONSTRAINT [fkenqid]
GO
ALTER TABLE [dbo].[tbl_specializations]  WITH CHECK ADD  CONSTRAINT [fkqid] FOREIGN KEY([qualification_id])
REFERENCES [dbo].[tbl_qualifications] ([qualification_id])
GO
ALTER TABLE [dbo].[tbl_specializations] CHECK CONSTRAINT [fkqid]
GO
