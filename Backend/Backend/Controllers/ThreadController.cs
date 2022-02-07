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

        public ThreadController(IThreadService threadService)
        {
            _threadService = threadService as ThreadService;
            _db = new grupp3forumContext();
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
            
            _db.Messages.Add(newMessage);
            await _db.SaveChangesAsync();
            return newMessage;
        }
        [HttpDelete("RemoveThread")]
        public void RemoveThread(int id)
        {
            _threadService.RemoveThreadAndMessages(id);
        }
        [HttpGet("GetAllCategories")]
        public IEnumerable<Category> GetAllCategories()
        {
            var result = _threadService.GetAllCategories().ToList();
            return result;
        }
        [HttpGet("GetAllCategoriesAndThreads")]
        public IEnumerable<Category> GetAllCategoriesAndThreds()
        {
            var result = _threadService.GetAllCategoriesAndThreads();
            return result;
        }
        [HttpGet("GetAllMessagesFromThread")]
        public IEnumerable<Message> GetAllMessagesFromThread(int id)
        {
            var result = _threadService.GetAllMessagesFromThread(id);
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
            var result = _threadService.GetThreadsBySearchString(input);
            return result;
        }

        [HttpGet("GetThreadsByUserId")]
        public async Task<IEnumerable<NewThread>> GetThreadsByUserId(string id)
        {
            var result = _threadService.GetThreadsByUserId(id);
            return await result;
        }
        [HttpPut("BlockThread")]
        public void BlockThread(int id)
        {
            _threadService.BlockThread(id);
        }
    }
}
