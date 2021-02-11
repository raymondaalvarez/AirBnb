using System;
using System.Text.Json.Serialization;

namespace AirBnb.Entities
{
    public class Location
    {
        public Guid id { get; set; }
        public string street { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string zip { get; set; }
        [JsonIgnore]
        public int isActive { get; set; }
    }
}
