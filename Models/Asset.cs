namespace office_asset_tracker.Models
{
    public class Asset
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public int CategoryId { get; set; }
        public string Status { get; set; }

        public int? AssignedToStaffId { get; set; }

        // Optional (for JOIN results)
        public string CategoryName { get; set; }
        public string StaffName { get; set; }
    }
}