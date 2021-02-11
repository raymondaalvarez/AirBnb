using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Business.Interfaces;
using AirBnbAPI;
namespace AirBnb.Business
{
    public interface IAccountManager
    {
        Task AddAccountDetails(Account account);
        Task UpdateAccountDetails(Account account);
        Task<Account> GetAccountDetailsById(Guid id);
        Task<IEnumerable<Account>> GetAllAccountDetails();
        Task DeleteAccountDetailsById(Guid id);

    }
}
