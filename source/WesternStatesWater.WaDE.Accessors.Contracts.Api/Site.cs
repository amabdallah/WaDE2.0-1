using System;
using System.Collections.Generic;

namespace WesternStatesWater.WaDE.Accessors.Contracts.Api
{
    public class Site
    {
        public string NativeSiteID { get; set; }
        public double? Longitude { get; set; }
        public double? Latitude { get; set; }
        public string SiteGeometry { get; set; }
        public string CoordinateMethodCV { get; set; }
        public string AllocationGNISIDCV { get; set; }
        public string HUC8 { get; set; }
        public string HUC12 { get; set; }
        public string County { get; set; }
    }
}