using System;
using System.Collections;
using System.Collections.Generic;

namespace NetCore.Domain.Models
{
    public class Course
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Description { get; set; }
        public DateTime? DatePublish { get; set; }
        public Price Price { get; set; }
        public ICollection<Comment> Comments { get; set; }
        public ICollection<CourseInstructor> InstructorLink { get; set; }
    }
}
