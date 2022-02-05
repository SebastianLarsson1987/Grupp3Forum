using System;
using System.Threading;
using System.Threading.Tasks;
using Backend.Models.Database;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Backend.Services.BackgroundServices
{
    public class FlushDeletedUsersService : BackgroundService
    {
        private readonly ILogger<FlushDeletedUsersService> _logger;
        private readonly grupp3forumContext _ctx;
        private readonly TimeSpan delay = new(3, 0, 0);
        public FlushDeletedUsersService(grupp3forumContext ctx, ILogger<FlushDeletedUsersService> logger)
        {
            _logger = logger;
            _ctx = ctx;
        }
        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            _logger.LogInformation($"{nameof(FlushDeletedUsersService)} is starting");
            while (!stoppingToken.IsCancellationRequested)
            {
                _logger.LogDebug("Starting flush task");
                await RemoveUsers();
                await Task.Delay((int)delay.TotalMilliseconds, stoppingToken);
            }
            _logger.LogInformation("Flush task is shutting down");
        }

        private async Task RemoveUsers()
        {
            int removed = 0;
            foreach (var users in _ctx.DeletedUsers)
            {
                if (DateTime.Now > users.DeletionDate)
                {
                    ++removed;
                    _ctx.DeletedUsers.Remove(users);
                }
            }
            await _ctx.SaveChangesAsync();
            _logger.LogInformation($"{0} users were permanently deleted.", removed);
        }
    }
}