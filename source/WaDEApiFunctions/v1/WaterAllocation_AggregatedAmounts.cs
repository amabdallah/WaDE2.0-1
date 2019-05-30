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
    public class WaterAllocation_AggregatedAmounts
    {
        public WaterAllocation_AggregatedAmounts(IAggregatedAmountsManager aggregatedAmountsManager)
        {
            AggregatedAmountsManager = aggregatedAmountsManager;
        }

        private IAggregatedAmountsManager AggregatedAmountsManager { get; set; }

        [FunctionName("WaterAllocation_AggregatedAmounts_v1")]
        public async Task<IActionResult> Run([HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = "v1/AggregatedAmounts")] HttpRequest req, ILogger log)
        {
            log.LogInformation($"Call to {nameof(WaterAllocation_AggregatedAmounts)}");

            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            var data = JsonConvert.DeserializeObject<AggregratedAmountsRequestBody>(requestBody);

            var variableCV = ((string)req.Query["VariableCV"]) ?? data?.variableCV;
            var variableSpecificCV = ((string)req.Query["VariableSpecificCV"]) ?? data?.variableCV;
            var beneficialUse = ((string)req.Query["BeneficialUse"]) ?? data?.beneficialUse;
            var startDate = ParseDate(((string)req.Query["StartDate"]) ?? data?.startDate);
            var endDate = ParseDate(((string)req.Query["EndDate"]) ?? data?.endDate);
            var reportingUnitUUID = ((string)req.Query["ReportingUnitUUID"]) ?? data?.reportingUnitUUID;
            var geometry = ((string)req.Query["Geometry"]) ?? data?.geometry;

            if (string.IsNullOrWhiteSpace(variableCV) && string.IsNullOrWhiteSpace(variableSpecificCV) && string.IsNullOrWhiteSpace(beneficialUse) && string.IsNullOrWhiteSpace(reportingUnitUUID) && string.IsNullOrWhiteSpace(geometry))
            {
                return new BadRequestObjectResult("VariableCV, VariableSpecificCV, BeneficialUse, ReportingUnitUUID or Geometry must be specified");
            }

            var siteAllocationAmounts = await AggregatedAmountsManager.GetAggregatedAmountsAsync(variableCV, variableSpecificCV, beneficialUse, reportingUnitUUID, geometry, startDate, endDate);
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
            public string reportingUnitUUID { get; set; }
            public string geometry { get; set; }
        }
    }
}