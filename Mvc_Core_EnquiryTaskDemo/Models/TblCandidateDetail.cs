using System;
using System.Collections.Generic;

namespace Mvc_Core_EnquiryTaskDemo.Models;

public partial class TblCandidateDetail
{
    public int CandidateId { get; set; }

    public string CandidateName { get; set; } = null!;

    public string? MobileNumber { get; set; }

    public string? LocalAddress { get; set; }

    public string? EmailAddress { get; set; }

    public DateOnly? Birthdate { get; set; }

    public virtual ICollection<TblCandidateEnquiry> TblCandidateEnquiries { get; set; } = new List<TblCandidateEnquiry>();

    public virtual ICollection<TblCandidateQualification> TblCandidateQualifications { get; set; } = new List<TblCandidateQualification>();

    public virtual ICollection<TblCandidateSpecialization> TblCandidateSpecializations { get; set; } = new List<TblCandidateSpecialization>();
}
