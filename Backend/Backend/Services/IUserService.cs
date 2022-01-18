
using Backend.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Services
{
    public interface IUserService
    {
        IEnumerable<User> GetAllUser();
        User GetOneUser(int id);
        void RemoveUser(string email);
    }
}
