
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
        Task<User> GetOneUser(string id);
        Task RemoveUser(string id);
        Task<bool> UpdateUser(User user);
    }
}
