using System;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using AirBnbAPI;
using System.Threading.Tasks;
using AirBnb.Repository.Interfaces.IRepositories;
using AirBnb.Entities;

namespace AirBnbWeb.Controllers
{
    public class ReservationRequestController : Controller
    {
        private IConfiguration _config;
        private readonly IReservationRequestRepository _reservationRequestRepository;
        public ReservationRequestController(IConfiguration configuration, IReservationRequestRepository requestRepository)
        {
            _config = configuration;
            _reservationRequestRepository = requestRepository;
        }

        [HttpPost]
        public async Task<IActionResult> CreateReservationRequest(ReservationRequest reservationRequest)
        {
            await _reservationRequestRepository.CreateReservationRequest(reservationRequest);
            return View(reservationRequest);
        }


    }
}
