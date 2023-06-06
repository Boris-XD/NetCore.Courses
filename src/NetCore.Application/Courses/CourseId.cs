using MediatR;
using NetCore.Domain.Models;
using NetCore.Persistence;
using System.Threading.Tasks;
using System.Threading;

namespace NetCore.Application.Courses
{
    public class CourseId
    {
        public class Command : IRequest<Course>
        {
            public int Id { get; set; }
        }

        public class Handler : IRequestHandler<Command, Course>
        {
            private readonly CourseDbContext _context;
            public Handler(CourseDbContext courseDbContext)
            {
                _context = courseDbContext;
            }

            public async Task<Course> Handle(Command request, CancellationToken cancellationToken)
            {
                var courses = await _context.Courses.FindAsync(request.Id);

                return courses;
            }
        }
    }
}
