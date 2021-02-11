using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Entities;

namespace AirBnbAPI
{
    public interface ILocationRepository
    {
        public Task<Guid> AddLocation(Location location);
        public Task UpdateLocation(Location location);
        public Task<Location> DeleteLocation(Guid id);
        public Task<IEnumerable<Location>> GetAllLocations();
        public Task<Location> GetLocationById(Guid id);
    }
}
