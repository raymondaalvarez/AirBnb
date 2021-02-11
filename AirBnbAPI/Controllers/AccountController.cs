using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Business;
using AirBnb.Business.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace AirBnbAPI.Controllers
{
    [Route("api/[controller]/[action]")]
    public class AccountController
    {
        private IAccountManager _accountManager;
        public AccountController(IAccountManager accountManager)
        {
            _accountManager = accountManager;
        }

        [HttpPost]
        public Task AddAccountDetails([FromBody] Account account)
        {
            return _accountManager.AddAccountDetails(account);
        }

        [HttpPut]
        public Task UpdateAccountDetails([FromBody] Account account)
        {
            return _accountManager.UpdateAccountDetails(account);
        }

        [HttpGet("{id}")]
        public Task<Account> GetAccount(Guid id)
        {
            return _accountManager.GetAccountDetailsById(id);
        }

        [HttpGet]
        public Task<IEnumerable<Account>> GetAccounts()
        {
            return _accountManager.GetAllAccountDetails();
        }

        [HttpDelete("{id}")]
        public Task DeleteAccount(Guid id)
        {
            return _accountManager.DeleteAccountDetailsById(id);
        }


    }
}
