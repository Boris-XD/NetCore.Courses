using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace NetCore.Domain.Models
{
    [Table("Comments")]
    public class Comment
    {
        [Key]
        public int Id { get; set; }
        public string Student { get; set; }
        public int Score { get; set; }
        [Column("Comment")]
        public string Comments { get; set; }
        public int CourseId { get; set; }
        public Course Course { get; set; }
    }
}
