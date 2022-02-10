using Backend.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Backend.Services
{
    public interface IThreadService
    {
        Task RemoveThreadAndMessages(int id);
        Task RemoveSingleMessage(int id);
        Task<IEnumerable<Category>> GetAllCategories();
        Task<IEnumerable<Message>> GetAllMessagesFromThread(int id);
    }
}
