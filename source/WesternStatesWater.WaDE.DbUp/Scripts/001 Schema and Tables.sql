/****** Object:  Schema [Core]    Script Date: 5/2/2019 11:13:30 AM ******/
CREATE SCHEMA [Core]
GO
/****** Object:  Schema [CVs]    Script Date: 5/2/2019 11:13:30 AM ******/
CREATE SCHEMA [CVs]
GO
/****** Object:  Schema [Input]    Script Date: 5/2/2019 11:13:30 AM ******/
CREATE SCHEMA [Input]
GO

/****** Object:  Table [Core].[AggBridge_BeneficialUses_fact]    Script Date: 5/2/2019 11:13:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[AggBridge_BeneficialUses_fact](
	[AggBridgeID] [bigint] IDENTITY(1,1) NOT NULL,
	[BeneficialUseID] [bigint] NOT NULL,
	[AggregatedAmountID] [bigint] NOT NULL,
 CONSTRAINT [pkAggBridge_BeneficialUses_fact] PRIMARY KEY CLUSTERED 
(
	[AggBridgeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[AggregatedAmounts_fact]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[AggregatedAmounts_fact](
	[AggregatedAmountID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [bigint] NOT NULL,
	[ReportingUnitID] [bigint] NOT NULL,
	[VariableSpecificID] [bigint] NOT NULL,
	[BeneficialUseID] [bigint] NOT NULL,
	[WaterSourceID] [bigint] NOT NULL,
	[MethodID] [bigint] NOT NULL,
	[TimeframeStartID] [bigint] NULL,
	[TimeframeEndID] [bigint] NULL,
	[DataPublicationDate] [bigint] NULL,
	[DataPublicationDOI] [nvarchar](100) NULL,
	[ReportYearCV] [nchar](4) NULL,
	[Amount] [float] NOT NULL,
	[PopulationServed] [float] NULL,
	[PowerGeneratedGWh] [float] NULL,
	[IrrigatedAcreage] [float] NULL,
	[InterbasinTransferToID] [nvarchar](100) NULL,
	[InterbasinTransferFromID] [nvarchar](100) NULL,
 CONSTRAINT [pkAggregatedAmounts_fact] PRIMARY KEY CLUSTERED 
(
	[AggregatedAmountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[AllocationAmounts_fact]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[AllocationAmounts_fact](
	[AllocationAmountID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [bigint] NOT NULL,
	[VariableSpecificID] [bigint] NOT NULL,
	[SiteID] [bigint] NULL,
	[WaterSourceID] [bigint] NOT NULL,
	[MethodID] [bigint] NOT NULL,
	[PrimaryBeneficialUseID] [bigint] NULL,
	[DataPublicationDateID] [bigint] NOT NULL,
	[DataPublicationDOI] [nvarchar](100) NULL,
	[AllocationNativeID] [nvarchar](250) NULL,
	[AllocationApplicationDate] [bigint] NULL,
	[AllocationPriorityDate] [bigint] NOT NULL,
	[AllocationExpirationDate] [bigint] NULL,
	[AllocationOwner] [nvarchar](250) NULL,
	[AllocationBasisCV] [nvarchar](250) NULL,
	[AllocationLegalStatusCV] [nvarchar](250) NULL,
	[AllocationTypeCV] [nvarchar](250) NULL,
	[AllocationTimeframeStart] [nvarchar](5) NULL,
	[AllocationTimeframeEnd] [nvarchar](5) NULL,
	[AllocationCropDutyAmount] [float] NULL,
	[AllocationAmount] [float] NULL,
	[AllocationMaximum] [float] NULL,
	[PopulationServed] [float] NULL,
	[PowerGeneratedGWh] [float] NULL,
	[IrrigatedAcreage] [float] NULL,
	[AllocationCommunityWaterSupplySystem] [nvarchar](250) NULL,
	[AllocationSDWISIdentifier] [nvarchar](250) NULL,
	[AllocationAssociatedWithdrawalSiteIDs] [nvarchar](500) NULL,
	[AllocationAssociatedConsumptiveUseSiteIDs] [nvarchar](500) NULL,
	[AllocationChangeApplicationIndicator] [nvarchar](100) NULL,
	[LegacyAllocationIDs] [nvarchar](250) NULL,
	[WaterAllocationNativeURL] [nvarchar](250) NULL,
 CONSTRAINT [pkAllocationAmounts_fact] PRIMARY KEY CLUSTERED 
(
	[AllocationAmountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[AllocationBridge_BeneficialUses_fact]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[AllocationBridge_BeneficialUses_fact](
	[AllocationBridgeID] [bigint] IDENTITY(1,1) NOT NULL,
	[BeneficialUseID] [bigint] NOT NULL,
	[AllocationAmountID] [bigint] NOT NULL,
 CONSTRAINT [PK_AllocationBridge_BeneficialUses_fact] PRIMARY KEY CLUSTERED 
(
	[AllocationBridgeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Allocations_dim]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Allocations_dim](
	[AllocationID] [bigint] IDENTITY(1,1) NOT NULL,
	[AllocationUUID] [nvarchar](50) NOT NULL,
	[AllocationNativeID] [nvarchar](250) NOT NULL,
	[AllocationOwner] [nvarchar](255) NOT NULL,
	[AllocationBasisCV] [nvarchar](250) NULL,
	[AllocationLegalStatusCV] [nvarchar](50) NOT NULL,
	[WaterRightTypeCV] [nvarchar](10) NULL,
	[AllocationApplicationDate] [bigint] NULL,
	[AllocationPriorityDate] [bigint] NOT NULL,
	[AllocationExpirationDate] [bigint] NULL,
	[TimeframeEnd] [nchar](5) NULL,
	[TimeframeStart] [nchar](5) NULL,
	[AllocationChangeApplicationIndicator] [nvarchar](100) NULL,
	[LegacyAllocationIDs] [nvarchar](100) NULL,
 CONSTRAINT [pkAllocations_dim] PRIMARY KEY CLUSTERED 
(
	[AllocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Allocations_dim_Input]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Allocations_dim_Input](
	[AllocationNativeID] [nvarchar](250) NOT NULL,
	[AllocationOwner] [nvarchar](255) NOT NULL,
	[AllocationBasisCV] [nvarchar](250) NULL,
	[AllocationLegalStatusCV] [nvarchar](50) NOT NULL,
	[AllocationApplicationDate] [bigint] NULL,
	[AllocationPriorityDate] [bigint] NOT NULL,
	[AllocationExpirationDate] [bigint] NULL,
	[AllocationChangeApplicationIndicator] [nvarchar](100) NULL,
	[LegacyAllocationIDs] [nvarchar](100) NULL,
 CONSTRAINT [pkAllocations_dim_Input] PRIMARY KEY CLUSTERED 
(
	[AllocationNativeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[BeneficialUses_dim]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[BeneficialUses_dim](
	[BeneficialUseID] [bigint] IDENTITY(1,1) NOT NULL,
	[BeneficialUseUUID] [nvarchar](500) NULL,
	[BeneficialUseCategory] [nvarchar](500) NOT NULL,
	[PrimaryUseCategory] [nvarchar](250) NULL,
	[USGSCategoryNameCV] [nvarchar](250) NULL,
	[NAICSCodeNameCV] [nvarchar](250) NULL,
 CONSTRAINT [pkBeneficialUses_dim] PRIMARY KEY CLUSTERED 
(
	[BeneficialUseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Date_dim]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Date_dim](
	[DateID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Year] [nchar](4) NULL,
 CONSTRAINT [pkDate_dim] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[ImportErrors]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[ImportErrors](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[RunId] [nvarchar](250) NOT NULL,
	[Data] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Core].[Methods_dim]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Methods_dim](
	[MethodID] [bigint] IDENTITY(1,1) NOT NULL,
	[MethodUUID] [nvarchar](100) NOT NULL,
	[MethodName] [nvarchar](50) NOT NULL,
	[MethodDescription] [text] NOT NULL,
	[MethodNEMILink] [nvarchar](100) NULL,
	[ApplicableResourceTypeCV] [nvarchar](100) NOT NULL,
	[MethodTypeCV] [nvarchar](50) NOT NULL,
	[DataCoverageValue] [nvarchar](100) NULL,
	[DataQualityValueCV] [nvarchar](50) NULL,
	[DataConfidenceValue] [nvarchar](50) NULL,
 CONSTRAINT [pkMethods_dim] PRIMARY KEY CLUSTERED 
(
	[MethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Core].[NHDMetadata]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[NHDMetadata](
	[NHDMetadataID] [bigint] IDENTITY(1,1) NOT NULL,
	[NHDNetworkStatusCV] [nvarchar](50) NOT NULL,
	[NHDProductCV] [nvarchar](50) NULL,
	[NHDUpdateDate] [date] NULL,
	[NHDReachCode] [nvarchar](50) NULL,
	[NHDMeasureNumber] [nvarchar](50) NULL,
 CONSTRAINT [pkNHDMetadata] PRIMARY KEY CLUSTERED 
(
	[NHDMetadataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Organizations_dim]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Organizations_dim](
	[OrganizationID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrganizationUUID] [nvarchar](250) NOT NULL,
	[OrganizationName] [nvarchar](250) NOT NULL,
	[OrganizationPurview] [nvarchar](250) NULL,
	[OrganizationWebsite] [nvarchar](250) NOT NULL,
	[OrganizationPhoneNumber] [nvarchar](250) NOT NULL,
	[OrganizationContactName] [nvarchar](250) NOT NULL,
	[OrganizationContactEmail] [nvarchar](250) NOT NULL,
	[DataMappingURL] [nvarchar](250) NOT NULL,
 CONSTRAINT [pkOrganizations_dim] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[RegulatoryOverlay_dim]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[RegulatoryOverlay_dim](
	[RegulatoryOverlayID] [bigint] IDENTITY(1,1) NOT NULL,
	[RegulatoryOverlayUUID] [nvarchar](250) NULL,
	[RegulatoryOverlayNativeID] [nvarchar](250) NULL,
	[RegulatoryName] [nvarchar](50) NOT NULL,
	[RegulatoryDescription] [nvarchar](max) NOT NULL,
	[RegulatoryStatusCV] [nvarchar](50) NOT NULL,
	[OversightAgency] [nvarchar](250) NOT NULL,
	[RegulatoryStatute] [nvarchar](500) NULL,
	[RegulatoryStatuteLink] [nvarchar](500) NULL,
	[StatutoryEffectiveDate] [date] NOT NULL,
	[StatutoryEndDate] [date] NULL,
 CONSTRAINT [pkRegulatoryOverlay_dim] PRIMARY KEY CLUSTERED 
(
	[RegulatoryOverlayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Core].[RegulatoryReportingUnits_fact]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[RegulatoryReportingUnits_fact](
	[BridgeID] [bigint] NOT NULL,
	[OrganizationID] [bigint] NOT NULL,
	[RegulatoryOverlayID] [bigint] NOT NULL,
	[ReportingUnitID] [bigint] NOT NULL,
	[DataPublicationDateID] [bigint] NOT NULL,
 CONSTRAINT [pkRegulatoryReportingUnits_fact] PRIMARY KEY CLUSTERED 
(
	[BridgeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[ReportingUnits_dim]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[ReportingUnits_dim](
	[ReportingUnitID] [bigint] IDENTITY(1,1) NOT NULL,
	[ReportingUnitUUID] [nvarchar](250) NOT NULL,
	[ReportingUnitNativeID] [nvarchar](250) NOT NULL,
	[ReportingUnitName] [nvarchar](250) NOT NULL,
	[ReportingUnitTypeCV] [nvarchar](50) NOT NULL,
	[ReportingUnitUpdateDate] [date] NULL,
	[ReportingUnitProductVersion] [nvarchar](100) NULL,
	[StateCV] [nvarchar](2) NOT NULL,
	[EPSGCodeCV] [nvarchar](50) NOT NULL,
	[Geometry] [geometry] NULL,
 CONSTRAINT [pkReportingUnits_dim] PRIMARY KEY CLUSTERED 
(
	[ReportingUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Core].[Sites_dim]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Sites_dim](
	[SiteID] [bigint] IDENTITY(1,1) NOT NULL,
	[SiteUUID] [nvarchar](55) NOT NULL,
	[SiteNativeID] [nvarchar](50) NULL,
	[SiteName] [nvarchar](500) NOT NULL,
	[USGSSiteID] [nvarchar](250) NULL,
	[SiteTypeCV] [nvarchar](100) NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[SitePoint] [geometry] NULL,
	[Geometry] [geometry] NULL,
	[CoordinateMethodCV] [nvarchar](100) NOT NULL,
	[CoordinateAccuracy] [nvarchar](255) NULL,
	[GNISCodeCV] [nvarchar](250) NULL,
	[EPSGCodeCV] [nvarchar](50) NOT NULL,
	[NHDMetadataID] [bigint] NULL,
	[NHDNetworkStatusCV] [nvarchar](50) NULL,
	[NHDProductCV] [nvarchar](50) NULL,
 CONSTRAINT [pkSites_dim] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Core].[SitesAllocationAmountsBridge_fact]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[SitesAllocationAmountsBridge_fact](
	[SitesAllocationAmountsBridgeID] [bigint] IDENTITY(1,1) NOT NULL,
	[SiteID] [bigint] NULL,
	[AllocationAmountID] [bigint] NULL,
 CONSTRAINT [pkSitesAllocationAmountsBridge_fact] PRIMARY KEY CLUSTERED 
(
	[SitesAllocationAmountsBridgeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[SitesBridge_BeneficialUses_fact]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[SitesBridge_BeneficialUses_fact](
	[SiteBridgeID] [bigint] IDENTITY(1,1) NOT NULL,
	[BeneficialUseID] [bigint] NOT NULL,
	[SiteVariableAmountID] [bigint] NOT NULL,
 CONSTRAINT [pkSitesBridge_BeneficialUses_fact] PRIMARY KEY CLUSTERED 
(
	[SiteBridgeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[SitesVariableAmountBridgeAllocations_fact]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[SitesVariableAmountBridgeAllocations_fact](
	[SitesVariableAmountAllocationsID] [bigint] IDENTITY(1,1) NOT NULL,
	[SiteVariableAmountID] [bigint] NULL,
	[AllocationID] [bigint] NULL,
 CONSTRAINT [pkSitesVariableAmountBridgeAllocations_fact] PRIMARY KEY CLUSTERED 
(
	[SitesVariableAmountAllocationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[SiteVariableAmounts_fact]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[SiteVariableAmounts_fact](
	[SiteVariableAmountID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [bigint] NOT NULL,
	[SiteID] [bigint] NOT NULL,
	[VariableSpecificID] [bigint] NOT NULL,
	[WaterSourceID] [bigint] NOT NULL,
	[MethodID] [bigint] NOT NULL,
	[TimeframeStart] [bigint] NOT NULL,
	[TimeframeEnd] [bigint] NOT NULL,
	[DataPublicationDate] [bigint] NOT NULL,
	[DataPublicationDOI] [nvarchar](100) NULL,
	[ReportYearCV] [nchar](4) NULL,
	[Amount] [float] NOT NULL,
	[PopulationServed] [float] NULL,
	[PowerGeneratedGWh] [float] NULL,
	[IrrigatedAcreage] [float] NULL,
	[IrrigationMethodCV] [nvarchar](100) NULL,
	[CropTypeCV] [nvarchar](100) NULL,
	[CommunityWaterSupplySystem] [nvarchar](250) NULL,
	[SDWISIdentifier] [nvarchar](250) NULL,
	[AssociatedNativeAllocationIDs] [nvarchar](500) NULL,
	[Geometry] [geometry] NULL,
 CONSTRAINT [pkSiteVariableAmounts_fact] PRIMARY KEY CLUSTERED 
(
	[SiteVariableAmountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Core].[Variables_dim]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Variables_dim](
	[VariableSpecificID] [bigint] IDENTITY(1,1) NOT NULL,
	[VariableSpecificUUID] [nvarchar](250) NULL,
	[VariableSpecificCV] [nvarchar](250) NOT NULL,
	[VariableCV] [nvarchar](250) NOT NULL,
	[AggregationStatisticCV] [nvarchar](50) NOT NULL,
	[AggregationInterval ] [numeric](10, 1) NOT NULL,
	[AggregationIntervalUnitCV ] [nvarchar](250) NOT NULL,
	[ReportYearStartMonth ] [nvarchar](10) NOT NULL,
	[ReportYearTypeCV ] [nvarchar](250) NOT NULL,
	[AmountUnitCV] [nvarchar](250) NOT NULL,
	[MaximumAmountUnitCV] [nvarchar](250) NULL,
 CONSTRAINT [pkVariables_dim] PRIMARY KEY CLUSTERED 
(
	[VariableSpecificID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[WaterSources_dim]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[WaterSources_dim](
	[WaterSourceID] [bigint] IDENTITY(1,1) NOT NULL,
	[WaterSourceUUID] [nvarchar](100) NOT NULL,
	[WaterSourceNativeID] [nvarchar](250) NULL,
	[WaterSourceName] [nvarchar](250) NULL,
	[WaterSourceTypeCV] [nvarchar](100) NOT NULL,
	[WaterQualityIndicatorCV] [nvarchar](100) NOT NULL,
	[GNISFeatureNameCV] [nvarchar](250) NULL,
	[Geometry] [geometry] NULL,
 CONSTRAINT [pkWaterSources_dim] PRIMARY KEY CLUSTERED 
(
	[WaterSourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CVs].[AggregationStatistic]    Script Date: 5/2/2019 11:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[AggregationStatistic](
	[Name] [nvarchar](50) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkAggregationStatistic] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[ApplicableResourceType]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[ApplicableResourceType](
	[Name] [nvarchar](100) NOT NULL,
	[Term] [nvarchar](100) NULL,
	[Definition] [nvarchar](max) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [PK_CVs.ApplicableResourceType] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CVs].[CoordinateMethod]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[CoordinateMethod](
	[Name] [nvarchar](100) NOT NULL,
	[Term] [nvarchar](100) NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](100) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [PK_CoordinateMethod] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[CropType]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[CropType](
	[Name] [nvarchar](100) NOT NULL,
	[Term] [nvarchar](250) NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkCropType] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[DataQualityValue]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[DataQualityValue](
	[Name] [nvarchar](50) NOT NULL,
	[Term] [nvarchar](100) NULL,
	[Definition] [nvarchar](max) NULL,
	[State] [nvarchar](10) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkDataQualityValue] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CVs].[EPSGCode]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[EPSGCode](
	[Name] [nvarchar](50) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkEPSGCode] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[GNISFeatureName]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[GNISFeatureName](
	[Name] [nvarchar](250) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkGNISFeatureName] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[IrrigationMethod]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[IrrigationMethod](
	[Name] [nvarchar](100) NOT NULL,
	[Term] [nvarchar](250) NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkIrrigationMethod] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[LegalStatus]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[LegalStatus](
	[Name] [nvarchar](250) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkLegalStatus] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[MethodType]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[MethodType](
	[Name] [nvarchar](50) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkMethodType] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[NAICSCode]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[NAICSCode](
	[Name] [nvarchar](250) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](max) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkNAICSCode] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CVs].[NHDNetworkStatus]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[NHDNetworkStatus](
	[Name] [nvarchar](50) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkNHDNetworkStatus] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[NHDProduct]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[NHDProduct](
	[Name] [nvarchar](50) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkNHDProduct] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[RegulatoryStatus]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[RegulatoryStatus](
	[Name] [nvarchar](250) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[State] [nchar](2) NULL,
	[Definition] [nvarchar](4000) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkRegulatoryStatus] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[ReportingUnitType]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[ReportingUnitType](
	[Name] [nvarchar](50) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkReportingUnitType] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[ReportYearCV]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[ReportYearCV](
	[Name] [nchar](4) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](max) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkReportYearCV] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CVs].[ReportYearType]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[ReportYearType](
	[Name] [nvarchar](250) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkReportYearType] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[SiteType]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[SiteType](
	[Name] [nvarchar](100) NOT NULL,
	[Term] [nvarchar](250) NULL,
	[Definition] [nvarchar](max) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkSiteType] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CVs].[State]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[State](
	[Name] [nvarchar](2) NOT NULL,
	[Term] [nvarchar](2) NULL,
	[Definition] [nvarchar](10) NULL,
	[State] [nvarchar](10) NULL,
	[SourceVocabularyURI] [nvarchar](100) NULL,
 CONSTRAINT [pkState] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[Units]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[Units](
	[Name] [nvarchar](250) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkUnits] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[USGSCategory]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[USGSCategory](
	[Name] [nvarchar](250) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](max) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkUSGSCategory] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CVs].[Variable]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[Variable](
	[Name] [nvarchar](250) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkVariable] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[VariableSpecific]    Script Date: 5/2/2019 11:13:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[VariableSpecific](
	[Name] [nvarchar](250) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkVariableSpecific] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[WaterAllocationBasis]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[WaterAllocationBasis](
	[Name] [nvarchar](250) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[State] [nchar](2) NULL,
	[Definition] [nvarchar](max) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkWaterAllocationBasis] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CVs].[WaterAllocationType]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[WaterAllocationType](
	[Name] [nvarchar](250) NOT NULL,
	[Term] [nvarchar](250) NULL,
	[State] [nchar](2) NULL,
	[Definition] [nvarchar](max) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkWaterAllocationType] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [CVs].[WaterQualityIndicator]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[WaterQualityIndicator](
	[Name] [nvarchar](100) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkWaterQualityIndicator] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CVs].[WaterSourceType]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CVs].[WaterSourceType](
	[Name] [nvarchar](100) NOT NULL,
	[Term] [nvarchar](250) NOT NULL,
	[Definition] [nvarchar](4000) NULL,
	[State] [nvarchar](250) NULL,
	[SourceVocabularyURI] [nvarchar](250) NULL,
 CONSTRAINT [pkWaterSourceType] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Input].[AggregatedAmounts_fact]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Input].[AggregatedAmounts_fact](
	[OrganizationUUID] [nvarchar](250) NOT NULL,
	[ReportingUnitNativeID] [nvarchar](250) NOT NULL,
	[VariableSpecificCV] [nvarchar](250) NOT NULL,
	[BeneficialUseCategory] [nvarchar](500) NOT NULL,
	[WaterSourceNativeID] [nvarchar](250) NOT NULL,
	[MethodName] [nvarchar](250) NOT NULL,
	[TimeframeStartDate] [date] NOT NULL,
	[TimeframeEndDate] [date] NOT NULL,
	[ReportYear] [nvarchar](4) NOT NULL,
	[Amount] [float] NULL,
	[PopulationServed] [float] NULL,
	[PowerGeneratedGWh] [float] NULL,
	[IrrigatedAcreage] [float] NULL,
	[InterbasinTransferFromID] [nvarchar](250) NULL,
	[InterbasinTransferToID] [nvarchar](250) NULL,
 CONSTRAINT [pkAggregatedAmounts_fact] PRIMARY KEY CLUSTERED 
(
	[OrganizationUUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Input].[AllocationAmounts_fact]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Input].[AllocationAmounts_fact](
	[OrganizationUUID] [nvarchar](250) NOT NULL,
	[AllocationNativeID] [nvarchar](250) NOT NULL,
	[AllocationOwner] [nvarchar](250) NOT NULL,
	[AllocationBasisCV] [nvarchar](250) NULL,
	[AllocationLegalStatusCV] [nvarchar](250) NOT NULL,
	[AllocationTypeCV] [nvarchar](250) NULL,
	[AllocationPriorityDate] [date] NOT NULL,
	[AllocationExpirationDate] [date] NULL,
	[AllocationChangeApplicationIndicator] [nvarchar](250) NULL,
	[LegacyAllocationIDs] [nvarchar](250) NULL,
	[SiteNativeID] [nvarchar](250) NOT NULL,
	[VariableSpecificCV] [nvarchar](250) NOT NULL,
	[BeneficialUseCategory] [nvarchar](500) NOT NULL,
	[WaterSourceName] [nvarchar](250) NOT NULL,
	[MethodName] [nvarchar](250) NOT NULL,
	[TimeframeStartDate] [date] NOT NULL,
	[TimeframeEndDate] [date] NOT NULL,
	[AllocationCropDutyAmount] [float] NULL,
	[AllocationAmount] [float] NULL,
	[AllocationMaximum] [float] NULL,
	[PopulationServed] [float] NULL,
	[PowerGeneratedGWh] [float] NULL,
	[IrrigatedAcreage] [float] NULL,
	[AllocationCommunityWaterSupplySystem] [nvarchar](250) NULL,
	[AllocationSDWISIdentifier] [nvarchar](250) NULL,
	[Geometry] [geometry] NULL,
 CONSTRAINT [pkAllocationAmounts_fact] PRIMARY KEY CLUSTERED 
(
	[OrganizationUUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Input].[BeneficialUses_dim]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Input].[BeneficialUses_dim](
	[BeneficialUseCategory] [nvarchar](500) NOT NULL,
	[PrimaryUseCategory] [nvarchar](250) NULL,
	[USGSCategoryNameCV] [nvarchar](250) NULL,
	[NAICSCodeNameCV] [nvarchar](250) NULL,
 CONSTRAINT [pkBeneficialUses_dim] PRIMARY KEY CLUSTERED 
(
	[BeneficialUseCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Input].[Methods_dim]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Input].[Methods_dim](
	[MethodName] [nvarchar](50) NOT NULL,
	[MethodDescription] [text] NOT NULL,
	[MethodNEMILink] [nvarchar](100) NULL,
	[MethodDOI] [nvarchar](100) NULL,
	[ApplicableResourceTypeCV] [nvarchar](100) NOT NULL,
	[MethodTypeCV] [nvarchar](50) NOT NULL,
	[DataCoverageValue] [nvarchar](100) NULL,
	[DataQualityValueCV] [nvarchar](50) NULL,
	[DataConfidenceValue] [nvarchar](50) NULL,
 CONSTRAINT [pkMethods_dim] PRIMARY KEY CLUSTERED 
(
	[MethodName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Input].[Organizations_dim]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Input].[Organizations_dim](
	[OrganizationUUID] [nvarchar](250) NOT NULL,
	[OrganizationName] [nvarchar](250) NOT NULL,
	[OrganizationPurview] [nvarchar](250) NULL,
	[OrganizationWebsite] [nvarchar](250) NOT NULL,
	[OrganizationPhoneNumber] [nvarchar](250) NOT NULL,
	[OrganizationContactName] [nvarchar](250) NOT NULL,
	[OrganizationContactEmail] [nvarchar](250) NOT NULL,
 CONSTRAINT [pkOrganizations_dim] PRIMARY KEY CLUSTERED 
(
	[OrganizationUUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Input].[RegulatoryOverlay_dim]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Input].[RegulatoryOverlay_dim](
	[RegulatoryOverlayNativeID] [nvarchar](250) NOT NULL,
	[RegulatoryName] [nvarchar](50) NOT NULL,
	[RegulatoryDescription] [nvarchar](max) NOT NULL,
	[RegulatoryStatusCV] [nvarchar](50) NOT NULL,
	[OversightAgency] [nvarchar](250) NOT NULL,
	[RegulatoryStatute] [nvarchar](500) NULL,
	[RegulatoryStatuteLink] [nvarchar](500) NULL,
	[StatutoryEffectiveDate] [date] NOT NULL,
	[StatutoryEndDate] [date] NULL,
 CONSTRAINT [pkRegulatoryOverlay_dim] PRIMARY KEY CLUSTERED 
(
	[RegulatoryOverlayNativeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Input].[RegulatoryReportingUnits_fact]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Input].[RegulatoryReportingUnits_fact](
	[RegulatoryOverlayUUID] [nvarchar](250) NOT NULL,
	[OrganizationUUID] [nvarchar](250) NOT NULL,
	[ReportingUnitNativeID] [nvarchar](250) NOT NULL,
	[ReportYearCV] [nvarchar](4) NOT NULL,
 CONSTRAINT [pkRegulatoryReportingUnits_fact] PRIMARY KEY CLUSTERED 
(
	[RegulatoryOverlayUUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Input].[ReportingUnits_dim]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Input].[ReportingUnits_dim](
	[ReportingUnitNativeID] [nvarchar](250) NOT NULL,
	[ReportingUnitName] [nvarchar](250) NOT NULL,
	[ReportingUnitTypeCV] [nvarchar](20) NOT NULL,
	[ReportingUnitUpdateDate] [date] NULL,
	[ReportingUnitProductVersion] [nvarchar](100) NULL,
	[StateCV] [nvarchar](50) NOT NULL,
	[EPSGCodeCV] [nvarchar](50) NULL,
	[Geometry] [geometry] NULL,
 CONSTRAINT [pkReportingUnits_dim] PRIMARY KEY CLUSTERED 
(
	[ReportingUnitNativeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Input].[Sites_dim]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Input].[Sites_dim](
	[SiteNativeID] [nvarchar](50) NOT NULL,
	[SiteName] [nvarchar](500) NOT NULL,
	[SiteTypeCV] [nvarchar](100) NULL,
	[Longitude] [nvarchar](50) NOT NULL,
	[Latitude] [nvarchar](50) NOT NULL,
	[EPSGCodeCV] [nvarchar](10) NULL,
	[Geometry] [geometry] NULL,
	[CoordinateMethodCV] [nvarchar](100) NOT NULL,
	[CoordinateAccuracy] [nvarchar](255) NULL,
	[GNISCodeCV] [nvarchar](50) NULL,
	[NHDNetworkStatusCV] [nvarchar](50) NULL,
	[NHDProductCV] [nvarchar](50) NULL,
	[NHDUpdateDate] [nvarchar](50) NULL,
	[NHDReachCode] [nvarchar](50) NULL,
	[NHDMeasureNumber] [nvarchar](50) NULL,
 CONSTRAINT [pkSites_dim] PRIMARY KEY CLUSTERED 
(
	[SiteNativeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Input].[SiteVariableAmounts_fact]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Input].[SiteVariableAmounts_fact](
	[OrganizationUUID] [nvarchar](250) NOT NULL,
	[SiteNativeID] [nvarchar](250) NOT NULL,
	[VariableSpecificCV] [nvarchar](250) NOT NULL,
	[BeneficialUseCategory] [nvarchar](500) NOT NULL,
	[WaterSourceNativeID] [nvarchar](250) NOT NULL,
	[MethodName] [nvarchar](250) NOT NULL,
	[TimeframeStartDate] [date] NOT NULL,
	[TimeframeEndDate] [date] NOT NULL,
	[ReportYearCV] [nvarchar](4) NOT NULL,
	[Amount] [float] NULL,
	[PopulationServed] [float] NULL,
	[PowerGeneratedGWh] [float] NULL,
	[IrrigatedAcreage] [float] NULL,
	[CommunityWaterSupplySystem] [nvarchar](250) NULL,
	[SDWISIdentifier] [nvarchar](250) NULL,
	[Geometry] [geometry] NULL,
	[AssociatedNativeAllocationIDs] [nvarchar](500) NULL,
 CONSTRAINT [pkSiteVariableAmounts_fact] PRIMARY KEY CLUSTERED 
(
	[OrganizationUUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Input].[Variables_dim]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Input].[Variables_dim](
	[VariableSpecificCV] [nvarchar](250) NOT NULL,
	[VariableCV] [nvarchar](250) NOT NULL,
	[AggregationStatisticCV] [nvarchar](50) NOT NULL,
	[AggregationInterval ] [numeric](10, 1) NOT NULL,
	[AggregationIntervalUnitCV ] [nvarchar](50) NOT NULL,
	[ReportYearStartMonth ] [nvarchar](10) NOT NULL,
	[ReportYearTypeCV ] [nvarchar](10) NOT NULL,
	[AmountUnitCV] [nvarchar](250) NOT NULL,
	[MaximumAmountUnitCV] [nvarchar](255) NULL,
 CONSTRAINT [pkVariables_dim] PRIMARY KEY CLUSTERED 
(
	[VariableSpecificCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Input].[WaterSources_dim]    Script Date: 5/2/2019 11:13:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Input].[WaterSources_dim](
	[WaterSourceNativeID] [nvarchar](250) NOT NULL,
	[WaterSourceName] [nvarchar](250) NULL,
	[WaterSourceTypeCV] [nvarchar](100) NOT NULL,
	[WaterQualityIndicatorCV] [nvarchar](100) NOT NULL,
	[GNISFeatureNameCV] [nvarchar](250) NULL,
	[Geometry] [geometry] NULL,
 CONSTRAINT [pkWaterSources_dim] PRIMARY KEY CLUSTERED 
(
	[WaterSourceNativeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Core].[AggBridge_BeneficialUses_fact]  WITH CHECK ADD  CONSTRAINT [fk_AggBridge_BeneficialUses_fact_AggregatedAmounts_fact] FOREIGN KEY([AggregatedAmountID])
REFERENCES [Core].[AggregatedAmounts_fact] ([AggregatedAmountID])
GO
ALTER TABLE [Core].[AggBridge_BeneficialUses_fact] CHECK CONSTRAINT [fk_AggBridge_BeneficialUses_fact_AggregatedAmounts_fact]
GO
ALTER TABLE [Core].[AggBridge_BeneficialUses_fact]  WITH CHECK ADD  CONSTRAINT [fk_AggBridge_BeneficialUses_fact_BeneficialUses_dim] FOREIGN KEY([BeneficialUseID])
REFERENCES [Core].[BeneficialUses_dim] ([BeneficialUseID])
GO
ALTER TABLE [Core].[AggBridge_BeneficialUses_fact] CHECK CONSTRAINT [fk_AggBridge_BeneficialUses_fact_BeneficialUses_dim]
GO
ALTER TABLE [Core].[AggregatedAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AggregatedAmounts_Date_dim_end] FOREIGN KEY([TimeframeEndID])
REFERENCES [Core].[Date_dim] ([DateID])
GO
ALTER TABLE [Core].[AggregatedAmounts_fact] CHECK CONSTRAINT [fk_AggregatedAmounts_Date_dim_end]
GO
ALTER TABLE [Core].[AggregatedAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AggregatedAmounts_Date_dim_end_pub] FOREIGN KEY([DataPublicationDate])
REFERENCES [Core].[Date_dim] ([DateID])
GO
ALTER TABLE [Core].[AggregatedAmounts_fact] CHECK CONSTRAINT [fk_AggregatedAmounts_Date_dim_end_pub]
GO
ALTER TABLE [Core].[AggregatedAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AggregatedAmounts_Date_dim_start] FOREIGN KEY([TimeframeStartID])
REFERENCES [Core].[Date_dim] ([DateID])
GO
ALTER TABLE [Core].[AggregatedAmounts_fact] CHECK CONSTRAINT [fk_AggregatedAmounts_Date_dim_start]
GO
ALTER TABLE [Core].[AggregatedAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AggregatedAmounts_fact_BeneficialUses_dim] FOREIGN KEY([BeneficialUseID])
REFERENCES [Core].[BeneficialUses_dim] ([BeneficialUseID])
GO
ALTER TABLE [Core].[AggregatedAmounts_fact] CHECK CONSTRAINT [fk_AggregatedAmounts_fact_BeneficialUses_dim]
GO
ALTER TABLE [Core].[AggregatedAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AggregatedAmounts_fact_Methods_dim] FOREIGN KEY([MethodID])
REFERENCES [Core].[Methods_dim] ([MethodID])
GO
ALTER TABLE [Core].[AggregatedAmounts_fact] CHECK CONSTRAINT [fk_AggregatedAmounts_fact_Methods_dim]
GO
ALTER TABLE [Core].[AggregatedAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AggregatedAmounts_fact_Organizations_dim] FOREIGN KEY([OrganizationID])
REFERENCES [Core].[Organizations_dim] ([OrganizationID])
GO
ALTER TABLE [Core].[AggregatedAmounts_fact] CHECK CONSTRAINT [fk_AggregatedAmounts_fact_Organizations_dim]
GO
ALTER TABLE [Core].[AggregatedAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AggregatedAmounts_fact_ReportingUnits_dim] FOREIGN KEY([ReportingUnitID])
REFERENCES [Core].[ReportingUnits_dim] ([ReportingUnitID])
GO
ALTER TABLE [Core].[AggregatedAmounts_fact] CHECK CONSTRAINT [fk_AggregatedAmounts_fact_ReportingUnits_dim]
GO
ALTER TABLE [Core].[AggregatedAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AggregatedAmounts_fact_ReportYearCV] FOREIGN KEY([ReportYearCV])
REFERENCES [CVs].[ReportYearCV] ([Name])
GO
ALTER TABLE [Core].[AggregatedAmounts_fact] CHECK CONSTRAINT [fk_AggregatedAmounts_fact_ReportYearCV]
GO
ALTER TABLE [Core].[AggregatedAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AggregatedAmounts_fact_Variables_dim] FOREIGN KEY([VariableSpecificID])
REFERENCES [Core].[Variables_dim] ([VariableSpecificID])
GO
ALTER TABLE [Core].[AggregatedAmounts_fact] CHECK CONSTRAINT [fk_AggregatedAmounts_fact_Variables_dim]
GO
ALTER TABLE [Core].[AggregatedAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AggregatedAmounts_fact_WaterSources_dim] FOREIGN KEY([WaterSourceID])
REFERENCES [Core].[WaterSources_dim] ([WaterSourceID])
GO
ALTER TABLE [Core].[AggregatedAmounts_fact] CHECK CONSTRAINT [fk_AggregatedAmounts_fact_WaterSources_dim]
GO
ALTER TABLE [Core].[AllocationAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AllocationAmounts_fact_BeneficialUses_dim] FOREIGN KEY([PrimaryBeneficialUseID])
REFERENCES [Core].[BeneficialUses_dim] ([BeneficialUseID])
GO
ALTER TABLE [Core].[AllocationAmounts_fact] CHECK CONSTRAINT [fk_AllocationAmounts_fact_BeneficialUses_dim]
GO
ALTER TABLE [Core].[AllocationAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AllocationAmounts_fact_Date_dim_appl] FOREIGN KEY([AllocationApplicationDate])
REFERENCES [Core].[Date_dim] ([DateID])
GO
ALTER TABLE [Core].[AllocationAmounts_fact] CHECK CONSTRAINT [fk_AllocationAmounts_fact_Date_dim_appl]
GO
ALTER TABLE [Core].[AllocationAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AllocationAmounts_fact_Date_dim_expir] FOREIGN KEY([AllocationExpirationDate])
REFERENCES [Core].[Date_dim] ([DateID])
GO
ALTER TABLE [Core].[AllocationAmounts_fact] CHECK CONSTRAINT [fk_AllocationAmounts_fact_Date_dim_expir]
GO
ALTER TABLE [Core].[AllocationAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AllocationAmounts_fact_Date_dim_priority] FOREIGN KEY([AllocationPriorityDate])
REFERENCES [Core].[Date_dim] ([DateID])
GO
ALTER TABLE [Core].[AllocationAmounts_fact] CHECK CONSTRAINT [fk_AllocationAmounts_fact_Date_dim_priority]
GO
ALTER TABLE [Core].[AllocationAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AllocationAmounts_fact_Date_dim_pub] FOREIGN KEY([DataPublicationDateID])
REFERENCES [Core].[Date_dim] ([DateID])
GO
ALTER TABLE [Core].[AllocationAmounts_fact] CHECK CONSTRAINT [fk_AllocationAmounts_fact_Date_dim_pub]
GO
ALTER TABLE [Core].[AllocationAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AllocationAmounts_fact_LegalStatus] FOREIGN KEY([AllocationLegalStatusCV])
REFERENCES [CVs].[LegalStatus] ([Name])
GO
ALTER TABLE [Core].[AllocationAmounts_fact] CHECK CONSTRAINT [fk_AllocationAmounts_fact_LegalStatus]
GO
ALTER TABLE [Core].[AllocationAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AllocationAmounts_fact_Methods_dim] FOREIGN KEY([MethodID])
REFERENCES [Core].[Methods_dim] ([MethodID])
GO
ALTER TABLE [Core].[AllocationAmounts_fact] CHECK CONSTRAINT [fk_AllocationAmounts_fact_Methods_dim]
GO
ALTER TABLE [Core].[AllocationAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AllocationAmounts_fact_Organizations_dim] FOREIGN KEY([OrganizationID])
REFERENCES [Core].[Organizations_dim] ([OrganizationID])
GO
ALTER TABLE [Core].[AllocationAmounts_fact] CHECK CONSTRAINT [fk_AllocationAmounts_fact_Organizations_dim]
GO
ALTER TABLE [Core].[AllocationAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AllocationAmounts_fact_Sites_dim] FOREIGN KEY([SiteID])
REFERENCES [Core].[Sites_dim] ([SiteID])
GO
ALTER TABLE [Core].[AllocationAmounts_fact] CHECK CONSTRAINT [fk_AllocationAmounts_fact_Sites_dim]
GO
ALTER TABLE [Core].[AllocationAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AllocationAmounts_fact_Variables_dim] FOREIGN KEY([VariableSpecificID])
REFERENCES [Core].[Variables_dim] ([VariableSpecificID])
GO
ALTER TABLE [Core].[AllocationAmounts_fact] CHECK CONSTRAINT [fk_AllocationAmounts_fact_Variables_dim]
GO
ALTER TABLE [Core].[AllocationAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AllocationAmounts_fact_WaterAllocationBasis] FOREIGN KEY([AllocationBasisCV])
REFERENCES [CVs].[WaterAllocationBasis] ([Name])
GO
ALTER TABLE [Core].[AllocationAmounts_fact] CHECK CONSTRAINT [fk_AllocationAmounts_fact_WaterAllocationBasis]
GO
ALTER TABLE [Core].[AllocationAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AllocationAmounts_fact_WaterRightType] FOREIGN KEY([AllocationTypeCV])
REFERENCES [CVs].[WaterAllocationType] ([Name])
GO
ALTER TABLE [Core].[AllocationAmounts_fact] CHECK CONSTRAINT [fk_AllocationAmounts_fact_WaterRightType]
GO
ALTER TABLE [Core].[AllocationAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_AllocationAmounts_fact_WaterSources_dim] FOREIGN KEY([WaterSourceID])
REFERENCES [Core].[WaterSources_dim] ([WaterSourceID])
GO
ALTER TABLE [Core].[AllocationAmounts_fact] CHECK CONSTRAINT [fk_AllocationAmounts_fact_WaterSources_dim]
GO
ALTER TABLE [Core].[AllocationBridge_BeneficialUses_fact]  WITH CHECK ADD  CONSTRAINT [FK_AllocationBridge_BeneficialUses_fact_AllocationAmounts_fact] FOREIGN KEY([AllocationAmountID])
REFERENCES [Core].[AllocationAmounts_fact] ([AllocationAmountID])
GO
ALTER TABLE [Core].[AllocationBridge_BeneficialUses_fact] CHECK CONSTRAINT [FK_AllocationBridge_BeneficialUses_fact_AllocationAmounts_fact]
GO
ALTER TABLE [Core].[AllocationBridge_BeneficialUses_fact]  WITH CHECK ADD  CONSTRAINT [FK_AllocationBridge_BeneficialUses_fact_BeneficialUses_dim] FOREIGN KEY([BeneficialUseID])
REFERENCES [Core].[BeneficialUses_dim] ([BeneficialUseID])
GO
ALTER TABLE [Core].[AllocationBridge_BeneficialUses_fact] CHECK CONSTRAINT [FK_AllocationBridge_BeneficialUses_fact_BeneficialUses_dim]
GO
ALTER TABLE [Core].[BeneficialUses_dim]  WITH CHECK ADD  CONSTRAINT [fk_BeneficialUses_dim_NAICSCode] FOREIGN KEY([NAICSCodeNameCV])
REFERENCES [CVs].[NAICSCode] ([Name])
GO
ALTER TABLE [Core].[BeneficialUses_dim] CHECK CONSTRAINT [fk_BeneficialUses_dim_NAICSCode]
GO
ALTER TABLE [Core].[BeneficialUses_dim]  WITH CHECK ADD  CONSTRAINT [fk_BeneficialUses_dim_USGSCategory] FOREIGN KEY([USGSCategoryNameCV])
REFERENCES [CVs].[USGSCategory] ([Name])
GO
ALTER TABLE [Core].[BeneficialUses_dim] CHECK CONSTRAINT [fk_BeneficialUses_dim_USGSCategory]
GO
ALTER TABLE [Core].[Methods_dim]  WITH CHECK ADD  CONSTRAINT [FK_Methods_dim_ApplicableResourceType] FOREIGN KEY([ApplicableResourceTypeCV])
REFERENCES [CVs].[ApplicableResourceType] ([Name])
GO
ALTER TABLE [Core].[Methods_dim] CHECK CONSTRAINT [FK_Methods_dim_ApplicableResourceType]
GO
ALTER TABLE [Core].[Methods_dim]  WITH CHECK ADD  CONSTRAINT [FK_Methods_dim_DataQualityValue] FOREIGN KEY([DataQualityValueCV])
REFERENCES [CVs].[DataQualityValue] ([Name])
GO
ALTER TABLE [Core].[Methods_dim] CHECK CONSTRAINT [FK_Methods_dim_DataQualityValue]
GO
ALTER TABLE [Core].[Methods_dim]  WITH CHECK ADD  CONSTRAINT [fk_Methods_dim_MethodType] FOREIGN KEY([MethodTypeCV])
REFERENCES [CVs].[MethodType] ([Name])
GO
ALTER TABLE [Core].[Methods_dim] CHECK CONSTRAINT [fk_Methods_dim_MethodType]
GO
ALTER TABLE [Core].[NHDMetadata]  WITH CHECK ADD  CONSTRAINT [fk_NHDMetadata_NHDNetworkStatus] FOREIGN KEY([NHDNetworkStatusCV])
REFERENCES [CVs].[NHDNetworkStatus] ([Name])
GO
ALTER TABLE [Core].[NHDMetadata] CHECK CONSTRAINT [fk_NHDMetadata_NHDNetworkStatus]
GO
ALTER TABLE [Core].[NHDMetadata]  WITH CHECK ADD  CONSTRAINT [fk_NHDMetadata_NHDProduct] FOREIGN KEY([NHDProductCV])
REFERENCES [CVs].[NHDProduct] ([Name])
GO
ALTER TABLE [Core].[NHDMetadata] CHECK CONSTRAINT [fk_NHDMetadata_NHDProduct]
GO
ALTER TABLE [Core].[RegulatoryReportingUnits_fact]  WITH CHECK ADD  CONSTRAINT [fk_RegulatoryReportingUnits_fact_Date_dim] FOREIGN KEY([DataPublicationDateID])
REFERENCES [Core].[Date_dim] ([DateID])
GO
ALTER TABLE [Core].[RegulatoryReportingUnits_fact] CHECK CONSTRAINT [fk_RegulatoryReportingUnits_fact_Date_dim]
GO
ALTER TABLE [Core].[RegulatoryReportingUnits_fact]  WITH CHECK ADD  CONSTRAINT [fk_RegulatoryReportingUnits_fact_Organizations_dim] FOREIGN KEY([OrganizationID])
REFERENCES [Core].[Organizations_dim] ([OrganizationID])
GO
ALTER TABLE [Core].[RegulatoryReportingUnits_fact] CHECK CONSTRAINT [fk_RegulatoryReportingUnits_fact_Organizations_dim]
GO
ALTER TABLE [Core].[RegulatoryReportingUnits_fact]  WITH CHECK ADD  CONSTRAINT [fk_RegulatoryReportingUnits_fact_RegulatoryOverlay_dim] FOREIGN KEY([RegulatoryOverlayID])
REFERENCES [Core].[RegulatoryOverlay_dim] ([RegulatoryOverlayID])
GO
ALTER TABLE [Core].[RegulatoryReportingUnits_fact] CHECK CONSTRAINT [fk_RegulatoryReportingUnits_fact_RegulatoryOverlay_dim]
GO
ALTER TABLE [Core].[RegulatoryReportingUnits_fact]  WITH CHECK ADD  CONSTRAINT [fk_RegulatoryReportingUnits_fact_ReportingUnits_dim] FOREIGN KEY([ReportingUnitID])
REFERENCES [Core].[ReportingUnits_dim] ([ReportingUnitID])
GO
ALTER TABLE [Core].[RegulatoryReportingUnits_fact] CHECK CONSTRAINT [fk_RegulatoryReportingUnits_fact_ReportingUnits_dim]
GO
ALTER TABLE [Core].[ReportingUnits_dim]  WITH CHECK ADD  CONSTRAINT [fk_ReportingUnits_dim_EPSGCode] FOREIGN KEY([EPSGCodeCV])
REFERENCES [CVs].[EPSGCode] ([Name])
GO
ALTER TABLE [Core].[ReportingUnits_dim] CHECK CONSTRAINT [fk_ReportingUnits_dim_EPSGCode]
GO
ALTER TABLE [Core].[ReportingUnits_dim]  WITH CHECK ADD  CONSTRAINT [fk_ReportingUnits_dim_ReportingUnitType] FOREIGN KEY([ReportingUnitTypeCV])
REFERENCES [CVs].[ReportingUnitType] ([Name])
GO
ALTER TABLE [Core].[ReportingUnits_dim] CHECK CONSTRAINT [fk_ReportingUnits_dim_ReportingUnitType]
GO
ALTER TABLE [Core].[ReportingUnits_dim]  WITH CHECK ADD  CONSTRAINT [FK_ReportingUnits_dim_State] FOREIGN KEY([StateCV])
REFERENCES [CVs].[State] ([Name])
GO
ALTER TABLE [Core].[ReportingUnits_dim] CHECK CONSTRAINT [FK_ReportingUnits_dim_State]
GO
ALTER TABLE [Core].[Sites_dim]  WITH CHECK ADD  CONSTRAINT [FK_Sites_dim_CoordinateMethod] FOREIGN KEY([CoordinateMethodCV])
REFERENCES [CVs].[CoordinateMethod] ([Name])
GO
ALTER TABLE [Core].[Sites_dim] CHECK CONSTRAINT [FK_Sites_dim_CoordinateMethod]
GO
ALTER TABLE [Core].[Sites_dim]  WITH CHECK ADD  CONSTRAINT [FK_Sites_dim_EPSGCode] FOREIGN KEY([EPSGCodeCV])
REFERENCES [CVs].[EPSGCode] ([Name])
GO
ALTER TABLE [Core].[Sites_dim] CHECK CONSTRAINT [FK_Sites_dim_EPSGCode]
GO
ALTER TABLE [Core].[Sites_dim]  WITH CHECK ADD  CONSTRAINT [FK_Sites_dim_GNISFeatureName] FOREIGN KEY([GNISCodeCV])
REFERENCES [CVs].[GNISFeatureName] ([Name])
GO
ALTER TABLE [Core].[Sites_dim] CHECK CONSTRAINT [FK_Sites_dim_GNISFeatureName]
GO
ALTER TABLE [Core].[Sites_dim]  WITH CHECK ADD  CONSTRAINT [FK_Sites_dim_NHDNetworkStatus] FOREIGN KEY([NHDNetworkStatusCV])
REFERENCES [CVs].[NHDNetworkStatus] ([Name])
GO
ALTER TABLE [Core].[Sites_dim] CHECK CONSTRAINT [FK_Sites_dim_NHDNetworkStatus]
GO
ALTER TABLE [Core].[Sites_dim]  WITH CHECK ADD  CONSTRAINT [FK_Sites_dim_NHDProduct] FOREIGN KEY([NHDProductCV])
REFERENCES [CVs].[NHDProduct] ([Name])
GO
ALTER TABLE [Core].[Sites_dim] CHECK CONSTRAINT [FK_Sites_dim_NHDProduct]
GO
ALTER TABLE [Core].[Sites_dim]  WITH CHECK ADD  CONSTRAINT [fk_Sites_dim_SiteType] FOREIGN KEY([SiteTypeCV])
REFERENCES [CVs].[SiteType] ([Name])
GO
ALTER TABLE [Core].[Sites_dim] CHECK CONSTRAINT [fk_Sites_dim_SiteType]
GO
ALTER TABLE [Core].[Sites_dim]  WITH CHECK ADD  CONSTRAINT [fk_Sites_NHDMetadata] FOREIGN KEY([NHDMetadataID])
REFERENCES [Core].[NHDMetadata] ([NHDMetadataID])
GO
ALTER TABLE [Core].[Sites_dim] CHECK CONSTRAINT [fk_Sites_NHDMetadata]
GO
ALTER TABLE [Core].[SitesAllocationAmountsBridge_fact]  WITH CHECK ADD  CONSTRAINT [FK_SitesAllocationAmountsBridge_fact_AllocationAmounts_fact] FOREIGN KEY([AllocationAmountID])
REFERENCES [Core].[AllocationAmounts_fact] ([AllocationAmountID])
GO
ALTER TABLE [Core].[SitesAllocationAmountsBridge_fact] CHECK CONSTRAINT [FK_SitesAllocationAmountsBridge_fact_AllocationAmounts_fact]
GO
ALTER TABLE [Core].[SitesAllocationAmountsBridge_fact]  WITH CHECK ADD  CONSTRAINT [FK_SitesAllocationAmountsBridge_fact_Sites_dim] FOREIGN KEY([SiteID])
REFERENCES [Core].[Sites_dim] ([SiteID])
GO
ALTER TABLE [Core].[SitesAllocationAmountsBridge_fact] CHECK CONSTRAINT [FK_SitesAllocationAmountsBridge_fact_Sites_dim]
GO
ALTER TABLE [Core].[SitesBridge_BeneficialUses_fact]  WITH CHECK ADD  CONSTRAINT [fk_SitesBridge_BeneficialUses_fact_BeneficialUses_dim] FOREIGN KEY([BeneficialUseID])
REFERENCES [Core].[BeneficialUses_dim] ([BeneficialUseID])
GO
ALTER TABLE [Core].[SitesBridge_BeneficialUses_fact] CHECK CONSTRAINT [fk_SitesBridge_BeneficialUses_fact_BeneficialUses_dim]
GO
ALTER TABLE [Core].[SitesBridge_BeneficialUses_fact]  WITH CHECK ADD  CONSTRAINT [fk_SitesBridge_BeneficialUses_fact_SiteVariableAmounts_fact] FOREIGN KEY([SiteVariableAmountID])
REFERENCES [Core].[SiteVariableAmounts_fact] ([SiteVariableAmountID])
GO
ALTER TABLE [Core].[SitesBridge_BeneficialUses_fact] CHECK CONSTRAINT [fk_SitesBridge_BeneficialUses_fact_SiteVariableAmounts_fact]
GO
ALTER TABLE [Core].[SitesVariableAmountBridgeAllocations_fact]  WITH CHECK ADD  CONSTRAINT [FK_SitesVariableAmountBridgeAllocations_fact_Allocations_dim] FOREIGN KEY([AllocationID])
REFERENCES [Core].[Allocations_dim] ([AllocationID])
GO
ALTER TABLE [Core].[SitesVariableAmountBridgeAllocations_fact] CHECK CONSTRAINT [FK_SitesVariableAmountBridgeAllocations_fact_Allocations_dim]
GO
ALTER TABLE [Core].[SitesVariableAmountBridgeAllocations_fact]  WITH CHECK ADD  CONSTRAINT [FK_SitesVariableAmountBridgeAllocations_fact_SiteVariableAmounts_fact] FOREIGN KEY([SiteVariableAmountID])
REFERENCES [Core].[SiteVariableAmounts_fact] ([SiteVariableAmountID])
GO
ALTER TABLE [Core].[SitesVariableAmountBridgeAllocations_fact] CHECK CONSTRAINT [FK_SitesVariableAmountBridgeAllocations_fact_SiteVariableAmounts_fact]
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_SiteVariableAmounts_Date_dim_end] FOREIGN KEY([TimeframeEnd])
REFERENCES [Core].[Date_dim] ([DateID])
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact] CHECK CONSTRAINT [fk_SiteVariableAmounts_Date_dim_end]
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_SiteVariableAmounts_Date_dim_pub] FOREIGN KEY([DataPublicationDate])
REFERENCES [Core].[Date_dim] ([DateID])
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact] CHECK CONSTRAINT [fk_SiteVariableAmounts_Date_dim_pub]
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_SiteVariableAmounts_Date_dim_start] FOREIGN KEY([TimeframeStart])
REFERENCES [Core].[Date_dim] ([DateID])
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact] CHECK CONSTRAINT [fk_SiteVariableAmounts_Date_dim_start]
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_SiteVariableAmounts_fact_CropType] FOREIGN KEY([CropTypeCV])
REFERENCES [CVs].[CropType] ([Name])
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact] CHECK CONSTRAINT [fk_SiteVariableAmounts_fact_CropType]
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_SiteVariableAmounts_fact_IrrigationMethod] FOREIGN KEY([IrrigationMethodCV])
REFERENCES [CVs].[IrrigationMethod] ([Name])
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact] CHECK CONSTRAINT [fk_SiteVariableAmounts_fact_IrrigationMethod]
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_SiteVariableAmounts_fact_Methods_dim] FOREIGN KEY([MethodID])
REFERENCES [Core].[Methods_dim] ([MethodID])
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact] CHECK CONSTRAINT [fk_SiteVariableAmounts_fact_Methods_dim]
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_SiteVariableAmounts_fact_Organizations_dim] FOREIGN KEY([OrganizationID])
REFERENCES [Core].[Organizations_dim] ([OrganizationID])
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact] CHECK CONSTRAINT [fk_SiteVariableAmounts_fact_Organizations_dim]
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_SiteVariableAmounts_fact_ReportYearCV] FOREIGN KEY([ReportYearCV])
REFERENCES [CVs].[ReportYearCV] ([Name])
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact] CHECK CONSTRAINT [fk_SiteVariableAmounts_fact_ReportYearCV]
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_SiteVariableAmounts_fact_Sites_dim] FOREIGN KEY([SiteID])
REFERENCES [Core].[Sites_dim] ([SiteID])
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact] CHECK CONSTRAINT [fk_SiteVariableAmounts_fact_Sites_dim]
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_SiteVariableAmounts_fact_Variables_dim] FOREIGN KEY([VariableSpecificID])
REFERENCES [Core].[Variables_dim] ([VariableSpecificID])
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact] CHECK CONSTRAINT [fk_SiteVariableAmounts_fact_Variables_dim]
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact]  WITH CHECK ADD  CONSTRAINT [fk_SiteVariableAmounts_fact_WaterSources_dim] FOREIGN KEY([WaterSourceID])
REFERENCES [Core].[WaterSources_dim] ([WaterSourceID])
GO
ALTER TABLE [Core].[SiteVariableAmounts_fact] CHECK CONSTRAINT [fk_SiteVariableAmounts_fact_WaterSources_dim]
GO
ALTER TABLE [Core].[Variables_dim]  WITH CHECK ADD  CONSTRAINT [fk_Variables_dim_AggregationStatistic] FOREIGN KEY([AggregationStatisticCV])
REFERENCES [CVs].[AggregationStatistic] ([Name])
GO
ALTER TABLE [Core].[Variables_dim] CHECK CONSTRAINT [fk_Variables_dim_AggregationStatistic]
GO
ALTER TABLE [Core].[Variables_dim]  WITH CHECK ADD  CONSTRAINT [fk_Variables_dim_ReportYearType] FOREIGN KEY([ReportYearTypeCV ])
REFERENCES [CVs].[ReportYearType] ([Name])
GO
ALTER TABLE [Core].[Variables_dim] CHECK CONSTRAINT [fk_Variables_dim_ReportYearType]
GO
ALTER TABLE [Core].[Variables_dim]  WITH CHECK ADD  CONSTRAINT [fk_Variables_dim_Units] FOREIGN KEY([AmountUnitCV])
REFERENCES [CVs].[Units] ([Name])
GO
ALTER TABLE [Core].[Variables_dim] CHECK CONSTRAINT [fk_Variables_dim_Units]
GO
ALTER TABLE [Core].[Variables_dim]  WITH CHECK ADD  CONSTRAINT [fk_Variables_dim_Units_interval] FOREIGN KEY([AggregationIntervalUnitCV ])
REFERENCES [CVs].[Units] ([Name])
GO
ALTER TABLE [Core].[Variables_dim] CHECK CONSTRAINT [fk_Variables_dim_Units_interval]
GO
ALTER TABLE [Core].[Variables_dim]  WITH CHECK ADD  CONSTRAINT [fk_Variables_dim_Units_max] FOREIGN KEY([MaximumAmountUnitCV])
REFERENCES [CVs].[Units] ([Name])
GO
ALTER TABLE [Core].[Variables_dim] CHECK CONSTRAINT [fk_Variables_dim_Units_max]
GO
ALTER TABLE [Core].[Variables_dim]  WITH CHECK ADD  CONSTRAINT [fk_Variables_dim_Variable] FOREIGN KEY([VariableCV])
REFERENCES [CVs].[Variable] ([Name])
GO
ALTER TABLE [Core].[Variables_dim] CHECK CONSTRAINT [fk_Variables_dim_Variable]
GO
ALTER TABLE [Core].[Variables_dim]  WITH CHECK ADD  CONSTRAINT [fk_Variables_dim_VariableSpecific] FOREIGN KEY([VariableSpecificCV])
REFERENCES [CVs].[VariableSpecific] ([Name])
GO
ALTER TABLE [Core].[Variables_dim] CHECK CONSTRAINT [fk_Variables_dim_VariableSpecific]
GO
ALTER TABLE [Core].[WaterSources_dim]  WITH CHECK ADD  CONSTRAINT [fk_WaterSources_dim_GNISFeatureName] FOREIGN KEY([GNISFeatureNameCV])
REFERENCES [CVs].[GNISFeatureName] ([Name])
GO
ALTER TABLE [Core].[WaterSources_dim] CHECK CONSTRAINT [fk_WaterSources_dim_GNISFeatureName]
GO
ALTER TABLE [Core].[WaterSources_dim]  WITH CHECK ADD  CONSTRAINT [fk_WaterSources_dim_WaterQualityIndicator] FOREIGN KEY([WaterQualityIndicatorCV])
REFERENCES [CVs].[WaterQualityIndicator] ([Name])
GO
ALTER TABLE [Core].[WaterSources_dim] CHECK CONSTRAINT [fk_WaterSources_dim_WaterQualityIndicator]
GO
ALTER TABLE [Core].[WaterSources_dim]  WITH CHECK ADD  CONSTRAINT [fk_WaterSources_dim_WaterSourceType] FOREIGN KEY([WaterSourceTypeCV])
REFERENCES [CVs].[WaterSourceType] ([Name])
GO
ALTER TABLE [Core].[WaterSources_dim] CHECK CONSTRAINT [fk_WaterSources_dim_WaterSourceType]
GO
ALTER TABLE [CVs].[ApplicableResourceType]  WITH CHECK ADD  CONSTRAINT [FK_ApplicableResourceType_ApplicableResourceType] FOREIGN KEY([Name])
REFERENCES [CVs].[ApplicableResourceType] ([Name])
GO
ALTER TABLE [CVs].[ApplicableResourceType] CHECK CONSTRAINT [FK_ApplicableResourceType_ApplicableResourceType]
GO

ALTER DATABASE [WaDE2] SET  READ_WRITE 
GO
