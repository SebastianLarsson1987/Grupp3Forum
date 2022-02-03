using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Models.Database
{
    public partial class NewThread
    {
        public int Id { get; set; }
        public string Topic { get; set; }
        public string Text { get; set; }
        public DateTime CreateadAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string UserUid { get; set; }
        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }
        public virtual User UserU { get; set; }
    }
}
