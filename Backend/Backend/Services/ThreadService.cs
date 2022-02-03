#region

using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend.Models.Database;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

#endregion

namespace Backend.Services
{
    public class ThreadService : IThreadService
    {
        private readonly grupp3forumContext _db;

        public ThreadService()
        {
            _db = new grupp3forumContext();
        }

        public void RemoveThreadAndMessages(int id)
        {
            //var resutl = _db.NewThreads.Include(x => x.Messages.Where(x=>x.ThreadId==id)).SingleOrDefault(x => x.Id == id);
            var threadResult = _db.NewThreads.SingleOrDefault(x => x.Id == id);

            var messagesResult = _db.Messages.Where(x => x.ThreadId == id);

            _db.NewThreads.Remove(threadResult);
            foreach (var item in messagesResult)
            {
                _db.Messages.Remove(item);
            }

            _db.SaveChanges();
        }

        public void RemoveSingleMessage(int id)
        {
            var result = _db.Messages.SingleOrDefault(x => x.Id == id);
        }

        public IEnumerable<Category> GetAllCategories()
        {
            var result = _db.Categories.AsEnumerable();
            return result;
        }

        public IEnumerable<Category> GetAllCategoriesAndThreads()
        {
            var result = _db.Categories.Include(x => x.NewThreads).ThenInclude(x => x.Messages);
            //var result = _db.Categories.Include(x => x.NewThreads);
            return result;
        }

        public IEnumerable<Message> GetAllMessagesFromThread(int id)
        {
            var result = _db.Messages.Where(x => x.ThreadId == id).AsEnumerable();
            return result;
        }

        public async Task<IEnumerable<Category>> GetCategoryAndThreadsPerCategoryId(int id)
        {

            var result = await _db.Categories.Where(x => x.Id == id)
                .Include(threads => threads.NewThreads).ToListAsync();
            return result;
        }

        public async Task<IEnumerable<NewThread>> GetMessagesAndThreadById(int id)
        {
            var result = _db.NewThreads.Where(x => x.Id == id)
                .Include(thread => thread.Messages.Where(x => x.IsDeleated == false && x.IsReported == false))
                .ThenInclude(message => message.UserU)
                .AsNoTracking()
                .ToListAsync();
                
              
            return await result;
        }

        public async Task<IEnumerable<NewThread>> GetThreadsByUserId(string id)
        {
            var result = await _db.NewThreads.Where(u => u.UserUid == id).ToListAsync();
            return result;
        }
        
        public IEnumerable<NewThread>GetThreadsBySearchString(string input)
        {
            var result = _db.NewThreads.Where(x => x.Topic.Contains(input)).AsEnumerable();
            return result;

        }
    }
}