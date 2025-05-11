using Mvc_Core_EnquiryTaskDemo.Models;
using Mvc_Core_EnquiryTaskDemo.Services;

namespace Mvc_Core_EnquiryTaskDemo.Services
{
    public class QualificationSevices
    {
        Repository<TblQualification> qualificationrepo;

        public QualificationSevices()
        {
            qualificationrepo = new Repository<TblQualification>();
        }

        public List<TblQualification> GetQualifications()
        {
            return qualificationrepo.GetAll();
        }

        public TblQualification GetQualification(int id)
        {
            return qualificationrepo.GetById(id);
        }
    }
}
