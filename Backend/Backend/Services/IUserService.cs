
using Backend.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Backend.Services
{
    public interface IUserService
    {
        Task<IEnumerable<User>> GetAllUser();
        User GetOneUser(int id);
        User GetOneUser(string email);
        Task<User> GetOneUserByUId(string uid);
        void RemoveUser(string email);
        Task<bool> UpdateUser(User user);
    }
}
