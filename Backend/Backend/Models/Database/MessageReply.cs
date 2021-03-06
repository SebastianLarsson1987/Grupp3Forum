using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Models.Database
{
    public partial class MessageReply
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public int MessageId { get; set; }
        public string UserUid { get; set; }

        public virtual Message Message { get; set; }
        public virtual User UserU { get; set; }
    }
}
