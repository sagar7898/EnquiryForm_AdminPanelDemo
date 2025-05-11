using System;
using System.Collections.Generic;

namespace Mvc_Core_EnquiryTaskDemo.Models;

public partial class TblCandidateSpecialization
{
    public int CandidateSpecializationId { get; set; }

    public int? CandidateId { get; set; }

    public string? CourseName { get; set; }

    public string? InstituteName { get; set; }

    public virtual TblCandidateDetail? Candidate { get; set; }
}
