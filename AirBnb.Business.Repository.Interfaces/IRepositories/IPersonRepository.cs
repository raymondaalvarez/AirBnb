using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace AirBnbAPI
{
    public interface IPersonRepository
    {
        public Task AddPerson(Person person);
        public Task UpdatePerson(Person person);
        public Task<Person> GetPersonById(Guid id);
        public Task<IEnumerable<Person>> GetAllPeople();
        public Task DeletePerson(Guid id);
        public Task<Person> UpdateRating(Guid id);

    }
}
