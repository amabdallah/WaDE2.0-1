-- Adel Abdallah, Senior Hydroinformatics Specialist at the WSWC, Feb 2019

--This is a Data Definition Language (DDL) script that
--generates a blank schema of the Water Data Exchange Data Model (WaDE)
-- for Microsoft SQL Server database.

-- Generated by Adel Abdallah Feb, 2019 based on WaDE XML design named WaDE2.0_schema_star generated by DbWrench V4.04 @ http://www.dbwrench.com/
-- WaDE All rights reserved. See BSD 3-Clause Licence @ https://github.com/WSWCWaterDataExchange/WaDE2.0/blob/master/LICENSE 

-- Open MySQL Workbench, Create a New SQL Tab for Executing queries
-- Simply copy all this script and paste into the new window of "create query"
-- Then click execute. The script should run successfully and create the 41 empty tables of WaDE

--------------------------------------------------------------------------------------------------
DROP SCHEMA IF EXISTS WaDE;

CREATE SCHEMA IF NOT EXISTS WaDE;

/***************************************************************************/
/*************************** CREATE INPUTTABLES ****************************/
/***************************************************************************/
USE WaDE;

CREATE TABLE AggregatedAmounts_VariableTable (
	OrganizationUUID VARCHAR (250)  NOT NULL PRIMARY KEY,
	ReportingUnitNativeID VARCHAR (250)  NOT NULL,
	VariableSpecificCV VARCHAR (250)  NOT NULL,
	BeneficialUseCategory VARCHAR (500)  NOT NULL,
	PrimaryUseCategory VARCHAR (250)  NULL,
	AllocationUSGSCategoryCV VARCHAR (250)  NULL,
	WaterSourceNativeID VARCHAR (250)  NOT NULL,
	MethodName VARCHAR (250)  NOT NULL,
	TimeframeStartDate DATE   NOT NULL,
	TimeframeEndDate DATE   NOT NULL,
	DataPublicationDate DATE   NOT NULL,
	ReportYear VARCHAR (4)  NOT NULL,
	Amount FLOAT   NULL,
	PopulationServed FLOAT   NULL,
	PowerGeneratedGWh FLOAT   NULL,
	IrrigatedAcreage FLOAT   NULL,
	InterbasinTransferFromID VARCHAR (250)  NULL,
	InterbasinTransferToID VARCHAR (250)  NULL
);

CREATE TABLE AllocationAmounts_VariableTable (
	OrganizationUUID nvarchar (250)  NOT NULL PRIMARY KEY,
	AllocationNativeID nvarchar (250)  NOT NULL,
	AllocationOwner nvarchar (250)  NOT NULL,
	AllocationBasisCV VARCHAR (250)  NULL,
	AllocationLegalStatusCV nvarchar (250)  NOT NULL,
	AllocationApplicationDate DATE   NULL,
	AllocationPriorityDate DATE   NOT NULL,
	AllocationExpirationDate DATE   NULL,
	AllocationChangeApplicationIndicator nvarchar (250)  NULL,
	LegacyAllocationIDs nvarchar (250)  NULL,
	SiteNativeID nvarchar (250)  NOT NULL,
	VariableSpecificCV nvarchar (250)  NOT NULL,
	BeneficialUseCategory nvarchar (500)  NOT NULL,
	PrimaryUseCategory nvarchar (250)  NULL,
	AllocationUSGSCategoryCV nvarchar (250)  NULL,
	WaterSourceName nvarchar (250)  NOT NULL,
	MethodName nvarchar (250)  NOT NULL,
	TimeframeStartDate DATE   NOT NULL,
	TimeframeEndDate DATE   NOT NULL,
	DataPublicationDate DATE   NOT NULL,
	ReportYear nchar (4)  NOT NULL,
	AllocationCropDutyAmount FLOAT   NULL,
	AllocationAmount FLOAT   NULL,
	AllocationMaximum FLOAT   NULL,
	PopulationServed FLOAT   NULL,
	PowerGeneratedGWh FLOAT   NULL,
	IrrigatedAcreage FLOAT   NULL,
	AllocationCommunityWaterSupplySystem nvarchar (250)  NULL,
	SDWISIdentifier nvarchar (250)  NULL,
	Geometry geometry   NULL
);

CREATE TABLE BeneficialUses_dim_Input (
	BeneficialUseCategory nvarchar (500)  NOT NULL PRIMARY KEY,
	PrimaryUseCategory nvarchar (250)  NULL,
	USGSCategoryNameCV nvarchar (250)  NULL,
	NAICSCodeNameCV nvarchar (250)  NULL
);

