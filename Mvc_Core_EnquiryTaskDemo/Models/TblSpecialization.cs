using System;
using System.Collections.Generic;

namespace Mvc_Core_EnquiryTaskDemo.Models;

public partial class TblSpecialization
{
    public int SpecializationId { get; set; }

    public string? SpecializationName { get; set; }

    public int? QualificationId { get; set; }

    public virtual TblQualification? Qualification { get; set; }

    public virtual ICollection<TblCandidateQualification> TblCandidateQualifications { get; set; } = new List<TblCandidateQualification>();
}
