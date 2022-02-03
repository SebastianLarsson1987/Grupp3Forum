using Backend.Models.Database;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Backend.Services
{
    public class UserService : ControllerBase, IUserService
    {

        private readonly grupp3forumContext _Db;

        public UserService()
        {
            _Db = new grupp3forumContext();
        }

        public async Task<IEnumerable<User>> GetAllUser()
        {
            return await _Db.Users.ToListAsync();
        }

        public User GetOneUser(string id)
        { return _Db.Users.FirstOrDefault(x => x.Uid == id); }

        public async Task<bool> UpdateUser(User user)
        {
            try
            {
                _Db.Entry(user).State = EntityState.Modified;
                await _Db.SaveChangesAsync();
                return true;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public void RemoveUser(string id)
        {
            const string deleted = "deleted";
            var customer = _Db.Users.SingleOrDefault(x => x.Uid == id);
            customer.Banned = false;
            customer.Email = deleted;
            customer.UserName = deleted;
            

            _Db.SaveChanges();
                
            

        }
        
        public async Task<ActionResult<User>> EditUserDetails(string id, string email, string UserName)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest("Not a valid model");
            }

            var existingUser = _Db.Users.Where(u => u.Uid == id)
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
