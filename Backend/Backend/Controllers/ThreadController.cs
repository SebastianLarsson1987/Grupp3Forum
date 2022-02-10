using Backend.Models.Database;
using Backend.Models.ViewModels;
using Backend.Services;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ThreadController : ControllerBase
    {
        private readonly ThreadService _threadService;
        private readonly grupp3forumContext _db;

        public ThreadController(IThreadService threadService, grupp3forumContext db)
        {
            _threadService = threadService as ThreadService;
            _db = db;
        }

        [HttpPost("CreateThread")]
        public async Task<NewThread> CreateThread(CreateThreadViewModel model)
        {
            var newThread = new NewThread()
            {
                Topic = model.Topic,
                Text = model.Content,
                CreateadAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                UserUid = model.UserId,
                CategoryId = model.CategoryId


            };
            _db.NewThreads.Add(newThread);
            await _db.SaveChangesAsync();

            var newMessage = new Message()
            {
                Text = model.Content,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                ThreadId = newThread.Id,
                UserUid = model.UserId,
                IsReported = false,
                IsDeleated = false
            };

            _db.Messages.Add(newMessage);
            await _db.SaveChangesAsync();
            return newThread;
        }
        [HttpPost("WriteMessage")]
        public async Task<Message> WriteMessageInThread(string text, int threadId, string userId)
        {
            var newMessage = new Message()
            {
                Text = text,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                ThreadId = threadId,
                UserUid = userId,
                IsDeleated = false,
                IsReported = false

            };

            await _db.Messages.AddAsync(newMessage);
            await _db.SaveChangesAsync();
            return newMessage;
        }
        [HttpDelete("RemoveThread")]
        public async void RemoveThread(int id)
        {
            await _threadService.RemoveThreadAndMessages(id);
        }
        [HttpGet("GetAllCategories")]
        public async Task<IEnumerable<Category>> GetAllCategories()
        {
            var result = await _threadService.GetAllCategories();
            return result;
        }
        [HttpGet("GetAllCategoriesAndThreads")]
        public async Task<IEnumerable<Category>> GetAllCategoriesAndThreds()
        {
            return await _threadService.GetAllCategoriesAndThreads();

        }
        [HttpGet("GetAllMessagesFromThread")]
        public async Task<IEnumerable<Message>> GetAllMessagesFromThread(int id)
        {
            var result = await _threadService.GetAllMessagesFromThread(id);
            return result;
        }

        [HttpGet("GetCategoryPerId")]
        public async Task<IEnumerable<Category>> GetCategoryPerId(int id)
        {
            var result = _threadService.GetCategoryAndThreadsPerCategoryId(id);
            return await result;
        }

        [HttpGet("GetMessagesAndThreadById")]
        public async Task<IEnumerable<NewThread>> GetMessagesAndThreadById(int id)
        {
            var result = _threadService.GetMessagesAndThreadById(id);
            return await result;
        }
        [HttpGet("GetThreadsBySearch")]
        public async Task<IEnumerable<NewThread>> GetThreadsBySearch(string input)
        {
            var result = await _threadService.GetThreadsBySearchString(input);
            return result;
        }

        [HttpGet("GetThreadsByUserId")]
        public async Task<IEnumerable<NewThread>> GetThreadsByUserId(string id)
        {
            return await _threadService.GetThreadsByUserId(id);
        }
        [HttpPut("BlockThread")]
        public void BlockThread(int id)
        {
            _threadService.BlockThread(id);
        }
    }
}
