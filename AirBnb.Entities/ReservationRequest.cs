using System;

namespace AirBnb.Entities
{
    public class ReservationRequest
    {
        public Guid id { get; set; }
        public Guid rentalId { get; set; }
        public Guid renterId {get; set;}
        public string email { get; set; }
        public DateTime checkIn { get; set; }
        public DateTime checkOut { get; set; }
        public string message { get; set; }
    }
}
