using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Models.Database
{
    public partial class ReportedMessage
    {
        public int Id { get; set; }
        public string Uid { get; set; }
        public string Email { get; set; }
        public DateTime DelatedAt { get; set; }
        public int ThreadId { get; set; }
        public string Text { get; set; }
    }
}
