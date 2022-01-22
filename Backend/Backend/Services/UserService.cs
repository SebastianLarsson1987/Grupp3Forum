using Backend.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Backend.Services
{
    public class UserService : IUserService
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

        public User GetOneUser(string email)
        { return _Db.Users.FirstOrDefault(x => x.Email == email); }

        public User GetOneUser(int id)
        {
            return _Db.Users.FirstOrDefault(u => u.Id == id);
        }

        public async Task<User> GetOneUserByUId(string uid)
        {
            return await _Db.Users.SingleAsync(u => u.UniqueId == uid);
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

        public void RemoveUser(string email)
        {
            const string deleted = "deleted";
            var customer = _Db.Users.SingleOrDefault(x => x.Email == email);
            if (customer!=null)
            {
                customer.Banned = false;
                customer.Email = deleted;
                customer.UserName = deleted;
            }

            _Db.SaveChanges();
                
            }

    }
}
