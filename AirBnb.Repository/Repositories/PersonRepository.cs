using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using AirBnbAPI;
using Dapper;


namespace AirBnb.Repository
{
    public class PersonRepository : BaseRepository, IPersonRepository
    {
        public PersonRepository(DatabaseProvider databaseProvider) : base(databaseProvider)
        { }


        public async Task AddPerson(Person person)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                await sqlConnection.QueryFirstAsync<Person>("AddPerson", person, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task UpdatePerson(Person person)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                await sqlConnection.QueryFirstAsync<Person>("UpdatePerson", person, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<Person> GetPersonById(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@id", id);
                return await sqlConnection.QueryFirstAsync<Person>("GetPersonById", parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<Person>> GetAllPeople()
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                return await sqlConnection.QueryAsync<Person>("GetAllPeople", null, commandType: CommandType.StoredProcedure);
            }
        } 

        public async Task DeletePerson(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@id", id);
                await sqlConnection.ExecuteAsync("DeletePerson", parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<Person> UpdateRating(Guid id)
        {
            using (var sqlConnection = await _db.GetSqlConnection())
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@id", id);
                return await sqlConnection.QueryFirstAsync<Person>("UpdateRating", parameters, commandType: CommandType.StoredProcedure);
            }
        }


    }
}
