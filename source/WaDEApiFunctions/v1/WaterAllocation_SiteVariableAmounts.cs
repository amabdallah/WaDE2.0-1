using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.IO;
using System.Threading.Tasks;
using WesternStatesWater.WaDE.Contracts.Api;

namespace WaDEApiFunctions.v1
{
    public class WaterAllocation_SiteVariableAmounts
    {
        public WaterAllocation_SiteVariableAmounts(ISiteVariableAmountsManager siteVariableAmountsManager)
        {
            SiteVariableAmountsManager = siteVariableAmountsManager;
        }

        private ISiteVariableAmountsManager SiteVariableAmountsManager { get; set; }

        [FunctionName("WaterAllocation_SiteVariableAmounts_v1")]
        public async Task<IActionResult> Run([HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = "v1/SiteVariableAmounts")] HttpRequest req, ILogger log)
        {
            log.LogInformation($"Call to {nameof(WaterAllocation_AggregatedAmounts)}");

            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            var data = JsonConvert.DeserializeObject<AggregratedAmountsRequestBody>(requestBody);

            var variableCV = ((string)req.Query["VariableCV"]) ?? data?.variableCV;
            var variableSpecificCV = ((string)req.Query["VariableSpecificCV"]) ?? data?.variableCV;
            var beneficialUse = ((string)req.Query["BeneficialUse"]) ?? data?.beneficialUse;
            var startDate = ParseDate(((string)req.Query["StartDate"]) ?? data?.startDate);
            var endDate = ParseDate(((string)req.Query["EndDate"]) ?? data?.endDate);
            var siteUUID = ((string)req.Query["SiteUUID"]) ?? data?.siteUUID;
            var geometry = ((string)req.Query["Geometry"]) ?? data?.geometry;

            if (string.IsNullOrWhiteSpace(variableCV) && string.IsNullOrWhiteSpace(variableSpecificCV) && string.IsNullOrWhiteSpace(beneficialUse) && string.IsNullOrWhiteSpace(siteUUID) && string.IsNullOrWhiteSpace(geometry))
            {
                return new BadRequestObjectResult("VariableCV, VariableSpecificCV, BeneficialUse, SiteUUID or Geometry must be specified");
            }

            var siteAllocationAmounts = await SiteVariableAmountsManager.GetSiteVariableAmountsAsync(variableCV, variableSpecificCV, beneficialUse, siteUUID, geometry, startDate, endDate);
            return new JsonResult(siteAllocationAmounts, new JsonSerializerSettings { ContractResolver = new DefaultContractResolver() });
        }

        private static DateTime? ParseDate(string value)
        {
            return DateTime.TryParse(value, out var date) ? date : (DateTime?)null;
        }

        private class AggregratedAmountsRequestBody
        {
            public string variableCV { get; set; }
            public string variableSpecificCV { get; set; }
            public string beneficialUse { get; set; }
            public string startDate { get; set; }
            public string endDate { get; set; }
            public string siteUUID { get; set; }
            public string geometry { get; set; }
        }
    }
}
