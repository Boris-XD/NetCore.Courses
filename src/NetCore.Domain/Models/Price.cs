using System;
using System.Collections.Generic;
using System.Text;

namespace NetCore.Domain.Models
{
    public class Price
    {
        public int Id { get; set; }
        public decimal CurrentPrice { get; set; }
        public decimal Promocion { get; set; }
        public int CourseId { get; set; }
        public Course Course { get; set; }
    }
}
