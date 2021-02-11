using System;
namespace AirBnb.Entities
{
    public class RateSchedule : RentalPrice
    {
        public Guid rateScheduleId { get; set; }
        public DateTime startDate { get; set; }
        public DateTime endDate { get; set; }
        public float additionalFee { get; set; }
    }
}
