using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Backend.Models.Database;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;

namespace Backend.Services.BackgroundServices
{
    public class FlushDeletedUsersService : BackgroundService
    {
        private readonly ILogger<FlushDeletedUsersService> _logger;
        private readonly grupp3forumContext _ctx;
        /// <summary>
        /// The amount of delay to put on the function before flushing users again.
        /// </summary>
        private readonly TimeSpan delay = new(0, 5, 0);
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

        /// <summary>
        /// Task to remove users who are present in the DeletedUsers table.
        /// </summary>
        /// <returns>Task</returns>
        private async Task RemoveUsers()
        {
            int removed = 0;
            TimeSpan waitPeriod = new(0, 0, 0, 0);
            List<DeletedUser> users = await _ctx.DeletedUsers.ToListAsync();
            foreach (DeletedUser user in users)
            {
                if (DateTime.Now > user.DeletionDate + waitPeriod)
                {
                    try
                    {
                        ++removed;
                        await RemoveRelations(user.UserUid);
                        _ = _ctx.Users.Remove(await _ctx.Users.FindAsync(user.UserUid));
                        _ = _ctx.DeletedUsers.Remove(user);
                        _ = await _ctx.SaveChangesAsync();
                    }
                    catch (Exception e)
                    {
                        _logger.LogError(e.ToString());
                        throw;
                    }

                }
            }
            _ = await _ctx.SaveChangesAsync();
            _logger.LogInformation($"{removed} users were permanently deleted.");
        }

        /// <summary>
        ///  Remove relations by replacing the specified user uid with a placeholder.
        /// </summary>
        /// <param name="userUid">The uid to strip from entities.</param>
        /// <returns></returns>
        private async Task RemoveRelations(string userUid)
        {
            const string userPlaceholder = "0001";
            List<Message> messages = await _ctx.Messages.Where(m => m.UserUid == userUid).ToListAsync();
            List<NewThread> threads = await _ctx.NewThreads.Where(m => m.UserUid == userUid).ToListAsync();
            List<MessageReply> replies = await _ctx.MessageReplies.Where(m => m.UserUid == userUid).ToListAsync();
            foreach (Message message in messages)
            {
                message.UserUid = userPlaceholder;
            }
            foreach (NewThread thread in threads)
            {
                thread.UserUid = userPlaceholder;
            }
            foreach (MessageReply reply in replies)
            {
                reply.UserUid = userPlaceholder;
            }
            _ctx.UpdateRange(messages);
            _ctx.UpdateRange(threads);
            _ctx.UpdateRange(replies);
            _ = await _ctx.SaveChangesAsync();

        }
    }
}