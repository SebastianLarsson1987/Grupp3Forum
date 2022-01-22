using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Models.Database
{
    public partial class User
    {
        public User()
        {
            MessageReplies = new HashSet<MessageReply>();
            Messages = new HashSet<Message>();
            NewThreads = new HashSet<NewThread>();
        }

        public int Id { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public bool Banned { get; set; }
        public int RoleId { get; set; }

        /// <summary>
        /// Unique user id from Firebase
        /// </summary>
        public string UniqueId { get; set; }

        public virtual Role Role { get; set; }
        public virtual ICollection<MessageReply> MessageReplies { get; set; }
        public virtual ICollection<Message> Messages { get; set; }
        public virtual ICollection<NewThread> NewThreads { get; set; }
    }
}
