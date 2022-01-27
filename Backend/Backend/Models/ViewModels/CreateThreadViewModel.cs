using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Backend.Models.ViewModels
{
    public class CreateThreadViewModel
    {
        public string Topic { get; set; }
        public string Content { get; set; }
        public string UserId { get; set; }
        public int CategoryId { get; set; }
    }
}
