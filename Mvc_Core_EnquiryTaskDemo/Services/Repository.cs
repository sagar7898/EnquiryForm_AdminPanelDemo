using Mvc_Core_EnquiryTaskDemo.Models;
namespace Mvc_Core_EnquiryTaskDemo.Services
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
       public DbMvcCoreEnquiryTaskContext db;
        public void Create(TEntity entity)
        {
            db.Set<TEntity>().Add(entity);
            db.SaveChanges();
        }

        public void Delete(int id)
        {
            TEntity entity = GetById(id);
            db.Set<TEntity>().Remove(entity);
            db.SaveChanges();
        }

        public List<TEntity> GetAll()
        {
            return db.Set<TEntity>().ToList();
        }

        public TEntity GetById(int id)
        {
            return db.Set<TEntity>().Find(id);
        }

        public void Update(TEntity entity)
        {
            db.Entry<TEntity>(entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
            db.SaveChanges();
        }
    }
}
