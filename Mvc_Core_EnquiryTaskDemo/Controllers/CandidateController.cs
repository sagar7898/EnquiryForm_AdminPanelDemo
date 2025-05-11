using Microsoft.AspNetCore.Mvc;
using Mvc_Core_EnquiryTaskDemo.Models;
using Mvc_Core_EnquiryTaskDemo.Services;
using Newtonsoft.Json;

namespace Mvc_Core_EnquiryTaskDemo.Controllers
{
    public class CandidateController : Controller
    {
        DbMvcCoreEnquiryTaskContext db;
        public CandidateController()
        {
            db = new DbMvcCoreEnquiryTaskContext();
        }
        public IActionResult Index()
        {

            ViewBag.enquiry = db.TblEnquiryFors.ToList();
            ViewBag.source = db.TblSources.ToList();
            ViewBag.topics = db.TblTrainingTopics.ToList();
            return View();
        }

        public IActionResult GetQualifications()
        {
            return Json(db.TblQualifications.ToList());
        }

        public IActionResult GetSpecializations(int id)
        {
            List<TblSpecialization> lst = new List<TblSpecialization>();
            foreach(TblSpecialization sp in db.TblSpecializations.ToList().Where(e => e.QualificationId.Equals(id)).ToList())
            {
                lst.Add(sp);
            }
            return Json(lst);
        }

        public IActionResult GetQualification(int id)
        {
            return Json(db.TblQualifications.Find(id));
        }

        public IActionResult GetSpecialization(int id)
        {
            return Json(db.TblSpecializations.Find(id));
        }



        public void AddCandidateDetails(TblCandidateDetail candidate)
        {
            db.TblCandidateDetails.Add(candidate);
            db.SaveChanges();
           
        }
        


        
    }
}
