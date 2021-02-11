using System;
using System.Data.SqlClient;
using AirBnbAPI;
using Microsoft.Extensions.Configuration;
namespace AirBnb.Repository
{
    public class BaseRepository
    {
        protected DatabaseProvider _db;
        public BaseRepository(DatabaseProvider databaseProvider)
        {
            _db = databaseProvider;
        }
    }
}
