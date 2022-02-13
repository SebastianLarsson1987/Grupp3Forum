using Microsoft.EntityFrameworkCore.Migrations;

namespace Backend.Migrations
{
    public partial class e : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Id",
                table: "ReportedMessages");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Id",
                table: "ReportedMessages",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
