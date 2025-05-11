using System;
using System.Collections.Generic;

namespace Mvc_Core_EnquiryTaskDemo.Models;

public partial class TblCandidateQualification
{
    public int CandidateQualificationId { get; set; }

    public int? CandidateId { get; set; }

    public int? SpecializationId { get; set; }

    public string? University { get; set; }

    public int? PassingYear { get; set; }

    public string? Medium { get; set; }

    public double? Percentage { get; set; }

    public virtual TblCandidateDetail? Candidate { get; set; }

    public virtual TblSpecialization? Specialization { get; set; }
}
