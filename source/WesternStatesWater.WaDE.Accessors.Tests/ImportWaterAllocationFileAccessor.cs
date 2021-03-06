﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading.Tasks;
using Bogus;
using FluentAssertions;
using Microsoft.Extensions.Configuration;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Telerik.JustMock;
using Telerik.JustMock.Helpers;
using WesternStatesWater.WaDE.Accessors.Contracts.Import;
using WesternStatesWater.WaDE.Tests.Helpers;

namespace WesternStatesWater.WaDE.Accessors.Tests
{
    [TestClass]
    public class ImportWaterAllocationFileAccessor
    {
        private readonly IFileStreamFactory FileStreamFactoryMock = Mock.Create<IFileStreamFactory>(Behavior.Strict);
        [TestMethod]
        public async Task GetAggregatedAmounts_IrrigatedAcreageHasHeaderButEmpty()
        {
            var runId = (new Faker()).Random.AlphaNumeric(5);
            FileStreamFactoryMock.Arrange(a => a.GetStreamAsync(Arg.IsAny<IConfiguration>(), runId, "aggregatedamounts.csv"))
                .Returns(Task.FromResult((Stream)new MemoryStream(System.Text.Encoding.UTF8.GetBytes(ImportData.ImportData.GetWaterAllocations_IrrigatedAcrageSpecifiedButEmpty))));

            var sut = CreateWaterAllocationFileAccessor();
            var results = await sut.GetAggregatedAmounts(runId, 0, 10000);

            results.Should().HaveCount(1);
            results[0].IrrigatedAcreage.Should().BeNull();
        }

        public IWaterAllocationFileAccessor CreateWaterAllocationFileAccessor()
        {
            return new WaterAllocationFileAccessor(Configuration.GetConfiguration())
            {
                FileStreamFactory = FileStreamFactoryMock
            };
        }
    }
}
