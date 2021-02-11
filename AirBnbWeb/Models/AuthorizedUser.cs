using System;
namespace AirBnbWeb.Models
{
    public class AuthorizedUser
    {
        public Guid id { get; set; }
        public string email { get; set; }
        public int roleId { get; set; }
        public string salt { get; set; }
        public string pword { get; set; }        
        public int isActive { get; set; }
    }
}
