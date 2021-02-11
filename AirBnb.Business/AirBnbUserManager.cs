using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Business.Interfaces;
using AirBnb.Entities;
using AirBnbAPI;

namespace AirBnb.Business
{
    public class AirBnbUserManager : IAirBnbUserManager
    {
        private IAirBnbUserRepository _airBnbUserRepository;

        public AirBnbUserManager(IAirBnbUserRepository airBnbUserRepository)
        {
            _airBnbUserRepository = airBnbUserRepository;
        }

        public Task AddUser(AirBnbUser user, string password)
        {
            return _airBnbUserRepository.AddUser(user, password);
        }

        public Task DeleteUser(Guid id)
        {
            return _airBnbUserRepository.DeleteUser(id);
        }

        public Task<IEnumerable<AirBnbUser>> GetAllUser()
        {
            return _airBnbUserRepository.GetAllUsers();
        }

        public Task<AirBnbUser> GetUserById(Guid id)
        {
            return _airBnbUserRepository.GetUserById(id);
        }

        public Task UpdateUser(AirBnbUser user, string password)
        {
            return _airBnbUserRepository.UpdateUser(user, password);
        }

        public Task<AirBnbUser> GetUserByEmail(AirBnbUser user)
        {
            return _airBnbUserRepository.GetUserByEmail(user);
        }

        public Task<AuthenticatedUser> AuthorizeUser(AirBnbUser user, string password)
        {
            return _airBnbUserRepository.AuthenticatUser(user, password);
        }
    }
}
