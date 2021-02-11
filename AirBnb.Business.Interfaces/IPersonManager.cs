using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnbAPI;
namespace AirBnb.Business.Interfaces
{
    public interface IPersonManager
    {
        Task AddPerson(Person person);
        Task UpdatePerson(Person person);
        Task<Person> GetPersonById(Guid id);
        Task<IEnumerable<Person>> GetAllPeople();
        Task DeletePerson(Guid id);
        Task<Person> UpdateRating(Guid id);
    }
}
