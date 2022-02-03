using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

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
        public string UserUid { get; set; }
        public bool? IsReported { get; set; }
        public bool? IsDeleated { get; set; }
        [JsonIgnore]
        public virtual NewThread Thread { get; set; }
        [JsonIgnore]
        public virtual User UserU { get; set; }

        public virtual ICollection<MessageReply> MessageReplies { get; set; }
    }
}
