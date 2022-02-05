using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend.Models.Database;
using Backend.Services;
using Microsoft.AspNetCore.Cors;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    public class MessageController : ControllerBase
    {
        private readonly MessageService _messageService;

        public MessageController(grupp3forumContext ctx)
        {
            _messageService = new MessageService(ctx);
        }

        [HttpDelete]
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
    }
}
