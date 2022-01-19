﻿using Backend.Models.Database;
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
                UserId = model.UserId,
                CategoryId = model.CategoryId


            };

            _db.NewThreads.Add(newThread);
            await _db.SaveChangesAsync();
            return newThread;
        }
        [HttpPost("WriteMessage")]
        public async Task<Message> WriteMessageInThread(NewMessageViewModel model)
        {
            var newMessage = new Message()
            {
                Text = model.Text,
                CreatedAt = DateTime.Now,
                UpdatedAt = default,
                ThreadId = model.ThreadId,
                UserId = model.UserId

            };
            _db.Messages.Add(newMessage);
            await _db.SaveChangesAsync();
            return newMessage;
        }
        [HttpDelete("Remove Thread")]
        public void RemoveThread(int id)
        {
            _threadService.RemoveThreadAndMessages(id);
        }
        [HttpGet("GetAllCategories")]
        public IEnumerable<Category> GetAllCategories()
        {
            var result =_threadService.GetAllCategories();
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
    }
}