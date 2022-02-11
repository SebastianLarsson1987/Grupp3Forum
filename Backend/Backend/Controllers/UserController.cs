using System.Collections.Generic;
using Backend.Models.Database;
using Backend.Services;
using Backend.Models.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using System;
using Microsoft.Extensions.Logging;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly UserService _userService;
        private readonly grupp3forumContext _db;
        private readonly ILogger<UserService> _logger;

        public UserController(IUserService userService, ILogger<UserService> logger, grupp3forumContext db)
        {
            _userService = userService as UserService;
            _db = db;
            _logger = logger;
        }

        [HttpGet("GetAll")]
        public async Task<IEnumerable<User>> GetAllUser()
        {
            return await _userService.GetAllUser();
        }

        [HttpPost("AddUser")]
        public async Task<User> AddUser(AddUserViewModel model)
        {
            var newUser = new User()
            {
                Uid = model.Uid,
                UserName = model.UserName,
                Email = model.Email,
                Banned = false,
                RoleId = 1
            };
            _db.Users.Add(newUser);
            await _db.SaveChangesAsync();
            return newUser;
        }

        [HttpGet("GetUser")]
        public async Task<IEnumerable<User>> GetOneUser(string id)
        {
            var oneUser = await _userService.GetOneUser(id);
            return oneUser;
        }

        [HttpPut("Update")]
        public async Task<bool> UpdateUser(User user)
        {
            return await _userService.UpdateUser(user: user);
        }

        [HttpPost("Remove")]
        public async void RemoveGuest(string id)
        {
            await _userService.RemoveUser(id, _db);
        }

        [HttpDelete("DeleteUser")]
        public async Task<ActionResult> DeleteUser(string uid)
        {
            try
            {
                await _userService.RemoveUser(uid, _db);
                return Ok();
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
                return BadRequest();
            }
        }

        [HttpPut("EditUser/{id}")]
        public async Task<ActionResult<User>> EditUserDetails(string id, string email, string UserName)
        {
            return await _userService.EditUserDetails(id, email, UserName);
        }

        [HttpGet("GetUserStatus")]
        public async Task<IEnumerable<bool>> GetUserStatus(string email)
        {
            return await _userService.CheckUserStatus(email);
        }

        [HttpPut("SetUserAsBanned")]
        public void BanUserAsAdmin(string id)
        {
            _userService.SetUserAsBanned(id);
        }
    }
}