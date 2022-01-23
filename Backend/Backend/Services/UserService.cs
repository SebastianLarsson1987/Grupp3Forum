using Backend.Models.Database;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace BackEnd.Services
{
    public class UserService : ControllerBase, IUserService
    {
        private readonly grupp3forumContext _Db;

        public UserService()
        {
            _Db = new grupp3forumContext();
        }

        public IEnumerable<User> GetAllUser()
        {
            return _Db.Users.Where(x => x.UserName == "Larzzons");
        }

        public User GetOneUser(int id)
        {
            return _Db.Users.FirstOrDefault(x => x.Id == id);
        }
        public void RemoveUser(string email)
        {
            const string deleted = "deleted";
            var customer = _Db.Users.SingleOrDefault(x => x.Email == email);
            customer.Banned = false;
            customer.Email = deleted;
            customer.UserName = deleted;

            _Db.SaveChanges();
        }
        
        public async Task<ActionResult<User>> EditUserDetails(int id, string email, string UserName)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest("Not a valid model");
            }

            var existingUser = _Db.Users.Where(u => u.Id == id)
                .FirstOrDefault();

            if (existingUser != null)
            {
                existingUser.Email = email;
                existingUser.UserName = UserName;

               await _Db.SaveChangesAsync();
            }
            else
            {
                return NotFound();
            }

            return Ok();


        }
    }
}
