using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend.Models.Database;
using Backend.Services;
using Microsoft.AspNetCore.Cors;
using Backend.Models.ViewModels;
using Microsoft.Extensions.Logging;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    public class MessageController : ControllerBase
    {
        private readonly MessageService _messageService;
        private readonly grupp3forumContext _db;
        

        public MessageController(grupp3forumContext ctx)
        {
            _db = new grupp3forumContext();
            _messageService = new MessageService(ctx);
        }

        [HttpDelete("DeleteMessage")]
        public async Task<ActionResult<Message>> DeleteMessage(int id)
        {
            return await _messageService.DeleteMessage(id);
        }

        [HttpGet("GetUserMessages/{id}")]
        public async Task<IEnumerable<Message>> GetUserMessages(string id)
        {




            return await _messageService.GetUserMessages(id);
        }

        [HttpPut("EditUserMessage/{id}")]
        public async Task<ActionResult<Message>> EditUserMessage(int id, string message)
        {
            return await _messageService.EditMessage(id, message);
        }
        [HttpPut("ReportMessage")]
        public void ReportMessage(int id)
        {
            _messageService.ReportMessage(id);
        }
        [HttpPost("DeleteAndRepportMessage")]
        public void DeleteAndReportMessage([FromBody]DeleteAndReportMessageViewModel model)
        {
            var newDeletedAndReportedMessage = new ReportedMessage()
            {
                Uid = model.UserUid,
                Email = _messageService.FindEmailFromUser(model.UserUid),
                DelatedAt = DateTime.Now,
                ThreadId = model.ThreadId,
                Text = model.Text,
            };


            
            _db.ReportedMessages.Add(newDeletedAndReportedMessage);
            _db.SaveChangesAsync();
            _messageService.DeleteMessage(model.Id);

            
        }
        
        [HttpPut("SetMessageAsDeleted")]
        public void SetMessageAsDeleted(int id)
        {
            _messageService.SetMessageToDeleted(id);
        }

        [HttpPut("SetMessageToNotReported")]
        public void SetMessageToNotReported(int id)
        {
            _messageService.SetMessageToNotReported(id);
        }


    }
}
