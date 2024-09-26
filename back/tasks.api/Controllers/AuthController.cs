using Microsoft.AspNetCore.Mvc;
using tasks.shared.Interfaces;
using tasks.shared.Models;

namespace tasks.api.Controllers
{
    public class AuthController : Controller
    {
        public AuthController(IServiceBase<TaskModel, TaskModelDTO> service)
        {

        }
    }
}
