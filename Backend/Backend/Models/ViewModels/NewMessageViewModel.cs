using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Backend.Models.ViewModels
{
    public class NewMessageViewModel
    {
        public string  Text{ get; set; }
        public int ThreadId { get; set; }
        public int UserId { get; set; }

    }
}
