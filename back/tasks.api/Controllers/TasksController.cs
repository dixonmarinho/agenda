using Microsoft.AspNetCore.Mvc;
using tasks.shared.Interfaces;
using tasks.shared.Models;

namespace tasks.api.Controllers
{
    [ApiController]
    [Route("[controller]")]

    public class TasksController : Controller
    {
        private readonly IServiceBase<TaskModel, TaskModelDTO> service;

        public TasksController(IServiceBase<TaskModel, TaskModelDTO> service)
        {
            this.service = service;
        }


        [HttpPost]
        public async Task<IActionResult> Post([FromBody] TaskModelDTO sender)
        {
            var response = await service.CreateAsync(sender);
            return Ok(response);
        }

        [HttpPut]
        public async Task<IActionResult> Put([FromBody] TaskModelDTO sender)
        {
            var response = await service.UpdateAsync(sender);
            return Ok(response);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            var response = await service.DeleteAsync(id);
            return Ok(response);
        }


        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var response = await service.GetAsync(id);
            return Ok(response);
        }


        [HttpGet("List")]
        public async Task<IActionResult> GetPaginationAsync([FromQuery] int page, [FromQuery] int pageSize)
        {
            var response = await service.GetPaginationAsync(page, pageSize);
            return Ok(response);
        }


    }
}
