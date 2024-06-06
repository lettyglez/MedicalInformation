using MedicalInformation.Models;

namespace MedicalInformation.Repository
{
    public interface IMedicalRepository
    {
        Task<IEnumerable<Patient>> GetAll();
    }
}
