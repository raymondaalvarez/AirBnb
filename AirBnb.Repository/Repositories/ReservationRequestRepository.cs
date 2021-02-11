using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Entities;
using AirBnb.Repository.Interfaces.IRepositories;
using AirBnbAPI;
using Dapper;

namespace AirBnb.Repository.Repositories
{
    public class ReservationRequestRepository: BaseRepository, IReservationRequestRepository
    {
        public ReservationRequestRepository(DatabaseProvider databaseProvider) : base(databaseProvider)
        {
        }

        public async Task CreateReservationRequest(ReservationRequest reservationRequest)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                reservationRequest.id = Guid.NewGuid();
                await sqlConnection.ExecuteAsync("CreateReservationRequest", new
                { reservationRequest.id, reservationRequest.rentalId, reservationRequest.email,
                    reservationRequest.checkIn, reservationRequest.checkOut, reservationRequest.message }
                , commandType: System.Data.CommandType.StoredProcedure);
            }
        }
        public async Task DeleteReservationRequest(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                await sqlConnection.ExecuteAsync("DeleteReservationRequest", new { id }, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
        public async Task UpdateReservationRequest(ReservationRequest reservationRequest)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                await sqlConnection.ExecuteAsync("UpdateReservationRequest", reservationRequest, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
        public async Task<ReservationRequest> GetReservationRequest(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryFirstAsync<ReservationRequest>("GetReservationRequestById", new { id }, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
        public async Task<IEnumerable<ReservationRequest>> GetAllReservationRequestRental(Guid rentalId)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryAsync<ReservationRequest>("GetAllReservationRequestRental", new { rentalId }, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
        public async Task<IEnumerable<ReservationRequest>> GetAllReservationRequestRenter(Guid renterId)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryAsync<ReservationRequest>("GetAllReservationRequestRental", new { renterId }, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

    }
}
