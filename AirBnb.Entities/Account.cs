using System;
namespace AirBnbAPI
{
    public class Account
    {
        public Guid personId { get; set; }
        public string phoneNumber { get; set; }
        public string aboutMe { get; set; }
        public string profilePathUrl { get; set; }
        public string profilePictureURL { get; set; }
        public string userName { get; set; }
    }
}
