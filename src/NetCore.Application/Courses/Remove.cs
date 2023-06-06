using MediatR;
using NetCore.Persistence;
using System.Threading;
using System.Threading.Tasks;

namespace NetCore.Application.Courses
{
    public class Remove : IRequest
    {
        public class Command : IRequest
        {
            public int Id { get; set; }
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

                if (course == null)
                    throw new System.Exception("No existe el registro");


                _courseDbContext.Courses.Remove(course);
                var result = await _courseDbContext.SaveChangesAsync();

                if (result >  0)
                {
                    return Unit.Value;
                }

                throw new System.Exception("No se puedo eliminar el registro");
            }
        }
    }
}
