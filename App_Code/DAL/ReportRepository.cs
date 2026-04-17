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
    /// Summary description for ReportRepository
    /// </summary>
    public class ReportRepository : BaseRepository
    {
        public List<AssetCountByCategory> GetAssetCountByCategory()
        {
            var assetCountByCategory = new List<AssetCountByCategory>();

            using (SqlConnection conn = new SqlConnection(ConnString))
            using (SqlCommand cmd = new SqlCommand("sp_Asset_CountByCategory", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        assetCountByCategory.Add(new AssetCountByCategory
                        {
                            Count = Convert.ToInt32(reader["Count"]),
                            Category = reader["Category"].ToString(),
                        });
                    }
                }
            }

            return assetCountByCategory;
        }

        public List<AssetCountByStatus> GetAssetCountByStatus()
        {
            var assetCountByStatus = new List<AssetCountByStatus>();

            using (SqlConnection conn = new SqlConnection(ConnString))
            using (SqlCommand cmd = new SqlCommand("sp_Asset_CountByStatus", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        assetCountByStatus.Add(new AssetCountByStatus
                        {
                            Count = Convert.ToInt32(reader["Count"]),
                            Status = reader["Status"].ToString(),
                        });
                    }
                }
            }

            return assetCountByStatus;
        }

        public List<AssetReportOverview> GetReportOverview()
        {
            var reportOverview = new List<AssetReportOverview>();

            using (SqlConnection conn = new SqlConnection(ConnString))
            using (SqlCommand cmd = new SqlCommand("sp_Asset_ReportOverview", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        reportOverview.Add(new AssetReportOverview
                        {
                            TotalAssets = Convert.ToInt32(reader["TotalAssets"]),
                            AssignedCount = Convert.ToInt32(reader["AssignedCount"]),
                            AvailableCount = Convert.ToInt32(reader["AvailableCount"]),
                            DamagedCount = Convert.ToInt32(reader["DamagedCount"]),
                        });
                    }
                }
            }

            return reportOverview;
        }
    }
}