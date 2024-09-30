using tasks.shared.Models;

namespace tasks.shared.Interfaces
{
    public interface IServiceBase<X, T> where X : class where T : class
    {
        Task<Result<bool>> CreateAsync(T model);
        Task<Result<bool>> UpdateAsync(T model);
        Task<Result<bool>> DeleteAsync(int id);
        Task<Result<T>> GetAsync(int id);
        Task<Result<List<T>>> GetAllAsync();
        Task<Result<List<TaskModelDTO>>> GetPaginationAsync(int page, int pageSize);
    }
}
