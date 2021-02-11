using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Entities;

namespace AirBnbAPI
{
    public class LocationManager : ILocationManager
    {
        private ILocationRepository _locationRepository;
        public LocationManager(ILocationRepository locationRepository)
        {
            _locationRepository = locationRepository;
        }

        public Task<Guid> CreateLocation(Location location)
        {
            return _locationRepository.AddLocation(location);
        }

        public Task<Location> DeleteLocation(Guid id)
        {
            return _locationRepository.DeleteLocation(id);
        }

        public Task<Location> GetLocation(Guid id)
        {
            return _locationRepository.GetLocationById(id);
        }

        public Task<IEnumerable<Location>> GetLocations()
        {
            return _locationRepository.GetAllLocations();
        }

        public Task UpdateLocation(Location location)
        {
            return _locationRepository.UpdateLocation(location);
        }
    }
}
