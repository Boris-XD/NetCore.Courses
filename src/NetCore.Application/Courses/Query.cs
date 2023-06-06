using MediatR;
using Microsoft.EntityFrameworkCore;
using NetCore.Domain.Models;
using NetCore.Persistence;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace NetCore.Application.Courses
{
    public class Query
    {
        public class Command : IRequest<List<Course>>
        {

        }

        public class Handler : IRequestHandler<Command, List<Course>>
        {
            private readonly CourseDbContext _context;
            public Handler(CourseDbContext courseDbContext)
            {
                _context = courseDbContext;
            }

            public async Task<List<Course>> Handle(Command request, CancellationToken cancellationToken)
            {
                var courses = await _context.Courses.ToListAsync();

                return courses;
            }
        }
    }
}
