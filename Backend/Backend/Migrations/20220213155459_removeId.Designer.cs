﻿// <auto-generated />
using System;
using Backend.Models.Database;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Backend.Migrations
{
    [DbContext(typeof(grupp3forumContext))]
    [Migration("20220213155459_removeId")]
    partial class removeId
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.13")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Backend.Models.Database.Category", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("CategoryName")
                        .IsUnicode(false)
                        .HasColumnType("varchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Category");
                });

            modelBuilder.Entity("Backend.Models.Database.DeletedUser", b =>
                {
                    b.Property<string>("UserUid")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<DateTime>("DeletionDate")
                        .HasColumnType("datetime");

                    b.HasKey("UserUid");

                    b.ToTable("DeletedUsers");
                });

            modelBuilder.Entity("Backend.Models.Database.Message", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime");

                    b.Property<bool?>("IsDeleated")
                        .HasColumnType("bit");

                    b.Property<bool?>("IsReported")
                        .HasColumnType("bit");

                    b.Property<string>("Text")
                        .IsRequired()
                        .IsUnicode(false)
                        .HasColumnType("varchar(max)");

                    b.Property<int>("ThreadId")
                        .HasColumnType("int");

                    b.Property<DateTime>("UpdatedAt")
                        .HasColumnType("datetime");

                    b.Property<string>("UserUid")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)")
                        .HasColumnName("UserUId");

                    b.HasKey("Id");

                    b.HasIndex("ThreadId");

                    b.HasIndex("UserUid");

                    b.ToTable("Message");
                });

            modelBuilder.Entity("Backend.Models.Database.MessageReply", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime");

                    b.Property<int>("MessageId")
                        .HasColumnType("int");

                    b.Property<string>("Text")
                        .IsRequired()
                        .IsUnicode(false)
                        .HasColumnType("varchar(max)");

                    b.Property<DateTime>("UpdatedAt")
                        .HasColumnType("datetime");

                    b.Property<string>("UserUid")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.HasKey("Id");

                    b.HasIndex("MessageId");

                    b.HasIndex("UserUid");

                    b.ToTable("Message_Reply");
                });

            modelBuilder.Entity("Backend.Models.Database.NewThread", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<bool>("Blocked")
                        .HasColumnType("bit");

                    b.Property<int>("CategoryId")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreateadAt")
                        .HasColumnType("datetime");

                    b.Property<string>("Text")
                        .IsRequired()
                        .IsUnicode(false)
                        .HasColumnType("varchar(max)");

                    b.Property<string>("Topic")
                        .IsRequired()
                        .IsUnicode(false)
                        .HasColumnType("varchar(max)");

                    b.Property<DateTime?>("UpdatedAt")
                        .HasColumnType("datetime");

                    b.Property<string>("UserUid")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.HasKey("Id");

                    b.HasIndex("CategoryId");

                    b.HasIndex("UserUid");

                    b.ToTable("NewThread");
                });

            modelBuilder.Entity("Backend.Models.Database.ReportedMessage", b =>
                {
                    b.Property<DateTime>("DelatedAt")
                        .HasColumnType("datetime");

                    b.Property<string>("Email")
                        .IsRequired()
                        .IsUnicode(false)
                        .HasColumnType("varchar(max)");

                    b.Property<string>("Text")
                        .IsRequired()
                        .IsUnicode(false)
                        .HasColumnType("varchar(max)");

                    b.Property<int>("ThreadId")
                        .HasColumnType("int");

                    b.Property<string>("Uid")
                        .IsRequired()
                        .IsUnicode(false)
                        .HasColumnType("varchar(max)");

                    b.ToTable("ReportedMessages");
                });

            modelBuilder.Entity("Backend.Models.Database.Role", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("RoleName")
                        .IsUnicode(false)
                        .HasColumnType("varchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Role");
                });

            modelBuilder.Entity("Backend.Models.Database.User", b =>
                {
                    b.Property<string>("Uid")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<bool>("Banned")
                        .HasColumnType("bit");

                    b.Property<string>("Email")
                        .IsRequired()
                        .IsUnicode(false)
                        .HasColumnType("varchar(max)");

                    b.Property<string>("FirstName")
                        .IsUnicode(false)
                        .HasColumnType("varchar(max)")
                        .HasColumnName("firstName");

                    b.Property<string>("LastName")
                        .IsUnicode(false)
                        .HasColumnType("varchar(max)")
                        .HasColumnName("lastName");

                    b.Property<int>("RoleId")
                        .HasColumnType("int");

                    b.Property<string>("UserName")
                        .IsRequired()
                        .IsUnicode(false)
                        .HasColumnType("varchar(max)");

                    b.HasKey("Uid")
                        .HasName("PK_Users_1");

                    b.HasIndex("RoleId");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("Backend.Models.Database.Message", b =>
                {
                    b.HasOne("Backend.Models.Database.NewThread", "Thread")
                        .WithMany("Messages")
                        .HasForeignKey("ThreadId")
                        .HasConstraintName("FK_Message_NewThread")
                        .IsRequired();

                    b.HasOne("Backend.Models.Database.User", "UserU")
                        .WithMany("Messages")
                        .HasForeignKey("UserUid")
                        .HasConstraintName("FK_Message_Users")
                        .IsRequired();

                    b.Navigation("Thread");

                    b.Navigation("UserU");
                });

            modelBuilder.Entity("Backend.Models.Database.MessageReply", b =>
                {
                    b.HasOne("Backend.Models.Database.Message", "Message")
                        .WithMany("MessageReplies")
                        .HasForeignKey("MessageId")
                        .HasConstraintName("FK_Message_Reply_Message")
                        .IsRequired();

                    b.HasOne("Backend.Models.Database.User", "UserU")
                        .WithMany("MessageReplies")
                        .HasForeignKey("UserUid")
                        .HasConstraintName("FK_Message_Reply_Users")
                        .IsRequired();

                    b.Navigation("Message");

                    b.Navigation("UserU");
                });

            modelBuilder.Entity("Backend.Models.Database.NewThread", b =>
                {
                    b.HasOne("Backend.Models.Database.Category", "Category")
                        .WithMany("NewThreads")
                        .HasForeignKey("CategoryId")
                        .HasConstraintName("FK_NewThread_Category")
                        .IsRequired();

                    b.HasOne("Backend.Models.Database.User", "UserU")
                        .WithMany("NewThreads")
                        .HasForeignKey("UserUid")
                        .HasConstraintName("FK_NewThread_Users")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.Navigation("Category");

                    b.Navigation("UserU");
                });

            modelBuilder.Entity("Backend.Models.Database.User", b =>
                {
                    b.HasOne("Backend.Models.Database.Role", "Role")
                        .WithMany("Users")
                        .HasForeignKey("RoleId")
                        .HasConstraintName("FK_Users_Role")
                        .IsRequired();

                    b.Navigation("Role");
                });

            modelBuilder.Entity("Backend.Models.Database.Category", b =>
                {
                    b.Navigation("NewThreads");
                });

            modelBuilder.Entity("Backend.Models.Database.Message", b =>
                {
                    b.Navigation("MessageReplies");
                });

            modelBuilder.Entity("Backend.Models.Database.NewThread", b =>
                {
                    b.Navigation("Messages");
                });

            modelBuilder.Entity("Backend.Models.Database.Role", b =>
                {
                    b.Navigation("Users");
                });

            modelBuilder.Entity("Backend.Models.Database.User", b =>
                {
                    b.Navigation("MessageReplies");

                    b.Navigation("Messages");

                    b.Navigation("NewThreads");
                });
#pragma warning restore 612, 618
        }
    }
}
