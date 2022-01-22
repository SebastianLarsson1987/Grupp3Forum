using System;
using System.Collections.Generic;
using Backend.Models.Database;
using Backend.Services;
using Backend.Models.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly UserService _userService;
        private readonly grupp3forumContext _db;

        public UserController(IUserService userService)
        {
            _userService = userService as UserService;
            _db = new grupp3forumContext();
        }

#nullable enable
        [HttpGet("Get")]
        public async Task<IEnumerable<User>> Get(string? id)
        {
            if(id== null) 
                return await _userService.GetAllUser();
            return new List<User>() { _userService.GetOneUser(id)};
        }
#nullable disable
        [HttpPost("Add")]
        public async Task<User> AddUser(AddUserViewModel model)
        {
            var newUser = new User()
            {
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
        public User GetOneUser(string email)
        {
            var oneUser = _userService.GetOneUser(email);
            return oneUser;
        }
        // TODO: Create backing for FirebaseId in database.
        [HttpPut("Update")]
        public async Task<bool> UpdateUser(UserUpdateRequest userUpdateRequest)
        {
            try
            {
                var user = await _userService.GetOneUserByUId(userUpdateRequest.FirebaseId);
                user.Email = userUpdateRequest.Email;
                user.UserName = userUpdateRequest.UserName;
                return true;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        [HttpPost("Remove")]
        public void RemoveGuest(string email)
        {
            _userService.RemoveUser(email);
        }

        public class UserUpdateRequest
        {
            public string FirebaseId { get; set; }
            public string UserName { get; set; }
            public string Email { get; set; }

        }
    }
}