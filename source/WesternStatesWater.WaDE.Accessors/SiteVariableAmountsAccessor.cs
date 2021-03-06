﻿using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using MoreLinq;
using NetTopologySuite;
using NetTopologySuite.IO;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using WesternStatesWater.WaDE.Accessors.EntityFramework;
using WesternStatesWater.WaDE.Accessors.Mapping;
using AccessorApi = WesternStatesWater.WaDE.Accessors.Contracts.Api;

namespace WesternStatesWater.WaDE.Accessors
{
    public class SiteVariableAmountsAccessor : AccessorApi.ISiteVariableAmountsAccessor
    {
        public SiteVariableAmountsAccessor(IConfiguration configuration, ILoggerFactory loggerFactory)
        {
            Configuration = configuration;
            Logger = loggerFactory.CreateLogger<AggregratedAmountsAccessor>();
        }

        private ILogger Logger { get; }
        private IConfiguration Configuration { get; set; }

        async Task<AccessorApi.SiteVariableAmounts> AccessorApi.ISiteVariableAmountsAccessor.GetSiteVariableAmountsAsync(AccessorApi.SiteVariableAmountsFilters filters, int startIndex, int recordCount)
        {
            using (var db = new EntityFramework.WaDEContext(Configuration))
            {
                var sw = Stopwatch.StartNew();
                var query = db.SiteVariableAmountsFact.AsNoTracking();
                if (filters.TimeframeStartDate != null)
                {
                    query = query.Where(a => a.TimeframeStartNavigation.Date >= filters.TimeframeStartDate);
                }
                if (filters.TimeframeEndDate != null)
                {
                    query = query.Where(a => a.TimeframeEndNavigation.Date <= filters.TimeframeEndDate);
                }
                if (!string.IsNullOrWhiteSpace(filters.VariableCv))
                {
                    query = query.Where(a => a.VariableSpecific.VariableCv == filters.VariableCv);
                }
                if (!string.IsNullOrWhiteSpace(filters.VariableSpecificCv))
                {
                    query = query.Where(a => a.VariableSpecific.VariableSpecificCv == filters.VariableSpecificCv);
                }
                if (!string.IsNullOrWhiteSpace(filters.BeneficialUseCv))
                {
                    query = query.Where(a => a.PrimaryUseCategoryCV == filters.BeneficialUseCv || a.SitesBridgeBeneficialUsesFact.Any(b => b.BeneficialUse.Name == filters.BeneficialUseCv));
                }
                if (!string.IsNullOrWhiteSpace(filters.UsgsCategoryNameCv))
                {
                    query = query.Where(a => a.PrimaryBeneficialUse.UsgscategoryNameCv == filters.UsgsCategoryNameCv || a.SitesBridgeBeneficialUsesFact.Any(b => b.BeneficialUse.UsgscategoryNameCv == filters.UsgsCategoryNameCv));
                }
                if (!string.IsNullOrWhiteSpace(filters.SiteUuid))
                {
                    query = query.Where(a => a.Site.SiteUuid == filters.SiteUuid);
                }
                if (!string.IsNullOrWhiteSpace(filters.SiteTypeCv))
                {
                    query = query.Where(a => a.Site.SiteTypeCv == filters.SiteTypeCv);
                }
                if (!string.IsNullOrWhiteSpace(filters.Geometry))
                {
                    var geometryFactory = NtsGeometryServices.Instance.CreateGeometryFactory(srid: 4326);
                    WKTReader reader = new WKTReader(geometryFactory);
                    var shape = reader.Read(filters.Geometry);
                    query = query.Where(a => (a.Site.Geometry != null && a.Site.Geometry.Intersects(shape)) || (a.Site.SitePoint != null && a.Site.SitePoint.Intersects(shape)));
                }
                if (!string.IsNullOrWhiteSpace(filters.HUC8))
                {
                    query = query.Where(a => a.Site.HUC8 == filters.HUC8);
                }
                if (!string.IsNullOrWhiteSpace(filters.HUC12))
                {
                    query = query.Where(a => a.Site.HUC12 == filters.HUC12);
                }
                if (!string.IsNullOrWhiteSpace(filters.County))
                {
                    query = query.Where(a => a.Site.County == filters.County);
                }
                if (!string.IsNullOrWhiteSpace(filters.State))
                {
                    query = query.Where(a => a.Organization.State == filters.State);
                }

                var totalCount = query.Count();

                var results = await query
                    .OrderBy(a => a.SiteVariableAmountId)
                    .Skip(startIndex)
                    .Take(recordCount)
                    .ProjectTo<SiteVariableAmountHelper>(Mapping.DtoMapper.Configuration)
                    .ToListAsync();

                var siteVariableAmountIds = results.Select(a => a.SiteVariableAmountId).ToList();

                var orgIds = results.Select(a => a.OrganizationId).ToHashSet();
                var orgsTask = db.OrganizationsDim
                    .Where(a => orgIds.Contains(a.OrganizationId))
                    .ProjectTo<AccessorApi.SiteVariableAmountsOrganization>(Mapping.DtoMapper.Configuration)
                    .ToListAsync();

                var waterSourceIds = results.Select(a => a.WaterSourceId).ToHashSet();
                var waterSourceTask = db.WaterSourcesDim
                    .Where(a => waterSourceIds.Contains(a.WaterSourceId))
                    .ProjectTo<AccessorApi.WaterSource>(Mapping.DtoMapper.Configuration)
                    .ToListAsync();

                var variableSpecificIds = results.Select(a => a.VariableSpecificId).ToHashSet();
                var variableSpecificTask = db.VariablesDim
                    .Where(a => variableSpecificIds.Contains(a.VariableSpecificId))
                    .ProjectTo<AccessorApi.VariableSpecific>(Mapping.DtoMapper.Configuration)
                    .ToListAsync();

                var methodIds = results.Select(a => a.MethodId).ToHashSet();
                var methodTask = db.MethodsDim
                    .Where(a => methodIds.Contains(a.MethodId))
                    .ProjectTo<AccessorApi.Method>(Mapping.DtoMapper.Configuration)
                    .ToListAsync();

                var beneficialUseTask = db.SitesBridgeBeneficialUsesFact
                    .Where(a => siteVariableAmountIds.Contains(a.SiteVariableAmountId))
                    .Select(a => new { a.SiteVariableAmountId, a.BeneficialUse })
                    .ToListAsync();

                var beneficialUses = (await beneficialUseTask).Select(a => (a.SiteVariableAmountId, a.BeneficialUse)).ToList();
                var waterSources = await waterSourceTask;
                var variableSpecifics = await variableSpecificTask;
                var methods = await methodTask;

                var siteVariableAmountsOrganizations = new List<AccessorApi.SiteVariableAmountsOrganization>();
                foreach (var org in await orgsTask)
                {
                    ProcessSiteVariableAmountsOrganization(org, results, waterSources, variableSpecifics, methods, beneficialUses);
                    siteVariableAmountsOrganizations.Add(org);
                }

                sw.Stop();
                Logger.LogInformation($"Completed SiteVariableAmounts [{sw.ElapsedMilliseconds } ms]");
                return new AccessorApi.SiteVariableAmounts
                {
                    TotalSiteVariableAmountsCount = totalCount,
                    Organizations = siteVariableAmountsOrganizations
                };
            }
        }

