using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Business.Interfaces;
using AirBnbAPI.Models;
using Microsoft.AspNetCore.Mvc;
namespace AirBnbAPI.Controllers
{
    [Route("api/[controller]")]
    public class AirBnbUserController
    {
        private IAirBnbUserManager _airBnbUserManager;
        public AirBnbUserController(IAirBnbUserManager airBnbUserManager)
        {
            _airBnbUserManager = airBnbUserManager;
        }

        // GET<td style="border<td style="border: 1px dashed #ababab;"> 1px dashed #ababab;"> api/user
        [HttpGet]
        public Task<IEnumerable<AirBnbUser>> Get()
        {
            return _airBnbUserManager.GetAllUser();
        }

        [HttpGet("{id}")]
        public Task<AirBnbUser> Get(Guid id)
        {
            return _airBnbUserManager.GetUserById(id);
        }

        //public Task<AirBnbUser> Login(string email)
        //{
        //    return _airBnbUserManager.LoginUser(email);
        //}

        [HttpPost]
        public Task Post([FromBody] CreateAccountRequest user)
        {
            return _airBnbUserManager.AddUser(user, user.Password);
        }

        [HttpPut]
        public Task Put([FromBody] AirBnbUser user, [FromBody] string password)
        {
            return _airBnbUserManager.UpdateUser(user, password);
        }

        [HttpDelete("{id}")]
        public void Delete(Guid id)
        {
            _airBnbUserManager.DeleteUser(id);
        }
    }
}
