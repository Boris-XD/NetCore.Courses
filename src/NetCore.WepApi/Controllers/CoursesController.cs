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




    }
}
