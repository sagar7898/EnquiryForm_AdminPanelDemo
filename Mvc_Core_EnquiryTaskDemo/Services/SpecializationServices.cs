using Mvc_Core_EnquiryTaskDemo.Models;
using Mvc_Core_EnquiryTaskDemo.Services;

namespace Mvc_Core_EnquiryTaskDemo.Services
{
    public class SpecializationServices
    {
        Repository<TblSpecialization> specializationrepo;

        public SpecializationServices()
        {
            specializationrepo = new Repository<TblSpecialization>();
        }

        public List<TblSpecialization> GetSpecialization()
        {
            return specializationrepo.GetAll();
        }

        public TblSpecialization GetSpecialization(int id)
        {
            return specializationrepo.GetById(id);
        }
    }
}
