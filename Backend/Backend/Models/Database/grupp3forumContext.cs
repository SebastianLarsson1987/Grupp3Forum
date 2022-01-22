using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace Backend.Models.Database
{
    public partial class grupp3forumContext : DbContext
    {
        public grupp3forumContext()
        {
        }

        public grupp3forumContext(DbContextOptions<grupp3forumContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Message> Messages { get; set; }
        public virtual DbSet<MessageReply> MessageReplies { get; set; }
        public virtual DbSet<NewThread> NewThreads { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=tcp:grupp3-forum.database.windows.net,1433;Initial Catalog=grupp3-forum;Persist Security Info=False;User ID=grupp3;Password=M3CX@fhNfe2siBR;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("Category");

                entity.Property(e => e.CategoryName).IsUnicode(false);
            });

            modelBuilder.Entity<Message>(entity =>
            {
                entity.ToTable("Message");

                entity.Property(e => e.CreatedAt).HasColumnType("date");

                entity.Property(e => e.Text)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.UpdatedAt).HasColumnType("date");

                entity.HasOne(d => d.Thread)
                    .WithMany(p => p.Messages)
                    .HasForeignKey(d => d.ThreadId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Message__ThreadI__6754599E");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Messages)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Message__UserId__68487DD7");
            });

            modelBuilder.Entity<MessageReply>(entity =>
            {
                entity.ToTable("Message_Reply");

                entity.Property(e => e.CreatedAt).HasColumnType("date");

                entity.Property(e => e.Text)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.UpdatedAt).HasColumnType("date");

                entity.HasOne(d => d.Message)
                    .WithMany(p => p.MessageReplies)
                    .HasForeignKey(d => d.MessageId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Message_R__Messa__6B24EA82");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.MessageReplies)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Message_R__UserI__6C190EBB");
            });

            modelBuilder.Entity<NewThread>(entity =>
            {
                entity.ToTable("NewThread");

                entity.Property(e => e.CreateadAt).HasColumnType("date");

                entity.Property(e => e.Text)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.Topic)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.UpdatedAt).HasColumnType("date");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.NewThreads)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Thread__Category__6477ECF3");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.NewThreads)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Thread__UserId__6383C8BA");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.RoleName).IsUnicode(false);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.Email)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.UserName)
                    .IsRequired()
                    .IsUnicode(false);
                entity.Property(u => u.UniqueId).IsRequired();

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Users__RoleId__60A75C0F");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
