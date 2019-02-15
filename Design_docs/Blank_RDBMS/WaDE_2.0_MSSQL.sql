-- Adel Abdallah, Senior Hydroinformatics Specialist at the WSWC, Feb 2019

--This is a Data Definition Language (DDL) script that
--generates a blank schema of the Water Data Exchange Data Model (WaDE)
-- for Microsoft SQL Server database.

-- Generated by Adel Abdallah Feb, 2019 based on WaDE XML design named WaDE2.0_schema_star generated by DbWrench V4.04 @ http://www.dbwrench.com/
-- WaDE All rights reserved. See BSD 3-Clause Licence @ https://github.com/WSWCWaterDataExchange/WaDE2.0/blob/master/LICENSE 

-- To create a blank WaDE database in SQL Server,
-- Open SQL Server, Click File >> New >> Query with Current Condition
-- Simply copy all this script and paste into the new window of "create query"
-- Then click "execute". The script should run successfully and create the xx empty tables of WaDE

----------------------------------------------------------------------------------------
-- Drop the database called 'WaDE' if it exists and then create a new database called 'WaDE'
USE master;
GO

IF DB_ID(N'WaDE') IS NOT NULL
DROP DATABASE WaDE;
GO

CREATE DATABASE WaDE;
GO

USE WaDE;
GO

CREATE SCHEMA WaDE;
GO

/***************************************************************************/
/*********************** CREATE WADE2.0_SCHEMA_STAR ************************/
/***************************************************************************/

