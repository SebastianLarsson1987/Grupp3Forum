using Microsoft.EntityFrameworkCore.Migrations;

namespace Backend.Migrations
{
    public partial class f : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_NewThread_Users",
                table: "NewThread");

            migrationBuilder.AddColumn<int>(
                name: "Id",
                table: "ReportedMessages",
                type: "int",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddPrimaryKey(
                name: "PK_ReportedMessages",
                table: "ReportedMessages",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_NewThread_Users",
                table: "NewThread",
                column: "UserUid",
                principalTable: "Users",
                principalColumn: "Uid");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_NewThread_Users",
                table: "NewThread");

            migrationBuilder.DropPrimaryKey(
                name: "PK_ReportedMessages",
                table: "ReportedMessages");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "ReportedMessages");

            migrationBuilder.AddForeignKey(
                name: "FK_NewThread_Users",
                table: "NewThread",
                column: "UserUid",
                principalTable: "Users",
                principalColumn: "Uid",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
