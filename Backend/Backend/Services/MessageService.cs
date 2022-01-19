using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend.Models.Database;
using Microsoft.AspNetCore.Mvc;

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
            var message = await _Db.Messages.FindAsync(id);
            _Db.Messages.Remove(message);
            await _Db.SaveChangesAsync();

            return NoContent();

        }
    }
}
