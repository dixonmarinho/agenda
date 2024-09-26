using Newtonsoft.Json;
using tasks.shared.Enums;
using tasks.shared.Interfaces;
using tasks.shared.Models;
using tasks.test.Base;
using Xunit.Abstractions;

namespace tasks.test
{
    public class Task_Service_Test : Base_Service_Test<Program>
    {
        private readonly IServiceBase<TaskModel, TaskModelDTO> service;

        public Task_Service_Test(ITestOutputHelper outputWriter) : base(outputWriter)
        {
            service = GetService<IServiceBase<TaskModel, TaskModelDTO>>();
        }


        /// <summary>
        /// Cria um Texto Randomico
        /// </summary>
        /// <returns></returns>
        private string GetRandonText()
        {
            return Guid.NewGuid().ToString().Substring(0, 10);
        }


        /// <summary>
        /// Cria varias tarefas aleatórias
        /// </summary>
        /// <param name="qde"></param>
        [Theory]
        [InlineData(10)]
        public async Task CreateAsyncTest(int qde)
        {
            EnumtasksStatus status;
            for (int i = 0; i < qde; i++)
            {
                if (i % 2 == 0)
                    status = EnumtasksStatus.Pendente;
                else
                    status = EnumtasksStatus.Concluido;

                var task = new TaskModelDTO
                {
                    Titulo = "TAREFA - " + GetRandonText(),
                    Descricao = "TAREFA AGENDADA - " + GetRandonText(),
                    Data = DateTime.Now.AddMinutes(30),
                    Status = status
                };
                var response = await service.CreateAsync(task);
                Assert.True(response.success == true, response.xmessage);
            }
        }

        /// <summary>
        /// Atualiza Registro
        /// </summary>
        /// <returns></returns>

        [Fact]
        public async Task UpdateAsync()
        {
            // Pega um Registro
            var response = await service.GetAllAsync();
            var respondeRecord = response.data.FirstOrDefault();
            if (respondeRecord != null)
            {
                // Atualiza o Registro
                respondeRecord.Titulo = "TAREFA - " + GetRandonText();
                respondeRecord.Descricao = "TAREFA AGENDADA - " + GetRandonText();
                respondeRecord.Data = DateTime.Now.AddMinutes(30);
                respondeRecord.Status = EnumtasksStatus.Concluido;

                // Atualiza o Registro
                var responseUpdate = await service.UpdateAsync(respondeRecord);
                Assert.True(responseUpdate.success == true, responseUpdate.xmessage);
            }
        }

        /// <summary>
        /// Exclui Registro
        /// </summary>
        /// <returns></returns>
        [Fact]
        public async Task DeleteAsync()
        {
            var response = await service.GetAllAsync();
            var respondeRecord = response.data.FirstOrDefault();
            var responseDelete = await service.DeleteAsync(respondeRecord.Id);
            Assert.True(responseDelete.success == true, responseDelete.xmessage);
        }

        /// <summary>
        /// Paginacao
        /// </summary>
        /// <returns></returns>
        [Theory]
        [InlineData(1, 3)]
        [InlineData(2, 3)]
        public async Task Pagination(int page, int pageSize)
        {
            var response = await service.GetPaginationAsync(page, pageSize);
            var json = JsonConvert.SerializeObject(response.data);
            this.Log(json);
            Assert.True(response.success == true, response.xmessage);
        }
    }
}
