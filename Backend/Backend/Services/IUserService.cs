
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
        Task<IEnumerable<User>> GetOneUser(string id);
        Task RemoveUser(string id, grupp3forumContext ctx);
        Task<bool> UpdateUser(User user);
    }
}
