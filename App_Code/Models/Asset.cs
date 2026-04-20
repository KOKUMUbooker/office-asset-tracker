namespace office_asset_tracker.Models
{
    public class DBAsset 
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int CategoryId { get; set; }
        public string Status { get; set; }

        public int? AssignedToStaffId { get; set; }
    }

    public class Asset : DBAsset
    {
        // Optional (for JOIN results)
        public string CategoryName { get; set; }
        public string AssignedToStaffName { get; set; }
    }

    public class AssetCreateDto
    {
        public string Name { get; set; }
        public int CategoryId { get; set; }
        public string Status { get; set; }
    }
}