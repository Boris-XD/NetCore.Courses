using System;
using System.Collections.Generic;
using System.Text;

namespace NetCore.Domain.Models
{
    public class CourseInstructor
    {
        public int CourseId { get; set; }
        public int InstructorId { get; set; }
        public Course Course { get; set; }
        public Instructor Instructor { get; set; }
    }
}