CREATE TABLE Methods_dim_input (
	MethodName nvarchar (50)  NOT NULL PRIMARY KEY,
	MethodDescription TEXT   NOT NULL,
	MethodNEMILink nvarchar (100)  NULL,
	ApplicableResourceTypeCV nvarchar (100)  NOT NULL,
	MethodTypeCV nvarchar (50)  NOT NULL,
	DataCoverageValue nvarchar (100)  NULL,
	DataQualityValueCV nvarchar (50)  NULL,
	DataConfidenceValue nvarchar (50)  NULL
);

CREATE TABLE Organizations_dim_Input (
	OrganizationUUID nvarchar (250)  NOT NULL PRIMARY KEY,
	OrganizationName nvarchar (250)  NOT NULL,
	OrganizationPurview nvarchar (250)  NULL,
	OrganizationWebsite nvarchar (250)  NOT NULL,
	OrganizationPhoneNumber nvarchar (250)  NOT NULL,
	OrganizationContactName nvarchar (250)  NOT NULL,
	OrganizationContactEmail nvarchar (250)  NOT NULL
);

CREATE TABLE RegulatoryOverlay_dim_input (
	RegulatoryOverlayNativeID nvarchar (250)  NULL PRIMARY KEY,
	RegulatoryName nvarchar (50)  NOT NULL,
	RegulatoryDescription nvarchar(max)   NOT NULL,
	RegulatoryStatusCV nvarchar (50)  NOT NULL,
	OversightAgency nvarchar (250)  NOT NULL,
	RegulatoryStatute nvarchar (500)  NULL,
	RegulatoryStatuteLink VARCHAR (500)  NULL,
	TimeframeStartID BIGINT   NOT NULL,
	TimeframeEndID BIGINT   NOT NULL,
	ReportYearTypeCV nvarchar (10)  NOT NULL,
	ReportYearStartMonth nvarchar (5)  NOT NULL
);

CREATE TABLE RegulatoryReportingUnits_VariableTable (
	RegulatoryOverlayUUID VARCHAR (250)  NOT NULL PRIMARY KEY,
	OrganizationUUID VARCHAR (250)  NOT NULL,
	ReportingUnitNativeID VARCHAR (250)  NOT NULL,
	DataPublicationDate DATE   NOT NULL,
	ReportYearCV VARCHAR (4)  NOT NULL
);

CREATE TABLE ReportingUnits_dim_Input (
	ReportingUnitNativeID nvarchar (250)  NOT NULL PRIMARY KEY,
	ReportingUnitName nvarchar (250)  NOT NULL,
	ReportingUnitTypeCV nvarchar (20)  NOT NULL,
	ReportingUnitUpdateDate DATE   NULL,
	ReportingUnitProductVersion nvarchar (100)  NULL,
	StateCV nvarchar (50)  NOT NULL,
	EPSGCodeCV nvarchar (50)  NULL,
	Geometry polygon   NULL
);

CREATE TABLE Sites_dim_input (
	SiteNativeID nvarchar (50)  NULL PRIMARY KEY,
	SiteName nvarchar (500)  NOT NULL,
	SiteTypeCV VARCHAR (100)  NULL,
	Longitude nvarchar (50)  NOT NULL,
	Latitude nvarchar (50)  NOT NULL,
	Geometry geometry   NULL,
	CoordinateMethodCV nvarchar (100)  NOT NULL,
	CoordinateAccuracy nvarchar (255)  NULL,
	GNISCodeCV nvarchar (50)  NULL
);

CREATE TABLE SiteVariableAmounts_VariableTable (
	OrganizationUUID VARCHAR (250)  NOT NULL PRIMARY KEY,
	AllocationUUID VARCHAR (250)  NULL,
	SiteNativeID VARCHAR (250)  NOT NULL,
	VariableSpecificCV VARCHAR (250)  NOT NULL,
	BeneficialUseCategory VARCHAR (500)  NOT NULL,
	PrimaryUseCategory VARCHAR (250)  NULL,
	AllocationUSGSCategoryCV VARCHAR (250)  NULL,
	WaterSourceNativeID VARCHAR (250)  NOT NULL,
	MethodName VARCHAR (250)  NOT NULL,
	TimeframeStartDate DATE   NOT NULL,
	TimeframeEndDate DATE   NOT NULL,
	DataPublicationDate DATE   NOT NULL,
	ReportYear VARCHAR (4)  NOT NULL,
	Amount FLOAT   NULL,
	PopulationServed FLOAT   NULL,
	PowerGeneratedGWh FLOAT   NULL,
	IrrigatedAcreage FLOAT   NULL,
	AllocationCommunityWaterSupplySystem VARCHAR (250)  NULL,
	SDWISIdentifier VARCHAR (250)  NULL,
	InterbasinTransferFromID VARCHAR (250)  NULL,
	InterbasinTransferToID VARCHAR (250)  NULL,
	Geometry BLOB   NULL
);

