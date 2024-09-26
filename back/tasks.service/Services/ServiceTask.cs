﻿using AutoMapper;
using tasks.data.Data;
using tasks.shared;
using tasks.shared.Interfaces;
using tasks.shared.Models;

namespace tasks.service.Services
{
    public class ServiceTask : IServiceBase<TaskModel, TaskModelDTO>
    {
        private readonly IUnitOfWork<AppDataContext> db;
        private readonly IMapper map;
        private readonly IRepository<TaskModel> repository;

        public ServiceTask(IUnitOfWork<AppDataContext> db, IMapper map)
        {
            this.db = db;
            this.map = map;
            this.repository = db.GetRepository<TaskModel>();
        }

        public async Task<Result<bool>> CreateAsync(TaskModelDTO sender)
        {
            var response = await repository.AddAsync(map.Map<TaskModel>(sender));
            return Result<bool>.Success();
        }

        public async Task<Result<bool>> DeleteAsync(int id)
        {
            try
            {
                var responseData = await repository.GetByIdAsync(id);
                var response = repository.DeleteAsync(responseData);
                return Result<bool>.Success();
            }
            catch (Exception e)
            {
                return Result<bool>.Fail(e);
            }
        }

        public Task<Result<TaskModelDTO>> GetAsync(TaskModel id)
        {
            throw new NotImplementedException();
        }

        public async Task<Result<List<TaskModelDTO>>> GetAllAsync()
        {
            var response = await repository.GetAllAsync();
            return Result<List<TaskModelDTO>>.Success(map.Map<List<TaskModelDTO>>(response));
        }

        public async Task<Result<bool>> UpdateAsync(TaskModelDTO sender)
        {
            var repository = db.GetRepository<TaskModel>();
            var responseData = await repository.GetByIdAsync(sender.Id);
            map.Map(sender, responseData);
            var response = await repository.UpdateAsync(responseData);
            return Result<bool>.Success();
        }

        // Paginacao
        public async Task<Result<List<TaskModelDTO>>> GetPaginationAsync(int page, int pageSize = 10)
        {
            var response = await repository.GetPaginationAsync(page, pageSize);
            var mapData = map.Map<List<TaskModelDTO>>(response);
            return Result<List<TaskModelDTO>>.Success(mapData);
        }
    }
}
