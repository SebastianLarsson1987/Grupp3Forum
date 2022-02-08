﻿#region

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

        public ThreadService(grupp3forumContext db)
        {
            _db = db;
        }

        public async Task RemoveThreadAndMessages(int id)
        {
            //var resutl = _db.NewThreads.Include(x => x.Messages.Where(x=>x.ThreadId==id)).SingleOrDefault(x => x.Id == id);
            var threadResult = _db.NewThreads.SingleOrDefault(x => x.Id == id);

            var messagesResult = _db.Messages.Where(x => x.ThreadId == id);

            _db.NewThreads.Remove(threadResult);
            foreach (var item in messagesResult)
            {
                _db.Messages.Remove(item);
            }

            await _db.SaveChangesAsync();

        }

        public async Task RemoveSingleMessage(int id)
        {
            var result = await _db.Messages.SingleOrDefaultAsync(x => x.Id == id);
        }

        public async Task<IEnumerable<Category>> GetAllCategories()
        {
            return await _db.Categories.ToListAsync();

        }

        public async Task<IEnumerable<Category>> GetAllCategoriesAndThreads()
        {
            var result = await _db.Categories.Include(x => x.NewThreads).ThenInclude(x => x.Messages).ToListAsync();
            //var result = _db.Categories.Include(x => x.NewThreads);
            return result;
        }

        public async Task<IEnumerable<Message>> GetAllMessagesFromThread(int id)
        {
            var result = await _db.Messages.Where(x => x.ThreadId == id).ToListAsync();
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

        public async Task<IEnumerable<NewThread>> GetThreadsBySearchString(string input)
        {
            return await _db.NewThreads.Where(x => x.Topic.Contains(input)).ToListAsync();
        }
    }
}