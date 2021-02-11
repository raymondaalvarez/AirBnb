using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Entities;
using AirBnb.Repository;
using Dapper;

namespace AirBnbAPI
{
    public class LocationRepository : BaseRepository, ILocationRepository
    {
       public LocationRepository(DatabaseProvider databaseProvider) : base(databaseProvider)
        {

        }

        public async Task<Guid> AddLocation(Location location)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                location.id = Guid.NewGuid();
                await sqlConnection.QueryAsync("AddLocation", location, commandType: System.Data.CommandType.StoredProcedure);
                return location.id;
            }
        }

        public async Task<Location> DeleteLocation(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@locationId", id);
                return await sqlConnection.QueryFirstAsync<Location>("DeleteLocation", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<Location>> GetAllLocations()
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryAsync<Location>("GetAllLocations", null, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<Location> GetLocationById(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@locationId", id);
                return await sqlConnection.QueryFirstAsync<Location>("GetLocationById", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task UpdateLocation(Location location)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                await sqlConnection.QueryFirstAsync<Location>("UpdateLocation", location, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
    }
}
