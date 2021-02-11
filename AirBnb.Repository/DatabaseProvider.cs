using System;
using System.Data.SqlClient;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;

namespace AirBnbAPI
{
    public class DatabaseProvider
    {
        private string _connectionString;

        public DatabaseProvider(string connectionString)
        {
            _connectionString = connectionString;
        }

        public DatabaseProvider(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("AzureConnection");
        }

        /// <summary>
        /// Get the connection object for connecting to the datbase
        /// </summary>
        /// <returns></returns>
        public async Task<SqlConnection> GetSqlConnection()
        {
            try
            {
                var conn = new SqlConnection(_connectionString);
                await conn.OpenAsync();
                return conn;
            }
            catch (Exception ex)
            {
                throw new Exception("Could not connect to database", ex);
            }
        }
    }
}

