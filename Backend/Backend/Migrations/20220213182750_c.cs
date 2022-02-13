using Microsoft.EntityFrameworkCore.Migrations;

namespace Backend.Migrations
{
    public partial class c : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_ReportedMessages",
                table: "ReportedMessages");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "ReportedMessages");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.AddColumn<int>(
            //    name: "Id",
            //    table: "ReportedMessages",
            //    type: "int",
            //    nullable: false,
            //    defaultValue: 0)
            //    .Annotation("SqlServer:Identity", "1, 1");

            //migrationBuilder.AddPrimaryKey(
            //    name: "PK_ReportedMessages",
            //    table: "ReportedMessages",
            //    column: "Id");
        }
    }
}
