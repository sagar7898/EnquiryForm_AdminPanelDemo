namespace Mvc_Core_EnquiryTaskDemo.Services
{
    public interface IRepository<TEntity> where TEntity:class
    {
        void Create(TEntity entity);
        void Update(TEntity entity);
        List<TEntity> GetAll();
        TEntity GetById(int id);
        void Delete(int id);
    }
}
