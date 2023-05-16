using System;
using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace NetCore.Domain.Models
{
    public class Instructor
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string Grade { get; set; }
        public byte[] Photo { get; set; }
        public ICollection<CourseInstructor> CourseLink { get; set; }
    }
}
