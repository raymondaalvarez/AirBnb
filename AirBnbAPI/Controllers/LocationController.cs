using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Business.Interfaces;
using AirBnb.Entities;
using Microsoft.AspNetCore.Mvc;

namespace AirBnbAPI.Controllers
{
    [Route("api/[controller]/[action]")]
    public class LocationController
    {
        private ILocationManager _locationManager;
        public LocationController(ILocationManager locationManager)
        {
            _locationManager = locationManager;
        }

        [HttpPost]
        public Task CreateLocation([FromBody] Location location)
        {
            return _locationManager.CreateLocation(location);
        }

        [HttpPut]
        public Task UpdateLocation([FromBody] Location location)
        {
            return _locationManager.UpdateLocation(location);
        }

        [HttpGet("{id}")]
        public Task<Location> GetLocation(Guid id)
        {
            return _locationManager.GetLocation(id);
        }

        [HttpGet]
        public Task<IEnumerable<Location>> GetLocations()
        {
            return _locationManager.GetLocations();
        }

        [HttpDelete("{id}")]
        public Task<Location> DeleteLocation(Guid id)
        {
            return _locationManager.DeleteLocation(id);
        }


    }
}
