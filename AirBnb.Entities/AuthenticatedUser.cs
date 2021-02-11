using System;
using AirBnbAPI;

namespace AirBnb.Entities
{
    public class AuthenticatedUser : AirBnbUser
    {
        public string userType { get; set; }
    }
}
