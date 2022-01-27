using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Models.Database
{
    public partial class Message
    {
        public Message()
        {
            MessageReplies = new HashSet<MessageReply>();
        }

        public int Id { get; set; }
        public string Text { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public int ThreadId { get; set; }
        public int UserId { get; set; }

        public virtual ICollection<MessageReply> MessageReplies { get; set; }
    }
}
