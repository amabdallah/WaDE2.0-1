using Microsoft.Azure.WebJobs;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;
using WesternStatesWater.WaDE.Contracts.Import;

namespace WaDEImportFunctions
{
    public class ImportAggregatedAmounts
    {
        public ImportAggregatedAmounts(IWaterAllocationManager waterAllocationManager)
        {
            WaterAllocationManager = waterAllocationManager;
        }

        private IWaterAllocationManager WaterAllocationManager { get; set; }
        
        private const int BatchCount = 25000;
        private const string FunctionName = FunctionNames.LoadAggregatedAmounts;
        private const string BatchFunctionName = FunctionName + "Batch";
        private const string CountFunctionName = "Get" + FunctionName + "Count";

        [FunctionName(FunctionName)]
        public async Task<StatusHelper> LoadData([OrchestrationTrigger] DurableOrchestrationContextBase context, ILogger log)
        {
            return await Import.LoadData(context, FunctionName, CountFunctionName, BatchFunctionName, BatchCount, log);
        }

        [FunctionName(BatchFunctionName)]
        public async Task<StatusHelper> LoadBatch([ActivityTrigger] DurableActivityContextBase context, ILogger log)
        {
            return await Import.LoadBatch(context, BatchFunctionName, WaterAllocationManager.LoadAggregatedAmounts, log);
        }

        [FunctionName(CountFunctionName)]
        public async Task<int> GetCount([ActivityTrigger] DurableActivityContextBase context, ILogger log)
        {
            return await Import.GetCount(context, CountFunctionName, WaterAllocationManager.GetAggregatedAmountsCount, log);
        }
    }
}
