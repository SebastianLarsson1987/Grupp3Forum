using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend.Models.Database;
using Backend.Services;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly UserService _userService;
        public UserController()
        {
            _userService = new UserService();
        }

        [HttpGet]
        public async Task<IEnumerable<User>> GetAllUser()
        {
            return await _userService.GetAllUser();
        }

        [HttpPut]
        public async Task<bool> UpdateUser(User user)
        {
            return await _userService.UpdateUser(user: user);
        }
    }
}
