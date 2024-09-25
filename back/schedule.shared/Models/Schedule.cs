using schedule.shared.Enums;

namespace schedule.shared.Models
{
    public class Schedule
    {
        public int ID { get; set; }
        public string Titulo { get; set; }
        public string Descricao { get; set; }
        public string Data { get; set; }
        // Utilizando Enumador para Status
        public EnumScheduleStatus Status { get; set; } = EnumScheduleStatus.Pendente;
    }
}
