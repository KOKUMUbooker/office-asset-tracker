using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace office_asset_tracker.Models
{
    public class AssetReportOverview
    {
        public int TotalAssets { get; set; }
        public int AvailableCount { get; set; }
        public int AssignedCount { get; set; }
        public int DamagedCount { get; set; }
    }

    public class AssetCountByCategory
    {
        public string Category { get; set; }
        public int Count { get; set; }
    }

    public class AssetCountByStatus
    {
        public string Status { get; set; }
        public int Count { get; set; }
    }
}