using System;
using System.Collections.Generic;

namespace Mvc_Core_EnquiryTaskDemo.Models;

public partial class VtblCandidateDatum
{
    public int CandidateId { get; set; }

    public string CandidateName { get; set; } = null!;

    public string? MobileNumber { get; set; }

    public string? LocalAddress { get; set; }

    public string? EmailAddress { get; set; }

    public DateOnly? Birthdate { get; set; }

    public int? SpecializationId { get; set; }

    public string? University { get; set; }

    public int? PassingYear { get; set; }

    public string? Medium { get; set; }

    public double? Percentage { get; set; }

    public string? CourseName { get; set; }

    public string? InstituteName { get; set; }
}
