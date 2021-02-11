using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Entities;

namespace AirBnbAPI
{
    public class RentalManager : IRentalManager
    {
        private IRentalRepository _rentalRepository;
        public RentalManager(IRentalRepository rentalRepository)
        {
            _rentalRepository = rentalRepository;
        }

        public Task<Guid> AddRental(Rental rental)
        {
            return _rentalRepository.AddRental(rental);
        }

        public Task DeleteRental(Guid id)
        {
            return _rentalRepository.DeleteRental(id);
        }

        public Task<Rental> GetRentalDetailsById(Guid id)
        {
            return _rentalRepository.GetRentalDetailsById(id);
        }

        public Task<Rental> UpdateRental(Rental rental)
        {
            return _rentalRepository.UpdateRental(rental);
        }

        public Task<IEnumerable<Rental>> GetAllRentals()
        {
            return _rentalRepository.GetAllRentalDetails();
        }

        public Task<Rental> UpdateRentalRating(Guid id)
        {
            return _rentalRepository.UpdateRentalRating(id);
        }

        public Task<RentalPrice> AddRentalPrice(RentalPrice rentalPrice)
        {
            return _rentalRepository.AddRentalPrice(rentalPrice);
        }

        public Task<RentalPrice> UpdateRentalPrice(RentalPrice rentalPrice)
        {
            return _rentalRepository.UpdateRentalPrice(rentalPrice);
        }

        public Task<RentalPrice> GetRentalPrice(Guid id)
        {
            return _rentalRepository.GetRentalPrice(id);
        }

        public Task<IEnumerable<RentalPrice>> GetAllRentalPrices()
        {
            return _rentalRepository.GetAllRentalPrices();
        }

        public Task<RateSchedule> AddRateSchedule(RateSchedule rateSchedule)
        {
            return _rentalRepository.AddRateSchedule(rateSchedule);
        }

        public Task<RateSchedule> UpdateRateSchedule(RateSchedule rateSchedule)
        {
            return _rentalRepository.UpdateRateSchedule(rateSchedule);
        }

        public Task<RateSchedule> GetRateSchedule(Guid rentalId, Guid rateScheduleId)
        {
            return _rentalRepository.GetRateSchedule(rentalId, rateScheduleId);
        }

        public Task<IEnumerable<RateSchedule>> GetAllRateSchedulesByRental(Guid rentalId)
        {
            return _rentalRepository.GetAllRateSchedulesByRental(rentalId);
        }
    }
}
