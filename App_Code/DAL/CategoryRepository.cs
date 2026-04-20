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
    /// Summary description for CategoryRepository
    /// </summary>
    public class CategoryRepository : BaseRepository
    {
        public List<Category> GetCategories()
        {
            var categories = new List<Category>();

            using (SqlConnection conn = new SqlConnection(ConnString))
            using (SqlCommand cmd = new SqlCommand("sp_Category_GetAll", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        categories.Add(new Category
                        {
                            Id = (int)reader["Id"],
                            Name = reader["Name"].ToString(), 
                        });
                    }
                }
            }

            return categories;
        }

        public int CreateCategory(CreateCategoryDto createDto)
        {
            using (SqlConnection conn = new SqlConnection(ConnString))
            using (SqlCommand cmd = new SqlCommand("sp_Category_Insert", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CategoryName", createDto.Name);

                conn.Open();
                // cmd.ExecuteNonQuery();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
    }
}