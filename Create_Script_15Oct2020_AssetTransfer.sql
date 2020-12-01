USE [BisForms_Finance_UAT]
GO
/****** Object:  User [bis_k2_editor]    Script Date: 15/10/20 9:06:27 AM ******/
CREATE USER [bis_k2_editor] FOR LOGIN [bis_k2_editor] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [ApplicationSystem]    Script Date: 15/10/20 9:06:27 AM ******/
CREATE SCHEMA [ApplicationSystem]
GO
/****** Object:  Schema [AssetTransfer]    Script Date: 15/10/20 9:06:27 AM ******/
CREATE SCHEMA [AssetTransfer]
GO
/****** Object:  Schema [OrgHierarchy]    Script Date: 15/10/20 9:06:27 AM ******/
CREATE SCHEMA [OrgHierarchy]
GO
/****** Object:  Schema [TR]    Script Date: 15/10/20 9:06:27 AM ******/
CREATE SCHEMA [TR]
GO
/****** Object:  Table [ApplicationSystem].[FormDelegation]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ApplicationSystem].[FormDelegation](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[FromUserFQN] [nvarchar](100) NOT NULL,
	[FromUserDisplayName] [nvarchar](100) NOT NULL,
	[ToUserFQN] [nvarchar](100) NOT NULL,
	[ToUserDisplayName] [nvarchar](100) NOT NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[SystemCode] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ApplicationSystem].[SystemName]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ApplicationSystem].[SystemName](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[SystemCode] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[AssetDetailsList]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[AssetDetailsList](
	[AssetListID] [int] IDENTITY(1,1) NOT NULL,
	[FormID] [int] NOT NULL,
	[JDEAssetID] [nvarchar](20) NULL,
	[TransferringBU] [nvarchar](250) NULL,
	[AssetDescription] [nvarchar](250) NULL,
	[EquipmentClass] [nvarchar](20) NULL,
	[CurrentWDV] [decimal](10, 2) NULL,
	[CostCGI] [nvarchar](25) NULL,
	[AcquisitionDate] [nvarchar](20) NULL,
	[AreDetailsComplete] [bit] NULL,
	[FuelCard] [nvarchar](250) NULL,
	[Status] [nvarchar](20) NULL,
	[RegistrationsNumber] [nvarchar](20) NULL,
	[EngineHours] [nvarchar](10) NULL,
	[EngineKms] [nvarchar](20) NULL,
	[SerialNumber] [nvarchar](50) NULL,
	[ModelYear] [nvarchar](20) NULL,
	[AreChildAssetsIncluded] [bit] NULL,
	[WhyAreChildAssetExcluded] [nvarchar](1000) NULL,
	[DoesPrimaryAssetHaveAConfiguration] [bit] NULL,
	[ConfigurationSequence] [nvarchar](1000) NULL,
	[IsStockTransferArranged] [bit] NULL,
 CONSTRAINT [PK__AssetDet__5C2111A2E25FF58F] PRIMARY KEY CLUSTERED 
(
	[AssetListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[AttachmentList]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[AttachmentList](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[FormID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Attachment] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[AuditLog]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[AuditLog](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[FormID] [int] NOT NULL,
	[DateTimeActioned] [datetime] NOT NULL,
	[StatusID] [int] NOT NULL,
	[ActionedByFQN] [nvarchar](150) NULL,
	[ActionedDisplayName] [nvarchar](150) NULL,
	[ActionName] [nvarchar](150) NOT NULL,
	[Comments] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[ConfigAttachmentCategory]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[ConfigAttachmentCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](250) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[ConfigChecklistCategory]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[ConfigChecklistCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[ConfigChecklistChoice]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[ConfigChecklistChoice](
	[ChoiceID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ChoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[ConfigChecklistQuestion]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[ConfigChecklistQuestion](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](1000) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ChoiceID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[ConfigFinancialYear]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[ConfigFinancialYear](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[FinancialYear] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[ConfigNotificationUsers]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[ConfigNotificationUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](75) NULL,
	[DisplayName] [nvarchar](75) NULL,
	[EmailAddress] [nvarchar](150) NULL,
	[OrderIndex] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_FinalNotificationUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[ConfigWorkflowAction]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[ConfigWorkflowAction](
	[ActionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__Workflow__FFE3F4B94F66AFFE] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[FormCheckListQuestions]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[FormCheckListQuestions](
	[QuestionListID] [int] IDENTITY(1,1) NOT NULL,
	[FormID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[AnswerChoiceID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[FormHeader]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[FormHeader](
	[FormID] [int] IDENTITY(1,1) NOT NULL,
	[ATNumber] [nvarchar](10) NULL,
	[FinancialYear] [int] NOT NULL,
	[TransferType] [int] NULL,
	[ReceivingBUCode] [int] NOT NULL,
	[ReceivingBUName] [nvarchar](250) NOT NULL,
	[ReceivingPCCode] [int] NULL,
	[ReceivingDivision] [nvarchar](150) NULL,
	[TransferingBUCode] [int] NULL,
	[TransferingBUName] [nvarchar](150) NULL,
	[TransferingDivision] [nvarchar](100) NULL,
	[TransferingPCCode] [int] NULL,
	[ReasonForTransfer] [nvarchar](350) NOT NULL,
	[JustificationForTransfer] [nvarchar](350) NOT NULL,
	[AssetPhysicalLocation] [nvarchar](350) NULL,
	[ProposedTransferDate] [datetime] NOT NULL,
	[NominatedLVDriver] [nvarchar](250) NULL,
	[ReasonForOutstandingWOrders] [nvarchar](max) NULL,
	[CreatedByFQN] [nvarchar](100) NOT NULL,
	[CreatedByDisplayName] [nvarchar](250) NOT NULL,
	[StatusID] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[WorkflowInstanceID] [int] NULL,
	[ViewFlow] [nvarchar](300) NULL,
 CONSTRAINT [PK__FormHead__FB05B7BD65E41040] PRIMARY KEY CLUSTERED 
(
	[FormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[Information]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[Information](
	[AdditionalInformationId] [int] IDENTITY(1,1) NOT NULL,
	[FormId] [int] NOT NULL,
	[AreRepairsRequired] [bit] NOT NULL,
	[TransportOrganiser] [nvarchar](250) NULL,
	[PersonResponsible] [nvarchar](250) NULL,
	[TransportQuote] [decimal](19, 4) NULL,
	[TransportCostChargedTo] [nvarchar](150) NULL,
	[DateOfProposedTransport] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AdditionalInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[NextNumber]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[NextNumber](
	[FinancialYear] [int] NULL,
	[NextNumber] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[RedeployableRecommendation]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[RedeployableRecommendation](
	[RedeployableId] [int] IDENTITY(1,1) NOT NULL,
	[FormId] [int] NULL,
	[AssetDepolymentMethod] [nvarchar](50) NULL,
	[RenewRegistration] [bit] NULL,
	[CurrentMarketValue] [money] NULL,
	[ValuationGivenBy] [nvarchar](100) NULL,
 CONSTRAINT [PK_RedployableRecommendation] PRIMARY KEY CLUSTERED 
(
	[RedeployableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[ServiceScheduleReport]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[ServiceScheduleReport](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[FormID] [int] NOT NULL,
	[JdeAssetID] [nvarchar](10) NULL,
	[Description] [nvarchar](250) NULL,
	[Status] [nvarchar](20) NULL,
	[BusinessUnitCode] [nvarchar](20) NULL,
	[CurrentMeter] [nvarchar](50) NULL,
	[LtdHours] [nvarchar](50) NULL,
	[LastCompletedHours] [nvarchar](50) NULL,
	[CurrentOrdometer] [nvarchar](50) NULL,
	[LtdKms] [nvarchar](50) NULL,
	[LastCompletedKms] [nvarchar](50) NULL,
	[LastCompletedDate] [nvarchar](50) NULL,
	[HoursToGo] [nvarchar](50) NULL,
	[KmsToGo] [nvarchar](50) NULL,
	[AssignedWorkOrder] [nvarchar](50) NULL,
	[EstHours] [nvarchar](50) NULL,
	[PlannedStartDate] [nvarchar](50) NULL,
	[PercentDue] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[TransferType]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[TransferType](
	[TransferTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TransferType] PRIMARY KEY CLUSTERED 
(
	[TransferTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[WorkflowStatus]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[WorkflowStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK__Workflow__C8EE2043CE1B4931] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssetTransfer].[WorkOrderReport]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssetTransfer].[WorkOrderReport](
	[WorkOrderID] [uniqueidentifier] NOT NULL,
	[FormID] [int] NOT NULL,
	[JdeAssetID] [nvarchar](10) NULL,
	[Description] [nvarchar](150) NULL,
	[StartDate] [nvarchar](20) NULL,
	[WorkOrderType] [nvarchar](20) NULL,
	[Status] [nvarchar](20) NULL,
	[OrderNumber] [nvarchar](20) NULL,
	[Priority] [nvarchar](20) NULL,
	[Reference] [nvarchar](50) NULL,
	[EstimatedHours] [nvarchar](10) NULL,
	[EstimatedAmount] [decimal](10, 2) NULL,
 CONSTRAINT [PK_WorkOrderReport] PRIMARY KEY CLUSTERED 
(
	[WorkOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [OrgHierarchy].[Approver]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrgHierarchy].[Approver](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](150) NOT NULL,
	[FQN] [nvarchar](150) NOT NULL,
	[EntityTypeID] [int] NOT NULL,
	[JDEEntityID] [nvarchar](15) NULL,
	[OrderIndex] [int] NOT NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [OrgHierarchy].[AssetsReviewer]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrgHierarchy].[AssetsReviewer](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewerTypeID] [int] NOT NULL,
	[DisplayName] [nvarchar](150) NOT NULL,
	[FQN] [nvarchar](100) NOT NULL,
	[OrderIndex] [int] NOT NULL,
 CONSTRAINT [PK_AssetsReviewer] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [OrgHierarchy].[AssetsReviewerType]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrgHierarchy].[AssetsReviewerType](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [OrgHierarchy].[EntityType]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrgHierarchy].[EntityType](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [TR].[User_Delegation]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TR].[User_Delegation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromUserDomainName] [nvarchar](25) NULL,
	[FromUserDisplayName] [nvarchar](50) NULL,
	[ToUserDomainName] [nvarchar](25) NULL,
	[ToUserDisplayName] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__CareerDe__3213E83F89411863] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ApplicationSystem].[FormDelegation] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [AssetTransfer].[NextNumber] ADD  CONSTRAINT [DF_NextNumber_NextNumber]  DEFAULT ((1)) FOR [NextNumber]
GO
ALTER TABLE [AssetTransfer].[WorkOrderReport] ADD  CONSTRAINT [DF_WorkOrderReport_WorkOrderID]  DEFAULT (newid()) FOR [WorkOrderID]
GO
ALTER TABLE [OrgHierarchy].[AssetsReviewerType] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [OrgHierarchy].[EntityType] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [TR].[User_Delegation] ADD  CONSTRAINT [DF_User_Delegation_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [AssetTransfer].[AssetDetailsList]  WITH CHECK ADD  CONSTRAINT [FK__AssetDeta__FormI__2A4B4B5E] FOREIGN KEY([FormID])
REFERENCES [AssetTransfer].[FormHeader] ([FormID])
GO
ALTER TABLE [AssetTransfer].[AssetDetailsList] CHECK CONSTRAINT [FK__AssetDeta__FormI__2A4B4B5E]
GO
ALTER TABLE [AssetTransfer].[AttachmentList]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [AssetTransfer].[ConfigAttachmentCategory] ([CategoryID])
GO
ALTER TABLE [AssetTransfer].[AuditLog]  WITH CHECK ADD  CONSTRAINT [FK__AuditLog__FormID__403A8C7D] FOREIGN KEY([FormID])
REFERENCES [AssetTransfer].[FormHeader] ([FormID])
GO
ALTER TABLE [AssetTransfer].[AuditLog] CHECK CONSTRAINT [FK__AuditLog__FormID__403A8C7D]
GO
ALTER TABLE [AssetTransfer].[AuditLog]  WITH CHECK ADD  CONSTRAINT [FK__AuditLog__Status__412EB0B6] FOREIGN KEY([StatusID])
REFERENCES [AssetTransfer].[WorkflowStatus] ([Id])
GO
ALTER TABLE [AssetTransfer].[AuditLog] CHECK CONSTRAINT [FK__AuditLog__Status__412EB0B6]
GO
ALTER TABLE [AssetTransfer].[ConfigChecklistQuestion]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [AssetTransfer].[ConfigChecklistCategory] ([CategoryID])
GO
ALTER TABLE [AssetTransfer].[FormCheckListQuestions]  WITH CHECK ADD FOREIGN KEY([AnswerChoiceID])
REFERENCES [AssetTransfer].[ConfigChecklistChoice] ([ChoiceID])
GO
ALTER TABLE [AssetTransfer].[FormCheckListQuestions]  WITH CHECK ADD  CONSTRAINT [FK__FormCheck__FormI__3B75D760] FOREIGN KEY([FormID])
REFERENCES [AssetTransfer].[FormHeader] ([FormID])
GO
ALTER TABLE [AssetTransfer].[FormCheckListQuestions] CHECK CONSTRAINT [FK__FormCheck__FormI__3B75D760]
GO
ALTER TABLE [AssetTransfer].[FormCheckListQuestions]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [AssetTransfer].[ConfigChecklistQuestion] ([QuestionID])
GO
ALTER TABLE [AssetTransfer].[Information]  WITH CHECK ADD  CONSTRAINT [FK__Informati__FormI__38996AB5] FOREIGN KEY([FormId])
REFERENCES [AssetTransfer].[FormHeader] ([FormID])
GO
ALTER TABLE [AssetTransfer].[Information] CHECK CONSTRAINT [FK__Informati__FormI__38996AB5]
GO
ALTER TABLE [AssetTransfer].[ServiceScheduleReport]  WITH CHECK ADD  CONSTRAINT [FK__ServiceSc__FormI__52593CB8] FOREIGN KEY([FormID])
REFERENCES [AssetTransfer].[FormHeader] ([FormID])
GO
ALTER TABLE [AssetTransfer].[ServiceScheduleReport] CHECK CONSTRAINT [FK__ServiceSc__FormI__52593CB8]
GO
ALTER TABLE [AssetTransfer].[WorkOrderReport]  WITH CHECK ADD  CONSTRAINT [FK__WorkOrder__FormI__4F7CD00D] FOREIGN KEY([FormID])
REFERENCES [AssetTransfer].[FormHeader] ([FormID])
GO
ALTER TABLE [AssetTransfer].[WorkOrderReport] CHECK CONSTRAINT [FK__WorkOrder__FormI__4F7CD00D]
GO
/****** Object:  StoredProcedure [AssetTransfer].[uspDeleteWorkOrderList]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [AssetTransfer].[uspDeleteWorkOrderList] (@FormId int )
AS 
BEGIN 
	DELETE FROM [AssetTransfer].[WorkOrderReport] WHERE FormID = @FormId

END
GO
/****** Object:  StoredProcedure [AssetTransfer].[uspGetAssetTransferNumber]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [AssetTransfer].[uspGetAssetTransferNumber] (@FinancialYear AS nvarchar(4))


AS
BEGIN 

	-- Temp Variable To Hold Returned Number
	DECLARE @RetunedNumber int

	-- Get Next Number From [AssetTransfer].[NextNumber] Table
	SELECT @RetunedNumber =	NextNumber FROM [BisForms_Finance_UAT].[AssetTransfer].[NextNumber]
							WHERE FinancialYear = @FinancialYear

	-- Update Next Number in [AssetTransfer].[NextNumber] Table
	UPDATE [BisForms_Finance_UAT].[AssetTransfer].[NextNumber]
	SET NextNumber = NextNumber + 1
	WHERE FinancialYear = @FinancialYear

	-- Return Next Asset Transfer Number
	SELECT 'AT ' + SUBSTRING(cast(@FinancialYear as nvarchar(4)),3,LEN(@FinancialYear)) +'-'+ FORMAT (@RetunedNumber,'000')

END;
GO
/****** Object:  StoredProcedure [OrgHierarchy].[uspGetApprovers]    Script Date: 15/10/20 9:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [OrgHierarchy].[uspGetApprovers]
	@bu int
as
begin
	--Loop through all levels of hierarchy -> BU -> PC -> BG -> DIV.

	declare @pc  varchar(20)
	declare @bg  varchar(20)
	declare @div varchar(20)

	select @pc=ProfitCentreCode, @bg=BusinessGroupCode, @div=DivisionCode from GlobalDataRepository.dbo.BusinessUnitHierarchy where BusinessUnitCode=@bu

	declare @users table(id int identity(1,1), username varchar(100), entityType varchar(100), orderIndex int)



	insert into @users SELECT [FQN],[EntityTypeID],[OrderIndex] FROM [OrgHierarchy].[Approver] WHERE JDEEntityID = @pc AND EntityTypeID = 4	--Profit Centre
	insert into @users SELECT [FQN],[EntityTypeID],[OrderIndex] FROM [OrgHierarchy].[Approver] WHERE JDEEntityID = @bg AND EntityTypeID = 3	--Business Group
	--insert into @users SELECT [FQN],[EntityTypeID],[OrderIndex] FROM [OrgHierarchy].[Approver] WHERE JDEEntityID = @div AND EntityTypeID = 2	--Division

	
	--Select  id,username, entityType,  orderIndex  from @newusers
   declare @newusers  table(id int, username varchar(100), entityType varchar(100), orderIndex int identity(10,10)) 

	--Remove duplicate usernames and insert
   insert into @newusers SELECT [id],[userName], [entityType] FROM @users u1  WHERE id IN (SELECT MIN(id) FROM @users u2 GROUP BY u2.username)
  
   --Select distinct values 
   select  id,username, entityType,  orderIndex  from @newusers


end
GO
