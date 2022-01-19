using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend.Models.Database;
using Backend.Services;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    public class MessageController : ControllerBase
    {
        private readonly MessageService _messageService;

        public MessageController()
        {
            _messageService = new MessageService();
        }

        [HttpDelete]
        public async Task<ActionResult<Message>> DeleteMessage(int id)
        {
            return await _messageService.DeleteMessage(id);
        }

        [HttpGet("GetUserMessages")]
        public async Task<IEnumerable<Message>> GetUserMessages(int id)
        {
            return await _messageService.GetUserMessages(id);
        }
    }
}
