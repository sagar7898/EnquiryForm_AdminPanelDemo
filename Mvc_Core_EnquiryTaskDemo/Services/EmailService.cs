using Microsoft.Extensions.Options;
using MimeKit;
using Mvc_Core_EnquiryTaskDemo.Models;
using MailKit.Net.Smtp;

namespace Mvc_Core_EnquiryTaskDemo.Services
{
    public class EmailService:IEmailService
    {
        EmailSettings _settings;

        public EmailService(IOptions<EmailSettings> settings)
        {
            this._settings = settings.Value;
        }
        public void SendEmail(EmailReceiver receiver)
        {
            MimeMessage message = new MimeMessage();
            MailboxAddress emailform = new MailboxAddress(_settings.Name, _settings.EmailId);
            MailboxAddress emailto = new MailboxAddress(receiver.UserName, receiver.EmailAddress);
            message.From.Add(emailform);
            message.To.Add(emailto);
            message.Subject = receiver.Subject;
            BodyBuilder body = new BodyBuilder();
            body.HtmlBody = receiver.Message;
            message.Body = body.ToMessageBody();
            SmtpClient smtp = new SmtpClient();
            smtp.Timeout = 200000;
            smtp.Connect(_settings.Host, _settings.Port, _settings.UseSSL);
            smtp.Authenticate(_settings.EmailId, _settings.Password);
            smtp.Send(message);
            smtp.Disconnect(true);
            smtp.Dispose();

        }
    }
}
