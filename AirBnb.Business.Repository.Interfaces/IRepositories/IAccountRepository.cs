using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace AirBnbAPI
{
    public interface IAccountRepository
    {
        public Task AddAccountDetails(Account account);
        public Task UpdateAccountDetails(Account account);
        public Task<Account> GetAccountDetailsById(Guid id);
        public Task DeleteAccountDetailsById(Guid id);
        public Task<IEnumerable<Account>> GetAllAccountDetails();

    }
    

}
