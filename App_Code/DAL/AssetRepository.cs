using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using office_asset_tracker.Models;

namespace office_asset_tracker.DAL
{
    /// <summary>
    /// Summary description for AssetRepository
    /// </summary>
    public class AssetRepository : BaseRepository
    {

        public List<Asset> GetAssets()
        {
            var assets = new List<Asset>();

            using (SqlConnection conn = new SqlConnection(ConnString))
            using (SqlCommand cmd = new SqlCommand("sp_Asset_GetAllWithCategoryAndStaff", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        assets.Add(new Asset
                        {
                            Id = Convert.ToInt32(reader["Id"]),
                            Name = reader["Name"].ToString(),

                            CategoryId = Convert.ToInt32(reader["CategoryId"]),
                            CategoryName = reader["CategoryName"] != DBNull.Value
                                ? reader["CategoryName"].ToString()
                                : "",

                            AssignedToStaffName = reader["AssignedToStaffName"] != DBNull.Value
                                ? reader["AssignedToStaffName"].ToString()
                                : "",

                            AssignedToStaffId = reader["AssignedToStaffId"] != DBNull.Value
                                ? Convert.ToInt32(reader["AssignedToStaffId"])
                                : (int?)null,

                            Status = reader["Status"].ToString(),
                        });
                    }
                }
            }

            return assets;
        }
    }
}