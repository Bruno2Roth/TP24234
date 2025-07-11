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
        public int idGrupo { get; set; }
        [JsonProperty]
        public string usuario { get; set; }
        [JsonProperty]
        public string contraseña { get; set; }
        [JsonProperty]
        public string nombre { get; set; }
        [JsonProperty]
        public string frase { get; set; }
        [JsonProperty]
        public string hobby { get; set; }
        [JsonProperty]
        public string profeFav { get; set; }
        [JsonProperty]
        public string peliculaFav { get; set; }

        public Integrante()
        {
        }
    }
}