using Backend.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend.Models.Database;
using Microsoft.EntityFrameworkCore;

namespace Backend.Services
namespace BackEnd.Services
{
    public class UserService : IUserService
    public class UserService
    {
        private readonly grupp3forumContext _Db;

        public UserService()
        {
            _Db = new grupp3forumContext();
        }

        public async Task<IEnumerable<User>> GetAllUser()
        public IEnumerable<User> GetAllUser()
        {
            return await _Db.Users.ToListAsync();
            return _Db.Users.Where(x => x.UserName == "Larzzons");
        }

        public User GetOneUser(int id)
        public async Task<bool> UpdateUser(User user)
        {
            try
            {
                _Db.Entry(user).State = EntityState.Modified;
                await _Db.SaveChangesAsync();
                return true;
            return _Db.Users.FirstOrDefault(x => x.Id == id);
        }
            catch (Exception e)
        public void RemoveUser(string email)
        {
            const string deleted = "deleted";
            var customer = _Db.Users.SingleOrDefault(x => x.Email == email);
            customer.Banned = false;
            customer.Email = deleted;
            customer.UserName = deleted;

            _Db.SaveChanges();
                Console.WriteLine(e);
                throw;
            }
        }
        
    }
}
