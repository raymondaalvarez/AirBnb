using AirBnb.Entities;
using AirBnbAPI;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using static System.Data.CommandType;
using static System.Web.Helpers.Crypto;

namespace AirBnb.Repository
{
    public class AirBnbUserRepository : BaseRepository, IAirBnbUserRepository
    {
        public AirBnbUserRepository(DatabaseProvider databaseProvider) : base(databaseProvider)
        {

        }
        public async Task AddUser(AirBnbUser user, string password)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                user.id = Guid.NewGuid();
                user.roleId = 3;
                user.salt = GenerateSalt(6);
                user.pword = Hash(password + user.salt);
                await sqlConnection.ExecuteAsync(
                    "AddUser",
                    new {
                        user.id,
                        user.email,
                        user.roleId,
                        user.salt,
                        user.pword
                    },
                    commandType: StoredProcedure);
            }       
        }

        public async Task UpdateUser(AirBnbUser user, string password)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                /*
                    If the passwords dont match on updating then that means the password was updated.
                    Then we have to generate a new salt and new hash for that password
                    */
                if (user.pword != Hash(password + user.salt))
                {
                    user.salt = GenerateSalt(6);
                    user.pword = Hash(password + user.salt);
                }
                await sqlConnection.ExecuteAsync("UpdateUser", user, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task DeleteUser(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@id", id);
                await sqlConnection.ExecuteAsync("DeleteUser", parameters, commandType: CommandType.StoredProcedure);
            }
        }
        public async Task<IEnumerable<AirBnbUser>> GetAllUsers()
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryAsync<AirBnbUser>("GetAllUsers", null, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<AirBnbUser> GetUserById(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@id", id);
                return await sqlConnection.QueryFirstAsync<AirBnbUser>("GetUserById", parameters, commandType: CommandType.StoredProcedure);
            }                
        }

        public async Task<AirBnbUser> GetUserByEmail(AirBnbUser user)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryFirstAsync<AirBnbUser>("GetUserByEmail", new {user.email}, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<AuthenticatedUser> AuthenticatUser(AirBnbUser user, string password)
        {
            user = await GetUserByEmail(user);
            if (user.pword == Hash(password + user.salt))
            {
                using (var sqlConnection = await _db.GetSqlConnection())
                {
                    return await sqlConnection.QueryFirstAsync<AuthenticatedUser>("AuthAndGetUser", new { user.email, user.pword }, commandType: CommandType.StoredProcedure);
                }
            }
            AuthenticatedUser notAuthenticated = new AuthenticatedUser();
            notAuthenticated.email = user.email;
            notAuthenticated.id = user.id;
            notAuthenticated.userType = "NotAuthorized";
            return notAuthenticated;
        }
    }
}
