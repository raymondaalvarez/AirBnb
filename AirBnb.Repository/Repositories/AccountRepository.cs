using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Repository;
using Dapper;
using Microsoft.Extensions.Configuration;

namespace AirBnbAPI
{
    public class AccountRepository : BaseRepository, IAccountRepository
    {

        public AccountRepository(DatabaseProvider databaseProvider) : base(databaseProvider)
        {

        }

        public async Task AddAccountDetails(Account account)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                await sqlConnection.QueryFirstAsync<Account>("AddAccountDetails", account, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<Account> GetAccountDetailsById(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@personId", id);
                return await sqlConnection.QueryFirstAsync<Account>("GetAccountDetailsById", parameters, commandType: System.Data.CommandType.StoredProcedure);
                
            }
        }

        public async Task<IEnumerable<Account>> GetAllAccountDetails()
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryAsync<Account>("GetAllAccountDetails", null, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task UpdateAccountDetails(Account account)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                await sqlConnection.QueryFirstAsync<Account>("UpdateAccountDetails", account, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task DeleteAccountDetailsById(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@personId", id);
                await sqlConnection.ExecuteAsync("DeleteAccountDetailsById", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
    }
}
