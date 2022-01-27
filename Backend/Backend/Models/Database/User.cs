using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Models.Database
{
    public partial class User
    {
        public User()
        {
            NewThreads = new HashSet<NewThread>();
        }

        public int Id { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public bool Banned { get; set; }
        public int RoleId { get; set; }
        public string Uid { get; set; }

        public virtual Role Role { get; set; }
        public virtual ICollection<NewThread> NewThreads { get; set; }
    }
}
