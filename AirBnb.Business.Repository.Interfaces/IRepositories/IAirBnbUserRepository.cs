using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Entities;

namespace AirBnbAPI
{
    public interface IAirBnbUserRepository
    {
        Task AddUser(AirBnbUser user, string password);
        Task UpdateUser(AirBnbUser user, string password);
        Task DeleteUser(Guid id);
        Task<IEnumerable<AirBnbUser>> GetAllUsers();
        Task<AirBnbUser> GetUserById(Guid id);
        Task<AirBnbUser> GetUserByEmail(AirBnbUser user);
        Task<AuthenticatedUser> AuthenticatUser(AirBnbUser user, string password);
    }
}
