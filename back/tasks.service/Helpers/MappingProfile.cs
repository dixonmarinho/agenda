using AutoMapper;
using tasks.shared.Models;

namespace tasks.service.Helpers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<TaskModel, TaskModelDTO>().ReverseMap(); // Mapeamento básico
        }
    }
}
