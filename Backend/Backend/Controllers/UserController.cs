﻿using System.Collections.Generic;
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

        [HttpGet("Get")]
        public async Task<IEnumerable<User>> Get(int? id)
        {
            if(id== null) 
                return await _userService.GetAllUser();
            return new List<User>() { GetOneUser(id.Value) };
        }

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
        public User GetOneUser(int id)
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
    }
}