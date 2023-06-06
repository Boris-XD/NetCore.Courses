using MediatR;
using Microsoft.AspNetCore.Mvc;
using NetCore.Application.Courses;
using NetCore.Domain.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace NetCore.WepApi.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class CoursesController : ControllerBase
    {
        private readonly IMediator _mediator;
        public CoursesController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet]
        public async Task<ActionResult<List<Course>>> Get()
        {
            return await _mediator.Send(new Query.Command());
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Course>> GetCourseById(int id)
        {
            return await _mediator.Send(new CourseId.Command{ Id = id });
        }

        [HttpPost]
        public async Task<ActionResult<Course>> SaveCourse([FromBody] AddCourse.Command course)
        {
            return await _mediator.Send(course);
        }

        [HttpPatch("{id}")]
        public async Task<ActionResult<Unit>> EditCourse(int id, [FromBody] EditCourse.Command course)
        {
            course.Id = id;
            return await _mediator.Send(course);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<Unit>> DeleteCourse(int id)
        {
            return await _mediator.Send(new Remove.Command { Id = id });
        }
    }
}
