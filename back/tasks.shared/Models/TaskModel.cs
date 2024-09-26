using System.ComponentModel.DataAnnotations;
using tasks.shared.Enums;

namespace tasks.shared.Models
{
    public class TaskModel
    {
        [Key]
        public int ID { get; set; }
        public string Titulo { get; set; }
        public string Descricao { get; set; }
        public DateTime Data { get; set; }
        // Utilizando Enumerador para Status
        public EnumtasksStatus Status { get; set; } = EnumtasksStatus.Pendente;
    }
}
