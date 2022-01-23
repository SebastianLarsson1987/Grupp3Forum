
using Backend.Models.Database;
using Backend.Models.ViewModels;
using BackEnd.Models.ViewModels;
using BackEnd.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Controllers
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

        [HttpGet("GetAllUser")]
        public void GetAllUser()
        {
            var result = _userService.GetAllUser();
        }
        [HttpPost("AddUser")]
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
        [HttpGet("GetOneUser")]
        public User GetOneUser(int id)
        {
            var reuslt = _userService.GetOneUser(id);
            return reuslt;
        }

        [HttpPost("Remove User")]
        public void RemoveGuest(string email)
        {
            _userService.RemoveUser(email);

        }

        [HttpDelete("DeleteUser")]
        public void DeleteUser(string email)
        {
            var user = _db.Users.FirstOrDefault(x => x.Email == email);
            _db.Users.Remove(user);
            _db.SaveChanges();
        }

        [HttpPut("EditUser/{id}")]
        public async Task<ActionResult<User>> EditUserDetails(int id, string email, string UserName)
        {
            return await _userService.EditUserDetails(id, email, UserName);
        }

    }
}
