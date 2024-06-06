using AutoMapper;
using MedicalInformation.Models;
using MedicalInformation.Models.DTO;

namespace MedicalInformation
{
    public class MappingConfig : Profile
    {
        public MappingConfig() {
            CreateMap<Patient, PatientDTO>();
            CreateMap<PatientDTO, Patient>();
        }
    }
}
