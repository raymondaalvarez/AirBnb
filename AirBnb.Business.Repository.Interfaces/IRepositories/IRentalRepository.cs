using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Entities;

namespace AirBnbAPI
{
    public interface IRentalRepository
    {
        public Task<Guid> AddRental(Rental rental);
        public Task<Rental> UpdateRental(Rental rental);
        public Task<Rental> UpdateRentalRating(Guid id);
        public Task<Rental> GetRentalDetailsById(Guid id);
        public Task DeleteRental(Guid id);
        public Task<IEnumerable<Rental>> GetAllRentalDetails();

        public Task<RentalPrice> AddRentalPrice(RentalPrice rentalPrice);
        public Task<RentalPrice> UpdateRentalPrice(RentalPrice rentalPrice);
        public Task<RentalPrice> GetRentalPrice(Guid id);
        public Task<IEnumerable<RentalPrice>> GetAllRentalPrices();

        public Task<RateSchedule> AddRateSchedule(RateSchedule rateSchedule);
        public Task<RateSchedule> UpdateRateSchedule(RateSchedule rateSchedule);
        public Task<RateSchedule> GetRateSchedule(Guid rentalId, Guid rateScheduleId);
        public Task<IEnumerable<RateSchedule>> GetAllRateSchedulesByRental(Guid rentalId);
        public Task DeleteRateSchedule(Guid id);


    }
}
