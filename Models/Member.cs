using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MessManagement.Models
{
    public class Member
    {
        public int CardNumber { get; set; }
        public string Name  { get; set; }
        public string RoomNumber { get; set; }
        public string Block { get; set; }
        public string Department { get; set; }
        public string PhoneNumber { get; set; }
        public string Picture { get; set; }
    }
}