using System;
namespace AirBnbAPI.Models
{
    public class CreateAccountRequest : AirBnbUser
    {
        public string Password { get; set; }
    }
}
