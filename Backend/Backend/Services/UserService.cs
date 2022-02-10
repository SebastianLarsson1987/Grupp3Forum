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

        private readonly grupp3forumContext _db;

        public UserService(grupp3forumContext db)
        {
            _db = db;
        }

        public async Task<IEnumerable<User>> GetAllUser()
        {
            return await _db.Users.ToListAsync();
        }

        public async Task<IEnumerable<User>> GetOneUser(string id)
        { 
            return await _db.Users.Where(x => x.Uid == id).ToListAsync(); 
            }

        public async Task<bool> UpdateUser(User user)
        {
            try
            {
                _db.Entry(user).State = EntityState.Modified;
                await _db.SaveChangesAsync();
                return true;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public async Task RemoveUser(string id)
        {
            const string deleted = "deleted";
            var userToDelete = await _db.Users.FindAsync(id);
            userToDelete.FirstName = deleted;
            userToDelete.Banned = false;
            userToDelete.UserName = deleted;
            await _db.DeletedUsers.AddAsync(new DeletedUser { UserUid = userToDelete.Uid, DeletionDate = DateTime.Now });

            await _db.SaveChangesAsync();

        }

        public async Task<ActionResult<User>> EditUserDetails(string id, string email, string UserName)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest("Not a valid model");
            }

            var existingUser = _db.Users.Where(u => u.Uid == id)
                .FirstOrDefault();

            if (existingUser != null)
            {
                existingUser.Email = email;
                existingUser.UserName = UserName;

                await _db.SaveChangesAsync();
            }
            else
            {
                return NotFound();
            }

            return Ok();


        }

        public async Task<IEnumerable<bool>> CheckUserStatus(string email)
        {
            return await _db.Users.Where(u => u.Email == email).Select(u => u.Banned).ToListAsync();
        }

        public void SetUserAsBanned(string id)
        {
            var user = _db.Users.FirstOrDefault(x => x.Uid == id);
            user.Banned = true;
            _db.SaveChangesAsync();
            

        }
    }
}
