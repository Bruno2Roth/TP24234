using System.Collections.Generic;
using System.Linq;
using System.Web;
using TP24234.Models;
using Newtonsoft.Json;

namespace TP24234.Models
{
    public class Integrantes
    {
        [JsonProperty]
        public string nombreGrupo { get; private set; }
        [JsonProperty]
        public string usuario { get; private set; }
        [JsonProperty]
        public string contraseña { get; private set; }
        [JsonProperty]
        public string nombre { get; private set; }
        [JsonProperty]
        public string frase { get; private set; }
        [JsonProperty]
        public string hobby { get; private set; }
        [JsonProperty]
        public string profeFav { get; private set; }
        [JsonProperty]
        public string peliculaFav { get; private set; }
        [JsonProperty]
        public string foto { get; private set; }

        public Integrantes()
        {
        }
    }
}