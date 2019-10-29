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
    public class WaterAllocation_RegulatoryOverlay
    {
        public WaterAllocation_RegulatoryOverlay(IRegulatoryOverlayManager regulatoryOverlayManager)
        {
            RegulatoryOverlayManager = regulatoryOverlayManager;
        }

        private IRegulatoryOverlayManager RegulatoryOverlayManager { get; set; }

        [FunctionName("WaterAllocation_RegulatoryOverlay_v1")]
        public async Task<IActionResult> Run([HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = "v1/AggRegulatoryOverlay")] HttpRequest req, ILogger log)
        {
            log.LogInformation($"Call to {nameof(WaterAllocation_RegulatoryOverlay)}");

            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            var data = JsonConvert.DeserializeObject<RegulatoryOverlayRequestBody>(requestBody);

            var reportingUnitUUID = ((string)req.Query["ReportingUnitUUID"]) ?? data?.reportingUnitUUID;
            var regulatoryOverlayUUID = ((string)req.Query["RegulatoryOverlayUUID"]) ?? data?.regulatoryOverlayUUID;
            var organizationUUID = ((string)req.Query["OrganizationUUID"]) ?? data?.organizationUUID;
            var statutoryEffectiveDate = ParseDate(((string)req.Query["StatutoryEffectiveDate"]) ?? data?.statutoryEffectiveDate);
            var statutoryEndDate = ParseDate(((string)req.Query["StatutoryEndDate"]) ?? data?.statutoryEndDate);
            var regulatoryStatusCV = ((string)req.Query["RegulatoryStatusCV"]) ?? data?.regulatoryStatusCV;
            var geometry = ((string)req.Query["SearchBoundary"]) ?? data?.searchBoundary;

            if (string.IsNullOrWhiteSpace(reportingUnitUUID) && string.IsNullOrWhiteSpace(regulatoryOverlayUUID) && string.IsNullOrWhiteSpace(organizationUUID) && string.IsNullOrWhiteSpace(regulatoryStatusCV) && string.IsNullOrWhiteSpace(geometry))
            {
                return new BadRequestObjectResult("At least one filter parameter must be specified");
            }

            var regulatoryReportingUnits = await RegulatoryOverlayManager.GetRegulatoryReportingUnitsAsync(new RegulatoryOverlayFilters
            {
                ReportingUnitUUID = reportingUnitUUID,
                RegulatoryOverlayUUID = regulatoryOverlayUUID,
                OrganizationUUID = organizationUUID,
                StatutoryEffectiveDate = statutoryEffectiveDate,
                StatutoryEndDate = statutoryEndDate,
                RegulatoryStatusCV = regulatoryStatusCV,
                Geometry = geometry
            });
            return new JsonResult(regulatoryReportingUnits, new JsonSerializerSettings { ContractResolver = new DefaultContractResolver() });
        }

        private static DateTime? ParseDate(string value)
        {
            return DateTime.TryParse(value, out var date) ? date : (DateTime?)null;
        }

        private class RegulatoryOverlayRequestBody
        {
            public string reportingUnitUUID { get; set; }
            public string regulatoryOverlayUUID { get; set; }
            public string organizationUUID { get; set; }
            public string statutoryEffectiveDate { get; set; }
            public string statutoryEndDate { get; set; }
            public string regulatoryStatusCV { get; set; }
            public string searchBoundary { get; set; }
        }
    }
}