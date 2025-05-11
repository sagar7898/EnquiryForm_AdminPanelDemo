using Mvc_Core_EnquiryTaskDemo.Models;

namespace Mvc_Core_EnquiryTaskDemo.Services
{
    public interface IEmailService
    {
        void SendEmail(EmailReceiver receiver);
    }
}
