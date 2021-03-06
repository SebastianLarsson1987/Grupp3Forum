using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

#nullable disable

namespace Backend.Models.Database
{
    public partial class NewThread
    {
        public NewThread()
        {
            Messages = new HashSet<Message>();
        }


        public int Id { get; set; }
        public string Topic { get; set; }
        public string Text { get; set; }
        public DateTime CreateadAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string UserUid { get; set; }
        public int CategoryId { get; set; }
        public bool Blocked { get; set; }

        [JsonIgnore]
        public virtual Category Category { get; set; }
        [JsonIgnore]
        public virtual User UserU { get; set; }

        public virtual ICollection<Message> Messages { get; set; }
    }
}
