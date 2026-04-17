using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace office_asset_tracker.DAL
{
    /// <summary>
    /// Summary description for BaseRepository
    /// </summary>
    public class BaseRepository
    {
        protected readonly string ConnString;

        public BaseRepository()
        {
            ConnString = ConfigurationManager
                .ConnectionStrings["DefaultConnection"]
                .ConnectionString;
        }
    }
}
