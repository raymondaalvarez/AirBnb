using System;
using System.Threading.Tasks;
using AirBnb.Entities;
using AirBnbAPI;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace AirBnbWeb.Controllers
{
    public class LocationController : Controller
    {
        private readonly IConfiguration _config;
        private readonly ILocationRepository _locationRepository;

        public LocationController(IConfiguration configuration, ILocationRepository locationRepository)
        {
            _config = configuration;
            _locationRepository = locationRepository;
        }

        [Route("LocationForm")]
        public IActionResult LoadLocationFormPage()
        {
            return View("CreateLocation");
        }

        [HttpPost]
        public async Task<IActionResult> CreateLocation(Location location)
        {
            await _locationRepository.AddLocation(location);
            return View("~/Views/Rental/CreateRental.cshtml", location);
        }

        public async Task<IActionResult> GetLocation(Guid id)
        {
            Location location = await _locationRepository.GetLocationById(id);
            return View(location);
        }

        public async Task<IActionResult> UpdateLocation(Location location)
        {
            await _locationRepository.UpdateLocation(location);
            return View(location);
        }
    }
}
