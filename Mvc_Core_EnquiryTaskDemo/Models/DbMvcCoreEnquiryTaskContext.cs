using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Mvc_Core_EnquiryTaskDemo.Models;

public partial class DbMvcCoreEnquiryTaskContext : DbContext
{
    public DbMvcCoreEnquiryTaskContext()
    {
    }

    public DbMvcCoreEnquiryTaskContext(DbContextOptions<DbMvcCoreEnquiryTaskContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblCandidateDetail> TblCandidateDetails { get; set; }

    public virtual DbSet<TblCandidateEnquiry> TblCandidateEnquiries { get; set; }

    public virtual DbSet<TblCandidateQualification> TblCandidateQualifications { get; set; }

    public virtual DbSet<TblCandidateSpecialization> TblCandidateSpecializations { get; set; }

    public virtual DbSet<TblEnquiryFor> TblEnquiryFors { get; set; }

    public virtual DbSet<TblFollowup> TblFollowups { get; set; }

    public virtual DbSet<TblQualification> TblQualifications { get; set; }

    public virtual DbSet<TblSource> TblSources { get; set; }

    public virtual DbSet<TblSpecialization> TblSpecializations { get; set; }

    public virtual DbSet<TblTrainingTopic> TblTrainingTopics { get; set; }

    public virtual DbSet<VtblCandidateDatum> VtblCandidateData { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=LAPTOP-8LTCPDVE\\SQLEXPRESS;Database=db_MvcCore_EnquiryTask;Trusted_Connection=true;TrustServerCertificate=true");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblCandidateDetail>(entity =>
        {
            entity.HasKey(e => e.CandidateId).HasName("PK__tbl_cand__39BD4C1843984642");

            entity.ToTable("tbl_candidateDetails");

            entity.Property(e => e.CandidateId).HasColumnName("candidate_id");
            entity.Property(e => e.Birthdate).HasColumnName("birthdate");
            entity.Property(e => e.CandidateName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("candidate_name");
            entity.Property(e => e.EmailAddress)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("email_address");
            entity.Property(e => e.LocalAddress)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("local_address");
            entity.Property(e => e.MobileNumber)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("mobile_number");
        });

        modelBuilder.Entity<TblCandidateEnquiry>(entity =>
        {
            entity.HasKey(e => e.CandidateEnquiriesId).HasName("PK__tbl_cand__E7239D3C33278904");

            entity.ToTable("tbl_candidate_enquiries");

            entity.Property(e => e.CandidateEnquiriesId).HasColumnName("candidate_enquiries_id");
            entity.Property(e => e.CandidateId).HasColumnName("candidate_id");
            entity.Property(e => e.EnquiryDate).HasColumnName("enquiry_date");
            entity.Property(e => e.EnquiryFor)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("enquiry_for");
            entity.Property(e => e.EnquirySources)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("enquiry_sources");
            entity.Property(e => e.Status)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("status");
            entity.Property(e => e.TrainingTopics)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("training_topics");

            entity.HasOne(d => d.Candidate).WithMany(p => p.TblCandidateEnquiries)
                .HasForeignKey(d => d.CandidateId)
                .HasConstraintName("fkcanid");
        });

        modelBuilder.Entity<TblCandidateQualification>(entity =>
        {
            entity.HasKey(e => e.CandidateQualificationId).HasName("PK__tbl_cand__5D080B9D54F014E2");

            entity.ToTable("tbl_candidate_qualification");

            entity.Property(e => e.CandidateQualificationId).HasColumnName("candidate_qualification_id");
            entity.Property(e => e.CandidateId).HasColumnName("candidate_id");
            entity.Property(e => e.Medium)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("medium");
            entity.Property(e => e.PassingYear).HasColumnName("passingYear");
            entity.Property(e => e.Percentage).HasColumnName("percentage");
            entity.Property(e => e.SpecializationId).HasColumnName("specialization_id");
            entity.Property(e => e.University)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("university");

            entity.HasOne(d => d.Candidate).WithMany(p => p.TblCandidateQualifications)
                .HasForeignKey(d => d.CandidateId)
                .HasConstraintName("fkcid");

            entity.HasOne(d => d.Specialization).WithMany(p => p.TblCandidateQualifications)
                .HasForeignKey(d => d.SpecializationId)
                .HasConstraintName("fkspid");
        });

        modelBuilder.Entity<TblCandidateSpecialization>(entity =>
        {
            entity.HasKey(e => e.CandidateSpecializationId).HasName("PK__tbl_cand__2EE940220BA732B1");

            entity.ToTable("tbl_candidate_specializations");

            entity.Property(e => e.CandidateSpecializationId).HasColumnName("candidate_specialization_id");
            entity.Property(e => e.CandidateId).HasColumnName("candidate_id");
            entity.Property(e => e.CourseName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("course_name");
            entity.Property(e => e.InstituteName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("institute_name");

            entity.HasOne(d => d.Candidate).WithMany(p => p.TblCandidateSpecializations)
                .HasForeignKey(d => d.CandidateId)
                .HasConstraintName("fkcaid");
        });

        modelBuilder.Entity<TblEnquiryFor>(entity =>
        {
            entity.HasKey(e => e.EnquiryId).HasName("PK__tbl_enqu__57CC01B30D78D002");

            entity.ToTable("tbl_enquiryFors");

            entity.Property(e => e.EnquiryId).HasColumnName("enquiry_id");
            entity.Property(e => e.EnquiryFor)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("enquiry_for");
        });

        modelBuilder.Entity<TblFollowup>(entity =>
        {
            entity.HasKey(e => e.FollowupId).HasName("PK__tbl_foll__6D23A5A1010EE983");

            entity.ToTable("tbl_followups");

            entity.Property(e => e.FollowupId).HasColumnName("followup_id");
            entity.Property(e => e.CandidateEnquiriesId).HasColumnName("candidate_enquiries_id");
            entity.Property(e => e.Description)
                .IsUnicode(false)
                .HasColumnName("description");
            entity.Property(e => e.FollowupBy)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("followup_by");
            entity.Property(e => e.FollowupDate).HasColumnName("followup_date");

            entity.HasOne(d => d.CandidateEnquiries).WithMany(p => p.TblFollowups)
                .HasForeignKey(d => d.CandidateEnquiriesId)
                .HasConstraintName("fkenqid");
        });

        modelBuilder.Entity<TblQualification>(entity =>
        {
            entity.HasKey(e => e.QualificationId).HasName("PK__tbl_qual__CDACC5DB6894CAB9");

            entity.ToTable("tbl_qualifications");

            entity.HasIndex(e => e.QualificationName, "UQ__tbl_qual__F70508B540A3518F").IsUnique();

            entity.Property(e => e.QualificationId).HasColumnName("qualification_id");
            entity.Property(e => e.QualificationName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("qualification_name");
        });

        modelBuilder.Entity<TblSource>(entity =>
        {
            entity.HasKey(e => e.SourceId).HasName("PK__tbl_sour__3035A9B674BDA547");

            entity.ToTable("tbl_sources");

            entity.HasIndex(e => e.SourceName, "UQ__tbl_sour__52379DC15FBE2BA4").IsUnique();

            entity.Property(e => e.SourceId).HasColumnName("source_id");
            entity.Property(e => e.SourceName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("source_name");
        });

        modelBuilder.Entity<TblSpecialization>(entity =>
        {
            entity.HasKey(e => e.SpecializationId).HasName("PK__tbl_spec__0E5BB6507315DB77");

            entity.ToTable("tbl_specializations");

            entity.HasIndex(e => e.SpecializationName, "UQ__tbl_spec__A28CFD794170BC31").IsUnique();

            entity.Property(e => e.SpecializationId).HasColumnName("specialization_id");
            entity.Property(e => e.QualificationId).HasColumnName("qualification_id");
            entity.Property(e => e.SpecializationName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("specialization_name");

            entity.HasOne(d => d.Qualification).WithMany(p => p.TblSpecializations)
                .HasForeignKey(d => d.QualificationId)
                .HasConstraintName("fkqid");
        });

        modelBuilder.Entity<TblTrainingTopic>(entity =>
        {
            entity.HasKey(e => e.TopicId).HasName("PK__tbl_trai__D5DAA3E99C76B498");

            entity.ToTable("tbl_trainingTopics");

            entity.HasIndex(e => e.TopicName, "UQ__tbl_trai__54BAE5EC032AC8EC").IsUnique();

            entity.Property(e => e.TopicId).HasColumnName("topic_id");
            entity.Property(e => e.TopicName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("topic_name");
        });

        modelBuilder.Entity<VtblCandidateDatum>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("Vtbl_candidate_data");

            entity.Property(e => e.Birthdate).HasColumnName("birthdate");
            entity.Property(e => e.CandidateId).HasColumnName("candidate_id");
            entity.Property(e => e.CandidateName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("candidate_name");
            entity.Property(e => e.CourseName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("course_name");
            entity.Property(e => e.EmailAddress)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("email_address");
            entity.Property(e => e.InstituteName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("institute_name");
            entity.Property(e => e.LocalAddress)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("local_address");
            entity.Property(e => e.Medium)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("medium");
            entity.Property(e => e.MobileNumber)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("mobile_number");
            entity.Property(e => e.PassingYear).HasColumnName("passingYear");
            entity.Property(e => e.Percentage).HasColumnName("percentage");
            entity.Property(e => e.SpecializationId).HasColumnName("specialization_id");
            entity.Property(e => e.University)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("university");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
