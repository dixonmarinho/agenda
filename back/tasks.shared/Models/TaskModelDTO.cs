using tasks.shared.Enums;

namespace tasks.shared.Models
{
    public class TaskModelDTO
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Descricao { get; set; }
        public DateTime Data { get; set; }
        public EnumtasksStatus Status { get; set; } = EnumtasksStatus.Pendente;
    }
}
