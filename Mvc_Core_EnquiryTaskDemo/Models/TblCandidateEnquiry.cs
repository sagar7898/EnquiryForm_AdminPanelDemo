using System;
using System.Collections.Generic;

namespace Mvc_Core_EnquiryTaskDemo.Models;

public partial class TblCandidateEnquiry
{
    public int CandidateEnquiriesId { get; set; }

    public int? CandidateId { get; set; }

    public DateOnly? EnquiryDate { get; set; }

    public string? EnquiryFor { get; set; }

    public string? EnquirySources { get; set; }

    public string? TrainingTopics { get; set; }

    public string? Status { get; set; }

    public virtual TblCandidateDetail? Candidate { get; set; }

    public virtual ICollection<TblFollowup> TblFollowups { get; set; } = new List<TblFollowup>();
}
