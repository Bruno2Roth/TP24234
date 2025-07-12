using System.Collections.Generic;
using System.Linq;
using System.Web;
using TP24234.Models;
using Newtonsoft.Json;
using Microsoft.Data.SqlClient;

namespace TP24234.Models
{
    public class Grupo
    {
        [JsonProperty]
        public string NombreGrupo { get; set; }
        [JsonProperty]
        public List<Integrante> miembros { get; set; }

        public Grupo()
        {
        }
    }
}