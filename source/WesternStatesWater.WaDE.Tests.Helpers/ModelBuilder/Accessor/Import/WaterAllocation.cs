﻿using System;
using System.Collections.Generic;
using System.Text;
using Bogus;
using WesternStatesWater.WaDE.Accessors.Contracts.Import;
using WesternStatesWater.WaDE.Tests.Helpers.ModelBuilder.EntityFramework;

namespace WesternStatesWater.WaDE.Tests.Helpers.ModelBuilder.Accessor.Import
{

    public static class WaterAllocationBuilder
    {
        public static WaterAllocation Create()
        {
            return Create(new WaterAllocationBuilderOptions());
        }

        public static WaterAllocation Create(WaterAllocationBuilderOptions opts)
        {
            var faker = new Faker<WaterAllocation>()
                .RuleFor(a => a.OrganizationUUID, f => f.Random.Uuid().ToString())
                .RuleFor(a => a.VariableSpecificUUID, f => f.Random.Uuid().ToString())
                .RuleFor(a => a.SiteUUID, f => f.Random.Uuid().ToString())
                .RuleFor(a => a.WaterSourceUUID, f => f.Random.Uuid().ToString())
                .RuleFor(a => a.MethodUUID, f => f.Random.Uuid().ToString())
                .RuleFor(a => a.DataPublicationDate, f => f.Date.Past(5))
                .RuleFor(a => a.DataPublicationDOI, f => f.Random.Words(5))
                .RuleFor(a => a.AllocationNativeID, f => f.Random.Uuid().ToString())
                .RuleFor(a => a.AllocationApplicationDate, f => f.Date.Past(5))
                .RuleFor(a => a.AllocationPriorityDate, f => f.Date.Past(5))
                .RuleFor(a => a.AllocationExpirationDate, f => f.Date.Past(5))
                .RuleFor(a => a.AllocationOwner, f => f.Name.FullName())
                .RuleFor(a => a.AllocationTimeframeStart, f => f.Random.AlphaNumeric(5))
                .RuleFor(a => a.AllocationTimeframeEnd, f => f.Random.AlphaNumeric(5))
                .RuleFor(a => a.AllocationAmount, f => f.Random.Double(0, 10000).ToString())
                .RuleFor(a => a.AllocationMaximum, f => f.Random.Double(0, 10000).ToString())
                .RuleFor(a => a.AllocationCommunityWaterSupplySystem, f => f.Address.City())
                ;

            switch (opts.RecordType ?? (new Faker()).PickRandom<WaterAllocationRecordType>())
            {
                case WaterAllocationRecordType.Ag:
                    faker.RuleFor(a => a.IrrigatedAcreage, f => f.Random.Double(0, 10000).ToString())
                        .RuleFor(a => a.AllocationCropDutyAmount, f => f.Random.Double(0, 50000).ToString());
                    break;
                case WaterAllocationRecordType.Power:
                    faker.RuleFor(a => a.GeneratedPowerCapacityMW, f => f.Random.Double(0, 10000).ToString());
                    break;
                case WaterAllocationRecordType.Civilian:
                    faker.RuleFor(a => a.PopulationServed, f => f.Random.Long(0, 10000000).ToString())
                        .RuleFor(a => a.CommunityWaterSupplySystem, f => f.Address.City());
                    break;
            }

            return faker;
        }
    }

    public class WaterAllocationBuilderOptions
    {
        public WaterAllocationRecordType? RecordType { get; set; }
    }

    public enum WaterAllocationRecordType
    {
        None,
        Power,
        Civilian,
        Ag
    }
}
