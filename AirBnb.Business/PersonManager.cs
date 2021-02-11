using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Business.Interfaces;
using AirBnbAPI;

namespace AirBnb.Business
{
    public class PersonManager : IPersonManager
    {
        private IPersonRepository _personRepository;
        public PersonManager(IPersonRepository personRepository)
        {
            _personRepository = personRepository;
        }

        public Task AddPerson(Person person)
        {
            return _personRepository.AddPerson(person);
        }

        public Task UpdatePerson(Person person)
        {
            return _personRepository.UpdatePerson(person);
        }

        public Task<Person> GetPersonById(Guid id)
        {
            return _personRepository.GetPersonById(id);
        }

        public Task<IEnumerable<Person>> GetAllPeople()
        {
            return _personRepository.GetAllPeople();
        }

        public Task DeletePerson(Guid id)
        {
            return _personRepository.DeletePerson(id);
        }

        public Task<Person> UpdateRating(Guid id)
        {
            return _personRepository.UpdateRating(id);
        }
    }
}
