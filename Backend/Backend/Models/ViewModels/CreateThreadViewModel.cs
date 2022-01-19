using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models.ViewModels
{
    public class CreateThreadViewModel
    {
        public string Topic { get; set; }
        public string Content { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        //public User User { get; set; }
        //public Category Category { get; set; }
        public int UserId { get; set; }
        public int CategoryId { get; set; }
    }
}
