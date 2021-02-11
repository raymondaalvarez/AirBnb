using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Entities;
using AirBnb.Repository;
using Dapper;
namespace AirBnbAPI
{
    public class RentalRepository : BaseRepository, IRentalRepository
    {
        public RentalRepository(DatabaseProvider databaseProvider) : base(databaseProvider)
        { }

        public async Task<Guid> AddRental(Rental rental)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                rental.id = Guid.NewGuid();
                //TODO: temporary should be removed once cookies & authentication are in place
                rental.hostId = Guid.Parse("6d8a1da2-ab83-4fb4-9e8c-ca3e9a0d590e");
                await sqlConnection.QueryFirstAsync<Rental>("AddRental",
                    new {rental.id, rental.hostId, rental.title, rental.description, rental.bedrooms, rental.bathrooms, rental.addressId, rental.rating}, commandType: System.Data.CommandType.StoredProcedure);
                return rental.id;
            }
        }

        public async Task DeleteRental(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@rentalId", id);
                await sqlConnection.ExecuteAsync("DeleteRental", parameters, commandType: System.Data.CommandType.StoredProcedure);

            }
        }

        public async Task<IEnumerable<Rental>> GetAllRentalDetails()
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryAsync<Rental>("GetAllRentalDetails", null, commandType: System.Data.CommandType.StoredProcedure);
            }
        }


        public async Task<Rental> GetRentalDetailsById(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@rentalId", id);
                return await sqlConnection.QueryFirstAsync<Rental>("GetRentalDetailsById", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }


        public async Task<Rental> UpdateRental(Rental rental)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryFirstAsync<Rental>("UpdateRental", rental, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<Rental> UpdateRentalRating(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@rentalId", id);
                return await sqlConnection.QueryFirstAsync<Rental>("UpdateRentalDetailsById", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<RentalPrice> AddRentalPrice(RentalPrice rentalPrice)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryFirstAsync<RentalPrice>("AddRentalPrice", new { rentalPrice.id, rentalPrice.rentalFee}, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<RateSchedule> AddRateSchedule(RateSchedule rateSchedule)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                rateSchedule.rateScheduleId = Guid.NewGuid();
                return await sqlConnection.QueryFirstAsync<RateSchedule>("AddRateSchedule", rateSchedule, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<RateSchedule> GetRateSchedule(Guid rentalId, Guid rateScheduleId)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@rateScheduleId", rateScheduleId);
                parameters.Add("@rentalId", rentalId);
                return await sqlConnection.QueryFirstAsync<RateSchedule>("GetRateSchedule", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<RentalPrice> GetRentalPrice(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@rentalId", id);
                return await sqlConnection.QueryFirstAsync<RentalPrice>("GetRentalPrice", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }   

        public async Task<IEnumerable<RentalPrice>> GetAllRentalPrices()
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryAsync<RentalPrice>("GetAllRentalPrices", null, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<RateSchedule>> GetAllRateSchedulesByRental(Guid rentalId)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@rentalId", rentalId);
                return await sqlConnection.QueryAsync<RateSchedule>("GetAllRateSchedulesByRental", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<RentalPrice> UpdateRentalPrice(RentalPrice rentalPrice)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryFirstAsync<RentalPrice>("UpdateRentalPrice", rentalPrice, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<RateSchedule> UpdateRateSchedule(RateSchedule rateSchedule)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryFirstAsync<RateSchedule>("UpdateRateSchedule", rateSchedule, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task DeleteRateSchedule(Guid id)
        {
            using(var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@rateScheduleId", id);
                await sqlConnection.ExecuteAsync("DeleteRateSchedule", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
    }
}
