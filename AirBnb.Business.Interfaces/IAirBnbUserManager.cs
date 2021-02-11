using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Entities;
using AirBnbAPI;

namespace AirBnb.Business.Interfaces
{
    public interface IAirBnbUserManager
    {
        Task AddUser(AirBnbUser user, string password);
        Task UpdateUser(AirBnbUser user, string password);
        Task DeleteUser(Guid id);
        Task<IEnumerable<AirBnbUser>> GetAllUser();
        Task<AirBnbUser> GetUserById(Guid id);
        Task<AirBnbUser> GetUserByEmail(AirBnbUser user);
        Task<AuthenticatedUser> AuthorizeUser(AirBnbUser user, string password);
    }
}
