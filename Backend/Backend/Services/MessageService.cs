using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend.Models.Database;
using Backend.Models.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend.Services
{
    public class MessageService : ControllerBase
    {
        private readonly grupp3forumContext _db;

        public MessageService(grupp3forumContext db)
        {
            _db = db;
        }

        public async Task<ActionResult<Message>> DeleteMessage(int id)
        {
            var message = _db.Messages.FirstOrDefault(x => x.Id == id);
            _db.Messages.Remove(message);
            await _db.SaveChangesAsync();

            return NoContent();

        }

        public async Task<IEnumerable<Message>> GetUserMessages(string id)
        {
            
            var result = await _db.Messages.Where(message => message.UserUid == id)
                .Where(message => message.IsDeleated == false && message.IsReported==false).ToListAsync();
            return result;
        }

        public async Task<ActionResult<Message>> EditMessage(int id, string text)
        {
            var msg = new Message() { Id = id, Text = text };
            _db.Messages.Attach(msg);
            _db.Entry(msg).Property(x => x.Text).IsModified = true;
            if (_db.Entry(msg).Property(x => x.Text).IsModified)
            {
                msg.UpdatedAt = DateTime.Now;
            }
            await _db.SaveChangesAsync();

            return msg;


        }
        public void ReportMessage(int id)
        {
            var message = _db.Messages.FirstOrDefault(x => x.Id == id);
            message.IsReported = true;
            _db.SaveChangesAsync();
           
        }

        public void SetMessageToDeleted(int id)
        {
            var message = _db.Messages.FirstOrDefault(x => x.Id == id);
            message.IsDeleated = true;
            _db.SaveChangesAsync();
        }

        public void SetMessageToNotReported(int id)
        {
            var message = _db.Messages.FirstOrDefault(x => x.Id == id);
            message.IsReported = false;
            _db.SaveChangesAsync();
        }

        public async Task<Message> DeleteAndReportMessage(int id)
        {
            var message = _db.Messages.FirstOrDefault(x => x.Id == id);
           
            
            _db.Messages.Remove(message);
            await _db.SaveChangesAsync();

            return message;
        }
        public string FindEmailFromUser(string uid)
        {
            var result = _db.Users.FirstOrDefault(x => x.Uid == uid);
            var email = result.Email;
            return email;
        }
    }
}
