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
        public User GetOneUser(string id)
        {
            var oneUser = _userService.GetOneUser(id);
            return oneUser;
        }

        [HttpPut("Update")]
        public async Task<bool> UpdateUser(User user)
        {
            return await _userService.UpdateUser(user: user);
        }

        [HttpPost("Remove")]
        public void RemoveGuest(string email)
        {
            _userService.RemoveUser(email);
        }
            
        [HttpDelete("DeleteUser")]
        public void DeleteUser(string email)
        {
            _userService.RemoveUser(email);
        }

        [HttpPut("EditUser/{id}")]
        public async Task<ActionResult<User>> EditUserDetails(string id, string email, string UserName)
        {
            return await _userService.EditUserDetails(id, email, UserName);
        }

    }
}