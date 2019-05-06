﻿using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace WesternStatesWater.WaDE.Accessors.Contracts.Api
{
    public interface IWaterAllocationAccessor
    {
        Task<IEnumerable<WaterAllocationOrganization>> GetSiteAllocationAmountsAsync(string variableSpecificCV, string siteUuid, string beneficialUse, string geometry);
    }
}
