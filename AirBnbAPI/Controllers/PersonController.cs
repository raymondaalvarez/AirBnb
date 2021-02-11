using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AirBnb.Business.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace AirBnbAPI.Controllers
{
    [Route("api/[controller]/[action]")]
    public class PersonController
    {
        private IPersonManager _personManager;
        public PersonController(IPersonManager personManager)
        {
            _personManager = personManager;
        }

        [HttpPost]
        public Task AddPerson([FromBody] Person person)
        {
            return _personManager.AddPerson(person);
        }

        [HttpPut]
        public Task UpdatePerson([FromBody] Person person)
        {
            return _personManager.UpdatePerson(person);
        }

        [HttpDelete("{id}")]
        public void Delete(Guid id)
        {
            _personManager.DeletePerson(id);
        }

        [HttpGet("{id}")]
        public Task<Person> Get(Guid id)
        {
            return _personManager.GetPersonById(id);
        }

        [HttpGet]
        public Task<IEnumerable<Person>> Get()
        {
            return _personManager.GetAllPeople();
        }

        [HttpPut("{id}")]
        public Task<Person> UpdateRating(Guid id)
        {
            return _personManager.UpdateRating(id);
        }
    }
}
