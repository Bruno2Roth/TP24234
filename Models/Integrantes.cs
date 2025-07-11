using System.Collections.Generic;
using System.Linq;
using System.Web;
using TP24234.Models;
using Newtonsoft.Json;

namespace TP24234.Models
{
    public class Integrante
    {
        [JsonProperty]
        public string Nombre { get; set; }
        [JsonProperty]
        public string Usuario { get; set; }
        [JsonProperty]
        public string Contraseña { get; set; }
        [JsonProperty]
        public string Frase { get; set; }
        [JsonProperty]
        public string Hobby { get; set; }
        [JsonProperty]
        public string ProfeFav { get; set; }
        [JsonProperty]
        public string PeliculaFav { get; set; }
        [JsonProperty]
        public int idGrupo { get; set; }
        public Integrante()
        {
        }

        
    }
}