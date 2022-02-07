﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend.Models.Database;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend.Services
{
    public class MessageService : ControllerBase
    {
        private readonly grupp3forumContext _Db;

        public MessageService()
        {
            _Db = new grupp3forumContext();
        }

        public async Task<ActionResult<Message>> DeleteMessage(int id)
        {
            var message = _Db.Messages.FirstOrDefault(x => x.Id == id);
            _Db.Messages.Remove(message);
            await _Db.SaveChangesAsync();

            return NoContent();

        }

        public async Task<IEnumerable<Message>> GetUserMessages(string id)
        {
            
            var result = await _Db.Messages.Where(message => message.UserUid == id)
                .Where(message => message.IsDeleated == false).ToListAsync();
            return result;
        }

        public async Task<ActionResult<Message>> EditMessage(int id, string text)
        {
            var msg = new Message() { Id = id, Text = text };
            _Db.Messages.Attach(msg);
            _Db.Entry(msg).Property(x => x.Text).IsModified = true;
            if (_Db.Entry(msg).Property(x=> x.Text).IsModified)
            {
                msg.UpdatedAt = DateTime.Now;
            }
            await _Db.SaveChangesAsync();

            return msg;

            
        }
        public void ReportMessage(int id)
        {
            var message = _Db.Messages.FirstOrDefault(x => x.Id == id);
            message.IsReported = true;
            _Db.SaveChangesAsync();
           
        }

        public void SetMessageToDeleted(int id)
        {
            var message = _Db.Messages.FirstOrDefault(x => x.Id == id);
            message.IsDeleated = true;
            _Db.SaveChangesAsync();
        }

        public void SetMessageToNotReported(int id)
        {
            var message = _Db.Messages.FirstOrDefault(x => x.Id == id);
            message.IsReported = false;
            _Db.SaveChangesAsync();
        }
    }
}
