using System;
using System.Threading.Tasks;
using AirBnb.Entities;

namespace AirBnb.Business.Interfaces
{
    public interface IReservationRequestManager
    {
        Task CreateReservationRequest(ReservationRequest reservationRequest);
        Task DeleteReservationRequest(Guid id);
        Task UpdateReservationRequest(ReservationRequest reservationRequest);
        Task GetAllReservationRequestByRenter(Guid renterId);
        Task GetAllReservationRequestByRental(Guid rentalId);
        Task GetReservationRequestById(Guid id);
    }
}
