using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend.Models.Database;
using Microsoft.EntityFrameworkCore;

namespace Backend.Services
{
    public class UserService
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

    }
}
