namespace tasks.shared.Models
{
    public class Pagination<T>
    {
        public Result<List<T>> Data { get; set; }
        public int totalElement { get; set; }
        public int totalPages { get; set; }
        public int size { get; set; }
        public int number { get; set; }

    }
}
