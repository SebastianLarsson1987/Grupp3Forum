using Microsoft.EntityFrameworkCore.Migrations;

namespace Backend.Migrations
{
    public partial class d : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                 name: "Id",
                 table: "ReportedMessages");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
           
        }
    }
}
