namespace MedicalInformation.Data
{
    using System.Data;
    using Dapper;
    using MedicalInformation.Helpers;
    using Microsoft.Extensions.Options;
    using Npgsql;

    public class ApplicationDbContext
    {
        private DbSettings _dbSettings;

        public ApplicationDbContext(IOptions<DbSettings> dbSettings)
        {
            _dbSettings = dbSettings.Value;
        }

        public IDbConnection CreateConnection()
        {
            var connectionString = $"Host={_dbSettings.Server}; Database={_dbSettings.Database}; Username={_dbSettings.UserId}; Password={_dbSettings.Password};";
            return new NpgsqlConnection(connectionString);
        }
    }
}
