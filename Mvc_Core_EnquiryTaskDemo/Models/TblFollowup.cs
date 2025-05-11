using System;
using System.Collections.Generic;

namespace Mvc_Core_EnquiryTaskDemo.Models;

public partial class TblFollowup
{
    public int FollowupId { get; set; }

    public int? CandidateEnquiriesId { get; set; }

    public DateOnly? FollowupDate { get; set; }

    public string? FollowupBy { get; set; }

    public string? Description { get; set; }

    public virtual TblCandidateEnquiry? CandidateEnquiries { get; set; }
}
