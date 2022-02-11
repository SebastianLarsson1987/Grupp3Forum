using Backend.Models.Database;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Backend.Services
{
    public class UserService : ControllerBase, IUserService
    {

        private readonly grupp3forumContext _db;
        private readonly ILogger<UserService> _logger;

        public UserService(grupp3forumContext db, ILogger<UserService> logger)
        {
            _db = db;
            _logger = logger;
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

        public async Task RemoveUser(string id, grupp3forumContext _ctx)
        {
            const string deleted = "deleted";
            var userToDelete = _ctx.Users.Find(id);
            userToDelete.FirstName = deleted;
            userToDelete.Banned = false;
            userToDelete.UserName = deleted;
            await _ctx.SaveChangesAsync();
            _logger.LogInformation($"Updated entry");
            var deletedUser = await _ctx.DeletedUsers.AddAsync(new DeletedUser { UserUid = userToDelete.Uid, DeletionDate = DateTime.Now });
            _logger.LogInformation($"Added {deletedUser.Entity.UserUid} for deletion");

            await _ctx.SaveChangesAsync();

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
