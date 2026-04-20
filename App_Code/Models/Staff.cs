namespace office_asset_tracker.Models
{
    public class Staff
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class CreateStaffDto
    {
        public string Name { get; set; }
    }
}