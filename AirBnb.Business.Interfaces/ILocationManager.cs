using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Entities;

namespace AirBnbAPI
{
    public interface ILocationManager
    {
        Task<Guid> CreateLocation(Location location);
        Task UpdateLocation(Location location);
        Task<Location> GetLocation(Guid id);
        Task<IEnumerable<Location>> GetLocations();
        Task<Location> DeleteLocation(Guid id);
    }
}
