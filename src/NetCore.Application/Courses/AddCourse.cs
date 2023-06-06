using MediatR;
using Microsoft.AspNetCore.Server.IIS.Core;
using NetCore.Domain.Models;
using NetCore.Persistence;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace NetCore.Application.Courses
{
    public class AddCourse
    {
        public class Command : IRequest<Course>
        {
            public string Titulo { get; set; }
            public string Description { get; set; }
            public DateTime? DatePublish { get; set; }

        }

        public class Handler : IRequestHandler<Command, Course>
        {
            private readonly CourseDbContext _courseDbContext;
            public Handler(CourseDbContext courseDbContext)
            {
                _courseDbContext = courseDbContext;
            }

            public async Task<Course> Handle(Command request, CancellationToken cancellationToken)
            {
                var course = new Course()
                {
                    Titulo = request.Titulo,
                    Description = request.Description,
                    DatePublish = request.DatePublish
                };
                _courseDbContext.Courses.Add(course);
                await _courseDbContext.SaveChangesAsync();

                return course;
            }
        }
    }
}