CREATE TABLE Variables_dim_input (
	VariableSpecificCV nvarchar (250)  NOT NULL PRIMARY KEY,
	VariableCV nvarchar (250)  NOT NULL,
	AggregationStatisticCV nvarchar (50)  NOT NULL,
	AggregationInterval  NUMERIC (10)  NOT NULL,
	AggregationIntervalUnitCV  nvarchar (50)  NOT NULL,
	ReportYearStartMonth  nvarchar (10)  NOT NULL,
	ReportYearTypeCV  nvarchar (10)  NOT NULL,
	AmountUnitCV nvarchar (250)  NOT NULL,
	MaximumAmountUnitCV nvarchar (255)  NULL
);

CREATE TABLE WaterSources_dim_input (
	WaterSourceNativeID nvarchar (250)  NULL PRIMARY KEY,
	WaterSourceName nvarchar (250)  NULL,
	WaterSourceTypeCV nvarchar (100)  NOT NULL,
	WaterQualityIndicatorCV nvarchar (100)  NOT NULL,
	GNISFeatureNameCV nvarchar (250)  NULL,
	Geometry geometry   NULL
);

/***************************************************************************/
/**************************** CREATE WADE2_STAR ****************************/
/***************************************************************************/
USE WaDE;

CREATE TABLE AggBridge_BeneficialUses_fact (
	AggBridgeID BIGINT   NOT NULL PRIMARY KEY,
	BeneficialUseID BIGINT   NOT NULL,
	AggregatedAmountID BIGINT   NOT NULL
);

CREATE TABLE AggregatedAmounts_fact (
	AggregatedAmountID BIGINT   NOT NULL PRIMARY KEY,
	OrganizationID BIGINT   NOT NULL,
	ReportingUnitID BIGINT   NOT NULL,
	VariableSpecificID BIGINT   NOT NULL,
	BeneficialUseID BIGINT   NOT NULL,
	WaterSourceID BIGINT   NOT NULL,
	MethodID BIGINT   NOT NULL,
	TimeframeStartID BIGINT   NULL,
	TimeframeEndID BIGINT   NULL,
	DataPublicationDate BIGINT   NULL,
	ReportYear nchar (4)  NULL,
	Amount FLOAT   NOT NULL,
	PopulationServed FLOAT   NULL,
	PowerGeneratedGWh FLOAT   NULL,
	IrrigatedAcreage FLOAT   NULL,
	InterbasinTransferToID nvarchar (100)  NULL,
	InterbasinTransferFromID nvarchar (100)  NULL
);

CREATE TABLE AllocationAmounts_fact (
	AllocationAmountID BIGINT   NOT NULL PRIMARY KEY,
	OrganizationID BIGINT   NOT NULL,
	AllocationID BIGINT   NOT NULL,
	SiteID BIGINT   NOT NULL,
	VariableSpecificID BIGINT   NOT NULL,
	BeneficialUsesID BIGINT   NOT NULL,
	WaterSourceID BIGINT   NOT NULL,
	MethodID BIGINT   NOT NULL,
	TimeframeStartDateID BIGINT   NOT NULL,
	TimeframeEndDateID BIGINT   NOT NULL,
	DataPublicationDateID BIGINT   NOT NULL,
	ReportYear nchar (4)  NOT NULL,
	AllocationCropDutyAmount FLOAT   NULL,
	AllocationAmount FLOAT   NULL,
	AllocationMaximum FLOAT   NULL,
	PopulationServed FLOAT   NULL,
	PowerGeneratedGWh FLOAT   NULL,
	IrrigatedAcreage FLOAT   NULL,
	AllocationCommunityWaterSupplySystem nvarchar (250)  NULL,
	SDWISIdentifier nvarchar (250)  NULL,
	Geometry geometry   NULL
);

