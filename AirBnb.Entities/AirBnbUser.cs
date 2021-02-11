using System;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;

namespace AirBnbAPI
{
    public class AirBnbUser
    {
        public Guid id { get; set; }
        public string email { get; set; }
        public int roleId { get; set; }
        public string salt { get; set; }
        public string pword { get; set; }        
        public int isActive { get; set; }
        

    }
}
