using System;
using System.Collections.Generic;

#nullable disable

namespace Backend.Models.Database
{
    public partial class DeletedUser
    {
        public string UserUid { get; set; }
        public DateTime DeletionDate { get; set; }
    }
}
