using MedicalInformation.Models;
using MedicalInformation.Data;
using Dapper;
using System.Data;

namespace MedicalInformation.Repository
{
    public class MedicalRepository : IMedicalRepository
    {
        private ApplicationDbContext _context;

        public MedicalRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Patient>> GetAll()
        {
            using var connection = _context.CreateConnection();
            var sqlFunctionPatient = "SELECT * FROM GetPatients()";
            return await connection.QueryAsync<Patient>(sqlFunctionPatient);
        }
    }
}
