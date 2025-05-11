using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages.Manage;
using Mvc_Core_EnquiryTaskDemo.Models;
using static System.Net.WebRequestMethods;
using Mvc_Core_EnquiryTaskDemo.Services;

namespace Mvc_Core_EnquiryTaskDemo.Controllers
{
    public class EnquiryController : Controller
    {
        IEmailService service;
        DbMvcCoreEnquiryTaskContext db;
        public EnquiryController(IEmailService service)
        {
            db = new DbMvcCoreEnquiryTaskContext();
            this.service = service;
        }
        public IActionResult Enquiry()
        {
            List<FetchEnquiryModel> lst = new List<FetchEnquiryModel>();

            

            foreach (var d in db.TblCandidateDetails.ToList())
            {
                TblCandidateEnquiry enq = db.TblCandidateEnquiries.ToList().FirstOrDefault(e => e.CandidateId.Equals(d.CandidateId));

                FetchEnquiryModel detail = new FetchEnquiryModel()
                {
                    CandidateName = d.CandidateName,
                    //EnquiryDate=enq.EnquiryDate.Value.ToShortDateString(),
                    MobileNumber = d.MobileNumber,
                    EmailAdress = d.EmailAddress,
                    InterestedTopics = enq.TrainingTopics

                };
                lst.Add(detail);

            }
            
            return View(lst);
        }

        public void GetEmails(string Email)
        {
            string[] data = System.Text.RegularExpressions.Regex.Split(Email, ",");

            string msg = "<h2>Hello This is Email regaurding to your Enquiry with CIIT Institute</h2>";

            foreach (var s in data)
            {
                

                EmailReceiver email = new EmailReceiver()
                {
                    EmailAddress = s,
                    UserName = "",
                    Subject = "CIIT Enquiry",
                    Message = msg
                };
                service.SendEmail(email);
            }

            
        }
       

    }
}
