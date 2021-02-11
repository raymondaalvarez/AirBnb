using System;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using AirBnbAPI;
using AirBnb.Entities;
using System.Threading.Tasks;
namespace AirBnbWeb.Controllers
{
    public class RentalController : Controller
    {
        private IConfiguration _config;
        private readonly IRentalManager _rentalManager;
        public RentalController(IConfiguration configuration, IRentalManager rentalManager)
        {
            _config = configuration;
            _rentalManager = rentalManager;
        }

        [HttpPost]
        public async Task<IActionResult> CreateRental(RentalPrice rentalPrice)
        {
            Rental rental = rentalPrice;
            Guid id = await _rentalManager.AddRental(rental);
            rentalPrice.id = id;
            rental.rentalFee = rentalPrice.rentalFee;
            await _rentalManager.AddRentalPrice(rentalPrice);
            return View("ViewRental", rental);
        }

        [HttpGet]
        public async Task<IActionResult> ViewRental(Guid id)
        {
            var result = await _rentalManager.GetRentalDetailsById(id);
            return View(result);
        }

    }
}
