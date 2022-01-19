using Backend.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Backend.Services
{
    public interface IThreadService
    {
        void RemoveThreadAndMessages(int id);
        void RemoveSingleMessage(int id);
        IEnumerable<Category> GetAllCategories();
        IEnumerable<Message> GetAllMessagesFromThread(int id);
    }
}
