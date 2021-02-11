using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Business;
using AirBnb.Business.Interfaces;
using AirBnb.Entities;
using Microsoft.AspNetCore.Mvc;

namespace AirBnbAPI.Controllers
{
    [Route("api/[controller]/[action]")]
    public class RentalController
    {
        private IRentalManager _rentalManager;
        public RentalController(IRentalManager rentalManager)
        {
            _rentalManager = rentalManager;
        }
        /*
         * Creation for rental, rental price, and rate schedule
         */
        [HttpPost]
        public Task<Guid> CreateRental([FromBody] Rental rental)
        {
            return _rentalManager.AddRental(rental);
        }

        [HttpPost]
        public Task<RentalPrice> AddRentalPrice([FromBody] RentalPrice rentalPrice)
        {
            return _rentalManager.AddRentalPrice(rentalPrice);
        }

        [HttpPost]
        public Task<RateSchedule> AddRateSchedule([FromBody] RateSchedule rateSchedule)
        {
            return _rentalManager.AddRateSchedule(rateSchedule);
        }
        /*
         * Updates for rental, rental rating, rental price, and rate schedule
         */
        [HttpPut]
        public Task<Rental> UpdateRental([FromBody] Rental rental)
        {
            return _rentalManager.UpdateRental(rental);
        }

        [HttpPut("{id}")]
        public Task<Rental> UpdateRentalRating(Guid id)
        {
            return _rentalManager.UpdateRentalRating(id);
        }

        [HttpPut]
        public Task<RentalPrice> UpdateRentalPrice([FromBody] RentalPrice rentalPrice)
        {
            return _rentalManager.UpdateRentalPrice(rentalPrice);
        }

        [HttpPut]
        public Task<RateSchedule> UpdateRateSchedule([FromBody] RateSchedule rateSchedule)
        {
            return _rentalManager.UpdateRateSchedule(rateSchedule);
        }
        /*
         * Gets for a specific rental, specific rental price, and specific rate schedule
         */
        [HttpGet("{id}")]
        public Task<Rental> GetRental(Guid id)
        {
            return _rentalManager.GetRentalDetailsById(id);
        }

        [HttpGet("{id}")]
        public Task<RentalPrice> GetRentalPrice(Guid id)
        {
            return _rentalManager.GetRentalPrice(id);
        }

        [HttpGet("{id}")]
        public Task<RateSchedule> GetRateSchedule([FromBody] Guid rentalId, [FromBody] Guid rateScheduleId)
        {
            return _rentalManager.GetRateSchedule(rentalId, rateScheduleId);
        }

        /*
         * Gets for a all rentals, all rentals with price, and all rate schedule for a specific rental
         */
        [HttpGet]
        public Task<IEnumerable<Rental>> GetAllRentals()
        {
            return _rentalManager.GetAllRentals();
        }

        [HttpGet]
        public Task<IEnumerable<RentalPrice>> GetAllRentalPrices()
        {
            return _rentalManager.GetAllRentalPrices();
        }

        [HttpGet("{id}")]
        public Task<IEnumerable<RateSchedule>> GetRateSchedules(Guid id)
        {
            return _rentalManager.GetAllRateSchedulesByRental(id);
        }

        /*
         * Delete rental
         */

        [HttpDelete]
        public Task DeleteRental(Guid id)
        {
            return _rentalManager.DeleteRental(id);
        }




    }
}
