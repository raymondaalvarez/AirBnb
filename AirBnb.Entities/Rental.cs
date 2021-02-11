using System;
namespace AirBnb.Entities
{
    public class Rental
    {
        public Guid id { get; set; }
        public Guid hostId { get; set; }
        public string title { get; set; }
        public float bedrooms { get; set; }
        public float bathrooms { get; set; }
        public string description { get; set; }
        public float rating { get; set; }
        public Guid addressId { get; set; }
        public int isActive { get; set; }
        public float rentalFee { get; set; }

    }
}
