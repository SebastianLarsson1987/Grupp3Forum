using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Backend.Models.ViewModels
{
    public class DeleteAndReportMessageViewModel
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public string UserUid { get; set; }
        public int ThreadId { get; set; }
        public string Email { get; set; }

    }
}