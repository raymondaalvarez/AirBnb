using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Entities;

namespace AirBnb.Repository.Interfaces.IRepositories
{
    public interface IReservationRequestRepository
    {
        Task CreateReservationRequest(ReservationRequest reservationRequest);
        Task UpdateReservationRequest(ReservationRequest reservationRequest);
        Task<ReservationRequest> GetReservationRequest(Guid id);
        Task<IEnumerable<ReservationRequest>> GetAllReservationRequestRental(Guid rentalId);
        Task<IEnumerable<ReservationRequest>> GetAllReservationRequestRenter(Guid renterId);
    }
}