CREATE TABLE AggregatedAmounts (
	AggregatedAmountID int   NOT NULL,
	OrganizationID int   NOT NULL,
	ReportingUnitID int   NOT NULL,
	VariableSpecificID int   NOT NULL,
	WaterSourceID int   NOT NULL,
	MethodID int   NOT NULL,
	AmountMetadataID int   NOT NULL,
	TimeID int   NOT NULL,
	Amount float   NOT NULL,
	PRIMARY KEY (AggregatedAmountID)
)
CREATE TABLE AllocationAmounts (
	AllocationAmountID int   NOT NULL,
	OrganizationID int   NOT NULL,
	AllocationID int   NOT NULL,
	SiteID int   NOT NULL,
	VariableSpecificID int   NOT NULL,
	WaterSourceID int   NOT NULL,
	MethodID int   NOT NULL,
	AmountMetadataID int   NULL,
	TimeID int   NOT NULL,
	AllocationCropDutyAmount float   NULL,
	AllocationAmount float   NULL,
	AllocationMaximum float   NULL,
	PRIMARY KEY (AllocationAmountID)
)
CREATE TABLE Allocations (
	AllocationID int   NOT NULL,
	AllocationUID varchar (50)  NOT NULL,
	AllocationNativeID varchar (250)  NOT NULL,
	AllocationOwner varchar (255)  NOT NULL,
	AllocationApplicationDate date   NULL,
	AllocationPriorityDate date   NOT NULL,
	AllocationLegalStatusCV varchar (50)  NOT NULL,
	AllocationExpirationDate date   NULL,
	AllocationChangeApplicationIndicator varchar (100)  NULL,
	LegacyAllocationIDs varchar (100)  NULL,
	AllocationBasisCV varchar (250)  NULL,
	PRIMARY KEY (AllocationID)
)
CREATE TABLE AmountMetadata (
	AmountMetadataID int   NOT NULL,
	BeneficialUseCategory varchar (500)  NOT NULL,
	PrimaryUseCategory varchar (250)  NULL,
	USGSCategoryCV varchar (250)  NULL,
	SDWISIdentifier varchar (250)  NULL,
	NAICSCodeCV varchar (250)  NULL,
	PopulationServed float   NULL,
	IrrigatedAcreage float   NULL,
	IrrigationMethod varchar (100)  NULL,
	CropType varchar (100)  NULL,
	PowerGeneratedGWh float   NULL,
	Geometry binary   NULL,
	InterbasinTransferFromID varchar (255)  NULL,
	InterbasinTransferToID varchar (255)  NULL,
	PRIMARY KEY (AmountMetadataID)
)
CREATE TABLE CVs_AggregationStatistic (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_EPSGCode (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_GNISFeatureName (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_LegalStatus (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_MethodType (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_NAICSCode (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_NHDNetworkStatus (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_NHDProduct (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_RegulatoryStatus (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_ReportingUnitType (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_ReportYearCV (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_ReportYearType (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_Units (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_USGSCategory (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_Variable (
	Name varchar (250)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_VariableSpecific (
	Name varchar (250)  NOT NULL,
	Term varchar (250)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (250)  NULL,
	SourceVocabularyURI varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_WaterAllocationBasis (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_WaterQualityIndicator (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE CVs_WaterSourceType (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI	 varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE Methods (
	MethodID int   NOT NULL,
	MethodUID varchar (100)  NOT NULL,
	MethodName varchar (50)  NOT NULL,
	MethodDescription text   NOT NULL,
	MethodNEMILink varchar (100)  NULL,
	ApplicableResourceTypeCV varchar (100)  NOT NULL,
	MethodTypeCV varchar (50)  NOT NULL,
	DataCoverageValue varchar (100)  NULL,
	DataQualityValueCV varchar (50)  NULL,
	DataConfidenceValue varchar (50)  NULL,
	PRIMARY KEY (MethodID)
)
CREATE TABLE NHDMetadata (
	NHDMetadataID int   NOT NULL,
	NHDNetworkStatusCV varchar (50)  NOT NULL,
	NHDProductCV varchar (50)  NULL,
	NHDUpdateDate date   NULL,
	NHDReachCode varchar (50)  NULL,
	NHDMeasureNumber varchar (50)  NULL,
	PRIMARY KEY (NHDMetadataID)
)
CREATE TABLE Organizations (
	OrganizationID int   NOT NULL,
	OrganizationUID varchar (250)  NOT NULL,
	OrganizationName varchar (250)  NOT NULL,
	OrganizationPurview varchar (250)  NULL,
	OrganizationWebsite varchar (250)  NOT NULL,
	OrganizationPhoneNumber varchar (250)  NOT NULL,
	OrganizationContactName varchar (250)  NOT NULL,
	OrganizationContactEmail varchar (250)  NOT NULL,
	PRIMARY KEY (OrganizationID)
)
CREATE TABLE RegulatoryOverlay (
	RegulatoryOverlayID int   NOT NULL,
	RegulatoryOverlayUID varchar (250)  NULL,
	RegulatoryOverlayNativeID varchar (250)  NULL,
	RegulatoryName varchar (50)  NOT NULL,
	RegulatoryDescription text   NOT NULL,
	RegulatoryStatusCV varchar (50)  NOT NULL,
	OversightAgency varchar (250)  NOT NULL,
	RegulatoryStatute varchar (500)  NULL,
	RegulatoryStatuteLink varchar (500)  NULL,
	TimeframeStart date   NOT NULL,
	TimeframeEnd date   NOT NULL,
	ReportYearTypeCV varchar (10)  NOT NULL,
	ReportYearStartMonth varchar (5)  NOT NULL,
	PRIMARY KEY (RegulatoryOverlayID)
)
CREATE TABLE RegulatoryReportingUnits (
	BridgeID int   NOT NULL,
	RegulatoryOverlayID int   NOT NULL,
	OrganizationID int   NOT NULL,
	ReportingUnitID int   NOT NULL,
	ReportYearCV varchar (4)  NULL,
	DataPublicationDate date   NOT NULL,
	PRIMARY KEY (BridgeID)
)
CREATE TABLE ReportingUnits (
	ReportingUnitID int   NOT NULL,
	ReportingUnitUID varchar (250)  NOT NULL,
	ReportingUnitNativeID varchar (250)  NOT NULL,
	ReportingUnitName varchar (250)  NOT NULL,
	ReportingUnitTypeCV varchar (20)  NOT NULL,
	ReportingUnitUpdateDate date   NULL,
	ReportingUnitProductVersion varchar (100)  NULL,
	StateCV varchar (50)  NOT NULL,
	EPSGCodeCV varchar (50)  NULL,
	Geometry binary   NULL,
	PRIMARY KEY (ReportingUnitID)
)
CREATE TABLE Sites (
	SiteID int   NOT NULL,
	SiteUID varchar (55)  NOT NULL,
	SiteNativeID varchar (50)  NULL,
	SiteName varchar (500)  NOT NULL,
	SiteTypeCV varchar (100)  NULL,
	Longitude varchar (50)  NOT NULL,
	Latitude varchar (50)  NOT NULL,
	Geometry binary   NULL,
	CoordinateMethodCV varchar (100)  NOT NULL,
	CoordinateAccuracy varchar (255)  NULL,
	GNISCodeCV varchar (50)  NULL,
	NHDMetadataID int   NULL,
	PRIMARY KEY (SiteID)
)
CREATE TABLE SiteVariableAmounts (
	SiteVariableAmountID int   NOT NULL,
	OrganizationID int   NOT NULL,
	AllocationID int   NULL,
	SiteID int   NOT NULL,
	VariableSpecificID int   NOT NULL,
	WaterSourceID int   NOT NULL,
	MethodID int   NOT NULL,
	AmountMetadataID int   NULL,
	TimeID int   NOT NULL,
	Amount float   NOT NULL,
	PRIMARY KEY (SiteVariableAmountID)
)
CREATE TABLE Time_dim (
	TimeID int   NOT NULL,
	ReportYearCV varchar (4)  NOT NULL,
	TimeframeStart date   NOT NULL,
	TimeframeEnd date   NOT NULL,
	DataPublicationDate date   NOT NULL,
	PRIMARY KEY (TimeID)
)
CREATE TABLE Variables (
	VariableSpecificID int   NOT NULL,
	VariableSpecificUID varchar (250)  NULL,
	VariableSpecificCV varchar (250)  NOT NULL,
	VariableCV varchar (250)  NOT NULL,
	AggregationStatisticCV varchar (50)  NOT NULL,
	AggregationInterval  numeric (10)  NOT NULL,
	AggregationIntervalUnitCV  varchar (50)  NOT NULL,
	ReportYearStartMonth  varchar (10)  NOT NULL,
	ReportYearTypeCV  varchar (10)  NOT NULL,
	AmountUnitCV varchar (250)  NOT NULL,
	MaximumAmountUnitCV varchar (255)  NULL,
	PRIMARY KEY (VariableSpecificID)
)
CREATE TABLE WaterSources (
	WaterSourceID int   NOT NULL,
	WaterSourceUID varchar (100)  NOT NULL,
	WaterSourceNativeID varchar (250)  NULL,
	WaterSourceName varchar (250)  NULL,
	WaterSourceTypeCV varchar (100)  NOT NULL,
	WaterQualityIndicatorCV varchar (100)  NOT NULL,
	Geometry binary   NULL,
	GNISFeatureNameCV varchar (250)  NULL,
	PRIMARY KEY (WaterSourceID)
)

ALTER TABLE AggregatedAmounts ADD CONSTRAINT fk_AggregatedAmounts_AmountsMetadata
FOREIGN KEY (AmountMetadataID) REFERENCES AmountMetadata (AmountMetadataID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AggregatedAmounts ADD CONSTRAINT fk_AggregatedAmounts_Methods
FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AggregatedAmounts ADD CONSTRAINT fk_AggregatedAmounts_Organizations
FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AggregatedAmounts ADD CONSTRAINT fk_AggregatedAmounts_ReportingUnits
FOREIGN KEY (ReportingUnitID) REFERENCES ReportingUnits (ReportingUnitID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AggregatedAmounts ADD CONSTRAINT fk_AggregatedAmounts_Time_dim
FOREIGN KEY (TimeID) REFERENCES Time_dim (TimeID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AggregatedAmounts ADD CONSTRAINT fk_AggregatedAmounts_VariablesSpecific
FOREIGN KEY (VariableSpecificID) REFERENCES Variables (VariableSpecificID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AggregatedAmounts ADD CONSTRAINT fk_AggregatedAmounts_WaterSources
FOREIGN KEY (WaterSourceID) REFERENCES WaterSources (WaterSourceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AllocationAmounts ADD CONSTRAINT fk_AllocationAmounts_Organizations
FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AllocationAmounts ADD CONSTRAINT fk_WaterAllocationAmounts_AmountMetadata
FOREIGN KEY (AmountMetadataID) REFERENCES AmountMetadata (AmountMetadataID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AllocationAmounts ADD CONSTRAINT fk_WaterAllocationAmounts_Methods
FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AllocationAmounts ADD CONSTRAINT fk_WaterAllocationAmounts_Sites
FOREIGN KEY (SiteID) REFERENCES Sites (SiteID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AllocationAmounts ADD CONSTRAINT fk_WaterAllocationAmounts_Time_dim
FOREIGN KEY (TimeID) REFERENCES Time_dim (TimeID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AllocationAmounts ADD CONSTRAINT fk_WaterAllocationAmounts_VariablesSpecific
FOREIGN KEY (VariableSpecificID) REFERENCES Variables (VariableSpecificID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AllocationAmounts ADD CONSTRAINT fk_WaterAllocationAmounts_WaterAllocations
FOREIGN KEY (AllocationID) REFERENCES Allocations (AllocationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE AllocationAmounts ADD CONSTRAINT fk_WaterAllocationAmounts_WaterSources
FOREIGN KEY (WaterSourceID) REFERENCES WaterSources (WaterSourceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE RegulatoryReportingUnits ADD CONSTRAINT fk_RegulatoryReportingUnits_Organizations
FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE RegulatoryReportingUnits ADD CONSTRAINT fk_RegulatoryReportingUnits_RegulatoryOverlay
FOREIGN KEY (RegulatoryOverlayID) REFERENCES RegulatoryOverlay (RegulatoryOverlayID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE RegulatoryReportingUnits ADD CONSTRAINT fk_RegulatoryReportingUnits_ReportingUnits
FOREIGN KEY (ReportingUnitID) REFERENCES ReportingUnits (ReportingUnitID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE Sites ADD CONSTRAINT fk_Sites_NHDMetadata
FOREIGN KEY (NHDMetadataID) REFERENCES NHDMetadata (NHDMetadataID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE SiteVariableAmounts ADD CONSTRAINT fk_SiteVariableAmounts_AmountMetadata
FOREIGN KEY (AmountMetadataID) REFERENCES AmountMetadata (AmountMetadataID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE SiteVariableAmounts ADD CONSTRAINT fk_SiteVariableAmounts_Methods
FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE SiteVariableAmounts ADD CONSTRAINT fk_SiteVariableAmounts_Organizations
FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE SiteVariableAmounts ADD CONSTRAINT fk_SiteVariableAmounts_Sites
FOREIGN KEY (SiteID) REFERENCES Sites (SiteID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE SiteVariableAmounts ADD CONSTRAINT fk_SiteVariableAmounts_Time_dim
FOREIGN KEY (TimeID) REFERENCES Time_dim (TimeID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE SiteVariableAmounts ADD CONSTRAINT fk_SiteVariableAmounts_VariablesSpecific
FOREIGN KEY (VariableSpecificID) REFERENCES Variables (VariableSpecificID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE SiteVariableAmounts ADD CONSTRAINT fk_SiteVariableAmounts_WaterAllocations
FOREIGN KEY (AllocationID) REFERENCES Allocations (AllocationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE SiteVariableAmounts ADD CONSTRAINT fk_SiteVariableAmounts_WaterSources
FOREIGN KEY (WaterSourceID) REFERENCES WaterSources (WaterSourceID)
ON UPDATE NO ACTION ON DELETE NO ACTION