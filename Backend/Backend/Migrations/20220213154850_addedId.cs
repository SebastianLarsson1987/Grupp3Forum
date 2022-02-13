using Microsoft.EntityFrameworkCore.Migrations;

namespace Backend.Migrations
{
    public partial class addedId : Migration
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
                defaultValue: 0);

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
