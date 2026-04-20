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
    /// Summary description for StaffRepository
    /// </summary>
    public class StaffRepository : BaseRepository
    {
        public List<Staff> GetStaffMembers()
        {
            var staff = new List<Staff>();

            using (SqlConnection conn = new SqlConnection(ConnString))
            using (SqlCommand cmd = new SqlCommand("sp_Staff_GetAll", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        staff.Add(new Staff
                        {
                            Id = Convert.ToInt32(reader["Id"]),
                            Name = reader["Name"].ToString(),
                        });
                    }
                }
            }

            return staff;
        }

        public int CreateStaff(CreateStaffDto createDto)
        {
            using (SqlConnection conn = new SqlConnection(ConnString))
            using (SqlCommand cmd = new SqlCommand("sp_Staff_Insert", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@StaffName", createDto.Name);

                conn.Open();
                // cmd.ExecuteNonQuery();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
    }
}