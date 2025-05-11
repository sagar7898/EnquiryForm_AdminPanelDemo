using System;
using System.Collections.Generic;

namespace Mvc_Core_EnquiryTaskDemo.Models;

public partial class TblQualification
{
    public int QualificationId { get; set; }

    public string? QualificationName { get; set; }

    public virtual ICollection<TblSpecialization> TblSpecializations { get; set; } = new List<TblSpecialization>();
}
