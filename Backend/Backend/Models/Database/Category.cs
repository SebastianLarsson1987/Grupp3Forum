using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Models.Database
{
    public partial class Category
    {
        public Category()
        {
            NewThreads = new HashSet<NewThread>();
            
        }

        public int Id { get; set; }
        public string CategoryName { get; set; }

        public virtual ICollection<NewThread> NewThreads { get; set; }
       
    }
}
