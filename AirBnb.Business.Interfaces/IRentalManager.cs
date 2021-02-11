using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Entities;

namespace AirBnbAPI
{
    public interface IRentalManager
    {
        Task<Guid> AddRental(Rental rental);
        Task<Rental> UpdateRental(Rental rental);
        Task<Rental> GetRentalDetailsById(Guid id);
        Task<Rental> UpdateRentalRating(Guid id);
        Task DeleteRental(Guid id);
        Task<IEnumerable<Rental>> GetAllRentals();

        Task<RentalPrice> AddRentalPrice(RentalPrice rentalPrice);
        Task<RentalPrice> UpdateRentalPrice(RentalPrice rentalPrice);
        Task<RentalPrice> GetRentalPrice(Guid id);
        Task<IEnumerable<RentalPrice>> GetAllRentalPrices();

        Task<RateSchedule> AddRateSchedule(RateSchedule rateSchedule);
        Task<RateSchedule> UpdateRateSchedule(RateSchedule rateSchedule);
        Task<RateSchedule> GetRateSchedule(Guid rentalId, Guid rateScheduleId);
        Task<IEnumerable<RateSchedule>> GetAllRateSchedulesByRental(Guid rentalId);
    }
}
