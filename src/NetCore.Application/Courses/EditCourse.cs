using MediatR;
using NetCore.Domain.Models;
using NetCore.Persistence;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using Microsoft.AspNetCore.Mvc;

namespace NetCore.Application.Courses
{
    public class EditCourse
    {
        public class Command : IRequest
        {
            public int Id { get; set; }
            public string Titulo { get; set; }
            public string Description { get; set; }
            public DateTime? DatePublish { get; set; }

        }

        public class Handler : IRequestHandler<Command>
        {
            private readonly CourseDbContext _courseDbContext;
            public Handler(CourseDbContext courseDbContext)
            {
                _courseDbContext = courseDbContext;
            }

            public async Task<Unit> Handle(Command request, CancellationToken cancellationToken)
            {
                var course = await _courseDbContext.Courses.FindAsync(request.Id);

                if(course != null)
                {
                    course.Description = request.Description ?? course.Description;
                    course.DatePublish = request.DatePublish ?? course.DatePublish;
                    course.Titulo = request.Titulo ?? course.Titulo;
                    var result = await _courseDbContext.SaveChangesAsync();

                    if (result > 0)
                        return Unit.Value;
                    else
                        throw new Exception("Problemas en el servidor");
                }

                throw new Exception("No existe el registro");
            }
        }
    }
}

