using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnbAPI;

namespace AirBnb.Business
{
    public class AccountManager : IAccountManager
    {
        private IAccountRepository _accountRepository;
        public AccountManager(IAccountRepository accountRepository)
        {
            _accountRepository = accountRepository;
        }

        public Task AddAccountDetails(Account account)
        {
            return _accountRepository.AddAccountDetails(account);
        }

        public Task<Account> GetAccountDetailsById(Guid id)
        {
            return _accountRepository.GetAccountDetailsById(id);
        }

        public Task<IEnumerable<Account>> GetAllAccountDetails()
        {
            return _accountRepository.GetAllAccountDetails();
        }

        public Task UpdateAccountDetails(Account account)
        {
            return _accountRepository.UpdateAccountDetails(account);
        }

        public Task DeleteAccountDetailsById(Guid id)
        {
            return _accountRepository.DeleteAccountDetailsById(id);
        }
    }
}
