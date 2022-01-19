using Backend.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Services
{
    public class UserService : IUserService
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
        
    }
}