CREATE TABLE AllocationBridge_BeneficialUses_fact (
	AllocationBridgeID BIGINT   NOT NULL PRIMARY KEY,
	BeneficialUseID BIGINT   NOT NULL,
	AllocationAmountID BIGINT   NOT NULL
);

CREATE TABLE Allocations_dim (
	AllocationID BIGINT   NOT NULL PRIMARY KEY,
	AllocationUUID nvarchar (50)  NOT NULL,
	AllocationNativeID nvarchar (250)  NOT NULL,
	AllocationOwner nvarchar (255)  NOT NULL,
	AllocationBasisCV nvarchar (250)  NULL,
	AllocationLegalStatusCV nvarchar (50)  NOT NULL,
	AllocationApplicationDate BIGINT   NULL,
	AllocationPriorityDate BIGINT   NOT NULL,
	AllocationExpirationDate BIGINT   NULL,
	AllocationChangeApplicationIndicator nvarchar (100)  NULL,
	LegacyAllocationIDs nvarchar (100)  NULL
);

CREATE TABLE Allocations_dim_Input (
	AllocationNativeID nvarchar (250)  NOT NULL PRIMARY KEY,
	AllocationOwner nvarchar (255)  NOT NULL,
	AllocationBasisCV nvarchar (250)  NULL,
	AllocationLegalStatusCV nvarchar (50)  NOT NULL,
	AllocationApplicationDate BIGINT   NULL,
	AllocationPriorityDate BIGINT   NOT NULL,
	AllocationExpirationDate BIGINT   NULL,
	AllocationChangeApplicationIndicator nvarchar (100)  NULL,
	LegacyAllocationIDs nvarchar (100)  NULL
);

CREATE TABLE BeneficialUses_dim (
	BeneficialUseID BIGINT   NOT NULL PRIMARY KEY,
	BeneficialUseUUID nvarchar (500)  NULL,
	BeneficialUseCategory nvarchar (500)  NOT NULL,
	PrimaryUseCategory nvarchar (250)  NULL,
	USGSCategoryNameCV nvarchar (250)  NULL,
	NAICSCodeNameCV nvarchar (250)  NULL
);