        private static void ProcessSiteVariableAmountsOrganization(AccessorApi.SiteVariableAmountsOrganization org, List<SiteVariableAmountHelper> results,
            List<AccessorApi.WaterSource> waterSources, List<AccessorApi.VariableSpecific> variableSpecifics, List<AccessorApi.Method> methods, List<(long SiteVariableAmountId, BeneficialUsesCV BeneficialUse)> beneficialUses)
        {
            var allocations = results.Where(a => a.OrganizationId == org.OrganizationId).ToList();

            var siteVariableAmountsIds2 = allocations.Select(a => a.SiteVariableAmountId).ToHashSet();
            var waterSourceIds2 = allocations.Select(a => a.WaterSourceId).ToHashSet();
            var variableSpecificIds2 = allocations.Select(a => a.VariableSpecificId).ToHashSet();
            var methodIds2 = allocations.Select(a => a.MethodId).ToHashSet();

            org.WaterSources = waterSources
                .Where(a => waterSourceIds2.Contains(a.WaterSourceId))
                .Map<List<AccessorApi.WaterSource>>();

            org.VariableSpecifics = variableSpecifics
                .Where(a => variableSpecificIds2.Contains(a.VariableSpecificId))
                .Map<List<AccessorApi.VariableSpecific>>();

            org.Methods = methods
                .Where(a => methodIds2.Contains(a.MethodId))
                .Map<List<AccessorApi.Method>>();

            org.BeneficialUses = beneficialUses
                .Where(a => siteVariableAmountsIds2.Contains(a.SiteVariableAmountId))
                .Select(a => a.BeneficialUse)
                .DistinctBy(a => a.Name)
                .Map<List<AccessorApi.BeneficialUse>>();

            org.SiteVariableAmounts = allocations.Map<List<AccessorApi.SiteVariableAmount>>();

            foreach (var waterAllocation in org.SiteVariableAmounts)
            {
                waterAllocation.BeneficialUses = beneficialUses
                    .Where(a => a.SiteVariableAmountId == waterAllocation.SiteVariableAmountId)
                    .Select(a => a.BeneficialUse.Name).ToList();
            }
        }

        internal class SiteVariableAmountHelper
        {
            public long SiteVariableAmountId { get; set; }
            public string SiteName { get; set; }
            public string NativeSiteID { get; set; }
            public string SiteTypeCV { get; set; }
            public double? Longitude { get; set; }
            public double? Latitude { get; set; }
            public string SiteGeometry { get; set; }
            public string CoordinateMethodCV { get; set; }
            public string AllocationGNISIDCV { get; set; }
            public DateTime? TimeframeStart { get; set; }
            public DateTime? TimeframeEnd { get; set; }
            public DateTime? DataPublicationDate { get; set; }
            public double? AllocationCropDutyAmount { get; set; }
            public double? Amount { get; set; }
            public string IrrigationMethodCV { get; set; }
            public double? IrrigatedAcreage { get; set; }
            public string CropTypeCV { get; set; }
            public long? PopulationServed { get; set; }
            public double? PowerGeneratedGWh { get; set; }
            public string AllocationCommunityWaterSupplySystem { get; set; }
            public string SDWISIdentifier { get; set; }
            public string DataPublicationDOI { get; set; }
            public string ReportYearCV { get; set; }
            public string MethodUUID { get; set; }
            public string VariableSpecificTypeCV { get; set; }
            public string SiteUUID { get; set; }
            public string AssociatedNativeAllocationIDs { get; set; }
            public string HUC8 { get; set; }
            public string HUC12 { get; set; }
            public string County { get; set; }

            public long OrganizationId { get; set; }
            public long WaterSourceId { get; set; }
            public long VariableSpecificId { get; set; }
            public long MethodId { get; set; }
        }
    }
}
