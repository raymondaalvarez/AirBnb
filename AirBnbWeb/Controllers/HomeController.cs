using System;
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using AirBnb.Models;
using AirBnb.Business.Interfaces;
using AirBnbAPI;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using AirBnb.Entities;

namespace AirBnb.Controllers
{
    public class HomeController : Controller
    {
        private IConfiguration _config;
        private readonly IAirBnbUserManager _airBnbManager;
        private readonly IRentalManager _rentalManager;

        public HomeController(IConfiguration configuration,
            IAirBnbUserManager airBnbManager, IRentalManager rentalManager)
        {
            _config = configuration;
            _airBnbManager = airBnbManager;
            _rentalManager = rentalManager;
            
        }

        [HttpGet]
        [AllowAnonymous]
        public async Task<IActionResult> IndexAsync()
        {
            var result = await _rentalManager.GetAllRentals();
            return View(result);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult AboutUs()
        {
            AboutUsViewModel viewModel = new AboutUsViewModel();
            viewModel.CompanyName = "AirBnb";
            viewModel.MissionStatement = "Where there's a home, theres a need!";
            viewModel.StartDate = DateTime.Parse("12/9/2019");
            return View(viewModel);
        }

        [Authorize]
        [HttpGet]
        public IActionResult ContactUs()
        {
            ContactUsViewModel viewModel = new ContactUsViewModel();
            return View(viewModel);
        }

        [HttpPost]
        public IActionResult ContactUs(string firstName, string lastName, string email)
        {
            ContactUsViewModel viewModel = new ContactUsViewModel();
            viewModel.firstName = firstName;
            viewModel.lastName = lastName;
            viewModel.email = email;
            return View(viewModel);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult Edit()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ProcessSignupForm(AirBnbUser user, string password)
        {
            
            await _airBnbManager.AddUser(user, password);
            return View(user);
        }

        public IActionResult LoginWindow()
        {
            return View("_PartialLoginForm");
        }

        [HttpGet]
        public IActionResult Login(AirBnbUser user, string password)
        {
            AuthenticatedUser authenticatedUser = _airBnbManager.AuthorizeUser(user, password).Result;
            return View(authenticatedUser);
        }

        [Authorize]
        public IActionResult Logout()
        {
            return RedirectToAction("Index");
        }
    }
}
