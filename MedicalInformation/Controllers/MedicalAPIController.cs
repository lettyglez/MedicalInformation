using AutoMapper;
using MedicalInformation.Data;
using MedicalInformation.Models;
using MedicalInformation.Models.DTO;
using MedicalInformation.Repository;
using Microsoft.AspNetCore.Mvc;

namespace MedicalInformation.Controllers
{
    [Route("api/Patients")]
    [ApiController]
    public class MedicalAPIController : ControllerBase
    {
        private readonly IMedicalRepository _dbMedical;
        private readonly IMapper _mapper;

        public MedicalAPIController(IMedicalRepository dbMedical, IMapper mapper)
        {
            _dbMedical = dbMedical;
            _mapper = mapper;
        }


        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<PatientDTO>> GetPatients() {
            IEnumerable<Patient> patientList = await _dbMedical.GetAll();
                return Ok(_mapper.Map<List<PatientDTO>>(patientList));
           
        }
    }
}
