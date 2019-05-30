﻿using GeoAPI.Geometries;
using System.Collections.Generic;

namespace WesternStatesWater.WaDE.Accessors.EntityFramework
{
    public partial class SiteVariableAmountsFact
    {
        public SiteVariableAmountsFact()
        {
            SitesBridgeBeneficialUsesFact = new HashSet<SitesBridgeBeneficialUsesFact>();
        }

        public long SiteVariableAmountId { get; set; }
        public long OrganizationId { get; set; }
        public long SiteId { get; set; }
        public long VariableSpecificId { get; set; }
        public long WaterSourceId { get; set; }
        public long MethodId { get; set; }
        public long TimeframeStart { get; set; }
        public long TimeframeEnd { get; set; }
        public long DataPublicationDate { get; set; }
        public string DataPublicationDoi { get; set; }
        public string ReportYearCv { get; set; }
        public double Amount { get; set; }
        public long? PopulationServed { get; set; }
        public double? PowerGeneratedGwh { get; set; }
        public double? IrrigatedAcreage { get; set; }
        public string IrrigationMethodCv { get; set; }
        public string CropTypeCv { get; set; }
        public string CommunityWaterSupplySystem { get; set; }
        public string Sdwisidentifier { get; set; }
        public string AssociatedNativeAllocationIds { get; set; }
        public IGeometry Geometry { get; set; }

        public virtual CropType CropTypeCvNavigation { get; set; }
        public virtual DateDim DataPublicationDateNavigation { get; set; }
        public virtual IrrigationMethod IrrigationMethodCvNavigation { get; set; }
        public virtual MethodsDim Method { get; set; }
        public virtual OrganizationsDim Organization { get; set; }
        public virtual ReportYearCv ReportYearCvNavigation { get; set; }
        public virtual SitesDim Site { get; set; }
        public virtual DateDim TimeframeEndNavigation { get; set; }
        public virtual DateDim TimeframeStartNavigation { get; set; }
        public virtual VariablesDim VariableSpecific { get; set; }
        public virtual WaterSourcesDim WaterSource { get; set; }
        public virtual ICollection<SitesBridgeBeneficialUsesFact> SitesBridgeBeneficialUsesFact { get; set; }
    }
}