CREATE TABLE CVs_AggregationStatistic (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_CropType (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI VARCHAR (250)  NULL
);

CREATE TABLE CVs_EPSGCode (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_GNISFeatureName (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_IrrigationMethod (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI VARCHAR (250)  NULL
);

CREATE TABLE CVs_LegalStatus (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_MethodType (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_NAICSCode (
	Name nvarchar (250)  NOT NULL PRIMARY KEY,
	Term nvarchar (250)  NOT NULL,
	Definition nvarchar(max)   NULL,
	Category nvarchar (250)  NULL,
	SourceVocabularyURI	 nvarchar (250)  NULL
);

CREATE TABLE CVs_NHDNetworkStatus (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_NHDProduct (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_RegulatoryStatus (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_ReportingUnitType (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_ReportYearCV (
	Name nvarchar (4)  NOT NULL PRIMARY KEY,
	Term nvarchar (250)  NOT NULL,
	Definition nvarchar(max)   NULL,
	Category nvarchar (250)  NULL,
	SourceVocabularyURI	 nvarchar (250)  NULL
);

CREATE TABLE CVs_ReportYearType (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_Units (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_USGSCategory (
	Name nvarchar (250)  NOT NULL PRIMARY KEY,
	Term nvarchar (250)  NOT NULL,
	Definition nvarchar(max)   NULL,
	Category nvarchar (250)  NULL,
	SourceVocabularyURI	 nvarchar (250)  NULL
);

CREATE TABLE CVs_Variable (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_VariableSpecific (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI VARCHAR (250)  NULL
);

CREATE TABLE CVs_WaterAllocationBasis (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_WaterQualityIndicator (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE CVs_WaterSourceType (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI	 VARCHAR (250)  NULL
);

CREATE TABLE Date_dim (
	DateID BIGINT   NOT NULL PRIMARY KEY,
	Date DATE   NOT NULL,
	Year nchar (4)  NULL
);

CREATE TABLE Methods_dim (
	MethodID BIGINT   NOT NULL PRIMARY KEY,
	MethodUUID nvarchar (100)  NOT NULL,
	MethodName nvarchar (50)  NOT NULL,
	MethodDescription TEXT   NOT NULL,
	MethodNEMILink nvarchar (100)  NULL,
	ApplicableResourceTypeCV nvarchar (100)  NOT NULL,
	MethodTypeCV nvarchar (50)  NOT NULL,
	DataCoverageValue nvarchar (100)  NULL,
	DataQualityValueCV nvarchar (50)  NULL,
	DataConfidenceValue nvarchar (50)  NULL
);

CREATE TABLE NHDMetadata (
	NHDMetadataID INT   NOT NULL PRIMARY KEY,
	NHDNetworkStatusCV VARCHAR (50)  NOT NULL,
	NHDProductCV VARCHAR (50)  NULL,
	NHDUpdateDate DATE   NULL,
	NHDReachCode VARCHAR (50)  NULL,
	NHDMeasureNumber VARCHAR (50)  NULL
);

CREATE TABLE NHDStatus (
	Name VARCHAR (250)  NOT NULL PRIMARY KEY,
	Term VARCHAR (250)  NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (250)  NULL,
	SourceVocabularyURI VARCHAR (250)  NULL
);

CREATE TABLE Organizations_dim (
	OrganizationID BIGINT   NOT NULL PRIMARY KEY,
	OrganizationUUID nvarchar (250)  NOT NULL,
	OrganizationName nvarchar (250)  NOT NULL,
	OrganizationPurview nvarchar (250)  NULL,
	OrganizationWebsite nvarchar (250)  NOT NULL,
	OrganizationPhoneNumber nvarchar (250)  NOT NULL,
	OrganizationContactName nvarchar (250)  NOT NULL,
	OrganizationContactEmail nvarchar (250)  NOT NULL
);

CREATE TABLE RegulatoryOverlay_dim (
	RegulatoryOverlayID BIGINT   NOT NULL PRIMARY KEY,
	RegulatoryOverlayUUID nvarchar (250)  NULL,
	RegulatoryOverlayNativeID nvarchar (250)  NULL,
	RegulatoryName nvarchar (50)  NOT NULL,
	RegulatoryDescription nvarchar(max)   NOT NULL,
	RegulatoryStatusCV nvarchar (50)  NOT NULL,
	OversightAgency nvarchar (250)  NOT NULL,
	RegulatoryStatute nvarchar (500)  NULL,
	RegulatoryStatuteLink VARCHAR (500)  NULL,
	TimeframeStartID BIGINT   NOT NULL,
	TimeframeEndID BIGINT   NOT NULL,
	ReportYearTypeCV nvarchar (10)  NOT NULL,
	ReportYearStartMonth nvarchar (5)  NOT NULL
);

CREATE TABLE RegulatoryReportingUnits_fact (
	BridgeID BIGINT   NOT NULL PRIMARY KEY,
	RegulatoryOverlayID BIGINT   NOT NULL,
	OrganizationID BIGINT   NOT NULL,
	ReportingUnitID BIGINT   NOT NULL,
	DataPublicationDateID BIGINT   NOT NULL,
	ReportYearCV VARCHAR (4)  NOT NULL
);

CREATE TABLE ReportingUnits_dim (
	ReportingUnitID BIGINT   NOT NULL PRIMARY KEY,
	ReportingUnitUUID nvarchar (250)  NOT NULL,
	ReportingUnitNativeID nvarchar (250)  NOT NULL,
	ReportingUnitName nvarchar (250)  NOT NULL,
	ReportingUnitTypeCV nvarchar (20)  NOT NULL,
	ReportingUnitUpdateDate DATE   NULL,
	ReportingUnitProductVersion nvarchar (100)  NULL,
	StateCV nvarchar (50)  NOT NULL,
	EPSGCodeCV nvarchar (50)  NULL,
	Geometry polygon   NULL
);

CREATE TABLE Sites_dim (
	SiteID BIGINT   NOT NULL PRIMARY KEY,
	SiteUUID nvarchar (55)  NOT NULL,
	SiteNativeID nvarchar (50)  NULL,
	SiteName nvarchar (500)  NOT NULL,
	SiteTypeCV VARCHAR (100)  NULL,
	Longitude nvarchar (50)  NOT NULL,
	Latitude nvarchar (50)  NOT NULL,
	SitePoint geometry   NULL,
	Geometry geometry   NULL,
	CoordinateMethodCV nvarchar (100)  NOT NULL,
	CoordinateAccuracy nvarchar (255)  NULL,
	GNISCodeCV nvarchar (50)  NULL,
	NHDMetadataID BIGINT   NULL
);

CREATE TABLE SitesBridge_BeneficialUses_fact (
	SiteBridgeID BIGINT   NOT NULL PRIMARY KEY,
	BeneficialUseID BIGINT   NOT NULL,
	SiteVariableAmountID BIGINT   NOT NULL
);

CREATE TABLE SiteVariableAmounts_fact (
	SiteVariableAmountID BIGINT   NOT NULL PRIMARY KEY,
	OrganizationID BIGINT   NOT NULL,
	AllocationID BIGINT   NULL,
	SiteID BIGINT   NOT NULL,
	VariableSpecificID BIGINT   NOT NULL,
	BeneficialUseID BIGINT   NOT NULL,
	WaterSourceID BIGINT   NOT NULL,
	MethodID BIGINT   NOT NULL,
	TimeframeStart BIGINT   NOT NULL,
	TimeframeEnd BIGINT   NOT NULL,
	DataPublicationDate BIGINT   NOT NULL,
	ReportYear nchar (4)  NULL,
	Amount FLOAT   NOT NULL,
	PopulationServed FLOAT   NULL,
	PowerGeneratedGWh FLOAT   NULL,
	IrrigatedAcreage FLOAT   NULL,
	IrrigationMethodCV nvarchar (100)  NULL,
	CropTypeCV nvarchar (100)  NULL,
	InterbasinTransferFromID nvarchar (100)  NULL,
	InterbasinTransferToID nvarchar (100)  NULL,
	Geometry geometry   NULL
);

CREATE TABLE Variables_dim (
	VariableSpecificID BIGINT   NOT NULL PRIMARY KEY,
	VariableSpecificUUID nvarchar (250)  NULL,
	VariableSpecificCV nvarchar (250)  NOT NULL,
	VariableCV nvarchar (250)  NOT NULL,
	AggregationStatisticCV nvarchar (50)  NOT NULL,
	AggregationInterval  NUMERIC (10)  NOT NULL,
	AggregationIntervalUnitCV  nvarchar (50)  NOT NULL,
	ReportYearStartMonth  nvarchar (10)  NOT NULL,
	ReportYearTypeCV  nvarchar (10)  NOT NULL,
	AmountUnitCV nvarchar (250)  NOT NULL,
	MaximumAmountUnitCV nvarchar (255)  NULL
);

CREATE TABLE WaterSources_dim (
	WaterSourceID BIGINT   NOT NULL PRIMARY KEY,
	WaterSourceUUID nvarchar (100)  NOT NULL,
	WaterSourceNativeID nvarchar (250)  NULL,
	WaterSourceName nvarchar (250)  NULL,
	WaterSourceTypeCV nvarchar (100)  NOT NULL,
	WaterQualityIndicatorCV nvarchar (100)  NOT NULL,
	GNISFeatureNameCV nvarchar (250)  NULL,
	Geometry geometry   NULL
);


ALTER TABLE AggBridge_BeneficialUses_fact ADD CONSTRAINT fk_AggBridge_BeneficialUses_fact_AggregatedAmounts_fact
FOREIGN KEY (AggregatedAmountID) REFERENCES AggregatedAmounts_fact (AggregatedAmountID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AggBridge_BeneficialUses_fact ADD CONSTRAINT fk_AggBridge_BeneficialUses_fact_BeneficialUses_dim
FOREIGN KEY (BeneficialUseID) REFERENCES BeneficialUses_dim (BeneficialUseID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AggregatedAmounts_fact ADD CONSTRAINT fk_AggregatedAmounts_Date_dim_end
FOREIGN KEY (TimeframeEndID) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AggregatedAmounts_fact ADD CONSTRAINT fk_AggregatedAmounts_Date_dim_end_pub
FOREIGN KEY (DataPublicationDate) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AggregatedAmounts_fact ADD CONSTRAINT fk_AggregatedAmounts_Date_dim_start
FOREIGN KEY (TimeframeStartID) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AggregatedAmounts_fact ADD CONSTRAINT fk_AggregatedAmounts_fact_BeneficialUses_dim
FOREIGN KEY (BeneficialUseID) REFERENCES BeneficialUses_dim (BeneficialUseID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AggregatedAmounts_fact ADD CONSTRAINT fk_AggregatedAmounts_fact_CVs_ReportYearCV
FOREIGN KEY (ReportYear) REFERENCES CVs_ReportYearCV (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AggregatedAmounts_fact ADD CONSTRAINT fk_AggregatedAmounts_fact_Methods_dim
FOREIGN KEY (MethodID) REFERENCES Methods_dim (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AggregatedAmounts_fact ADD CONSTRAINT fk_AggregatedAmounts_fact_Organizations_dim
FOREIGN KEY (OrganizationID) REFERENCES Organizations_dim (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AggregatedAmounts_fact ADD CONSTRAINT fk_AggregatedAmounts_fact_ReportingUnits_dim
FOREIGN KEY (ReportingUnitID) REFERENCES ReportingUnits_dim (ReportingUnitID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AggregatedAmounts_fact ADD CONSTRAINT fk_AggregatedAmounts_fact_Variables_dim
FOREIGN KEY (VariableSpecificID) REFERENCES Variables_dim (VariableSpecificID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AggregatedAmounts_fact ADD CONSTRAINT fk_AggregatedAmounts_fact_WaterSources_dim
FOREIGN KEY (WaterSourceID) REFERENCES WaterSources_dim (WaterSourceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AllocationAmounts_fact ADD CONSTRAINT fk_AllocationAmounts_fact_Allocations_dim
FOREIGN KEY (AllocationID) REFERENCES Allocations_dim (AllocationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AllocationAmounts_fact ADD CONSTRAINT fk_AllocationAmounts_fact_BeneficialUses_dim
FOREIGN KEY (BeneficialUsesID) REFERENCES BeneficialUses_dim (BeneficialUseID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AllocationAmounts_fact ADD CONSTRAINT fk_AllocationAmounts_fact_CVs_ReportYearCV
FOREIGN KEY (ReportYear) REFERENCES CVs_ReportYearCV (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AllocationAmounts_fact ADD CONSTRAINT fk_AllocationAmounts_fact_Date_dim_end
FOREIGN KEY (TimeframeEndDateID) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AllocationAmounts_fact ADD CONSTRAINT fk_AllocationAmounts_fact_Date_dim_start
FOREIGN KEY (TimeframeStartDateID) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AllocationAmounts_fact ADD CONSTRAINT fk_AllocationAmounts_fact_Date_pub
FOREIGN KEY (DataPublicationDateID) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AllocationAmounts_fact ADD CONSTRAINT fk_AllocationAmounts_fact_Methods_dim
FOREIGN KEY (MethodID) REFERENCES Methods_dim (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AllocationAmounts_fact ADD CONSTRAINT fk_AllocationAmounts_fact_Organizations_dim
FOREIGN KEY (OrganizationID) REFERENCES Organizations_dim (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AllocationAmounts_fact ADD CONSTRAINT fk_AllocationAmounts_fact_Sites_dim
FOREIGN KEY (SiteID) REFERENCES Sites_dim (SiteID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AllocationAmounts_fact ADD CONSTRAINT fk_AllocationAmounts_fact_Variables_dim
FOREIGN KEY (VariableSpecificID) REFERENCES Variables_dim (VariableSpecificID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AllocationAmounts_fact ADD CONSTRAINT fk_AllocationAmounts_fact_WaterSources_dim
FOREIGN KEY (WaterSourceID) REFERENCES WaterSources_dim (WaterSourceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AllocationBridge_BeneficialUses_fact ADD CONSTRAINT fk_AllocationBridge_BeneficialUses_fact_AllocationAmounts_fact
FOREIGN KEY (AllocationAmountID) REFERENCES AllocationAmounts_fact (AllocationAmountID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE AllocationBridge_BeneficialUses_fact ADD CONSTRAINT fk_AllocationBridge_BeneficialUses_fact_BeneficialUses_dim
FOREIGN KEY (BeneficialUseID) REFERENCES BeneficialUses_dim (BeneficialUseID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Allocations_dim ADD CONSTRAINT fk_Allocations_dim_Date_dim_app
FOREIGN KEY (AllocationApplicationDate) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Allocations_dim ADD CONSTRAINT fk_Allocations_dim_Date_dim_exp
FOREIGN KEY (AllocationExpirationDate) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Allocations_dim ADD CONSTRAINT fk_Allocations_dim_Date_dim_prio
FOREIGN KEY (AllocationPriorityDate) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE BeneficialUses_dim ADD CONSTRAINT fk_BeneficialUses_dim_CVs_NAICSCode
FOREIGN KEY (NAICSCodeNameCV) REFERENCES CVs_NAICSCode (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE BeneficialUses_dim ADD CONSTRAINT fk_BeneficialUses_dim_CVs_USGSCategory
FOREIGN KEY (USGSCategoryNameCV) REFERENCES CVs_USGSCategory (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RegulatoryOverlay_dim ADD CONSTRAINT fk_RegulatoryOverlay_dim_Date_dim_end
FOREIGN KEY (TimeframeEndID) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RegulatoryOverlay_dim ADD CONSTRAINT fk_RegulatoryOverlay_dim_Date_dim_start
FOREIGN KEY (TimeframeStartID) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RegulatoryReportingUnits_fact ADD CONSTRAINT fk_RegulatoryReportingUnits_fact_Date_dim
FOREIGN KEY (DataPublicationDateID) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RegulatoryReportingUnits_fact ADD CONSTRAINT fk_RegulatoryReportingUnits_fact_Organizations_dim
FOREIGN KEY (OrganizationID) REFERENCES Organizations_dim (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RegulatoryReportingUnits_fact ADD CONSTRAINT fk_RegulatoryReportingUnits_fact_RegulatoryOverlay_dim
FOREIGN KEY (RegulatoryOverlayID) REFERENCES RegulatoryOverlay_dim (RegulatoryOverlayID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE RegulatoryReportingUnits_fact ADD CONSTRAINT fk_RegulatoryReportingUnits_fact_ReportingUnits_dim
FOREIGN KEY (ReportingUnitID) REFERENCES ReportingUnits_dim (ReportingUnitID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Sites_dim ADD CONSTRAINT fk_Sites_NHDMetadata
FOREIGN KEY (NHDMetadataID) REFERENCES NHDMetadata (NHDMetadataID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SitesBridge_BeneficialUses_fact ADD CONSTRAINT fk_SitesBridge_BeneficialUses_fact_BeneficialUses_dim
FOREIGN KEY (BeneficialUseID) REFERENCES BeneficialUses_dim (BeneficialUseID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SitesBridge_BeneficialUses_fact ADD CONSTRAINT fk_SitesBridge_BeneficialUses_fact_SiteVariableAmounts_fact
FOREIGN KEY (SiteVariableAmountID) REFERENCES SiteVariableAmounts_fact (SiteVariableAmountID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SiteVariableAmounts_fact ADD CONSTRAINT fk_SiteVariableAmounts_Date_dim_end
FOREIGN KEY (TimeframeEnd) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SiteVariableAmounts_fact ADD CONSTRAINT fk_SiteVariableAmounts_Date_dim_pub
FOREIGN KEY (DataPublicationDate) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SiteVariableAmounts_fact ADD CONSTRAINT fk_SiteVariableAmounts_Date_dim_start
FOREIGN KEY (TimeframeStart) REFERENCES Date_dim (DateID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SiteVariableAmounts_fact ADD CONSTRAINT fk_SiteVariableAmounts_fact_Allocations_dim
FOREIGN KEY (AllocationID) REFERENCES Allocations_dim (AllocationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SiteVariableAmounts_fact ADD CONSTRAINT fk_SiteVariableAmounts_fact_BeneficialUses_dim
FOREIGN KEY (BeneficialUseID) REFERENCES BeneficialUses_dim (BeneficialUseID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SiteVariableAmounts_fact ADD CONSTRAINT fk_SiteVariableAmounts_fact_CVs_ReportYearCV
FOREIGN KEY (ReportYear) REFERENCES CVs_ReportYearCV (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SiteVariableAmounts_fact ADD CONSTRAINT fk_SiteVariableAmounts_fact_Methods_dim
FOREIGN KEY (MethodID) REFERENCES Methods_dim (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SiteVariableAmounts_fact ADD CONSTRAINT fk_SiteVariableAmounts_fact_Organizations_dim
FOREIGN KEY (OrganizationID) REFERENCES Organizations_dim (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SiteVariableAmounts_fact ADD CONSTRAINT fk_SiteVariableAmounts_fact_Sites_dim
FOREIGN KEY (SiteID) REFERENCES Sites_dim (SiteID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SiteVariableAmounts_fact ADD CONSTRAINT fk_SiteVariableAmounts_fact_Variables_dim
FOREIGN KEY (VariableSpecificID) REFERENCES Variables_dim (VariableSpecificID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SiteVariableAmounts_fact ADD CONSTRAINT fk_SiteVariableAmounts_fact_WaterSources_dim
FOREIGN KEY (WaterSourceID) REFERENCES WaterSources_dim (WaterSourceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;