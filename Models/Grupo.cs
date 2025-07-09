using System.Collections.Generic;
using System.Linq;
using System.Web;
using TP24234.Models;
using Newtonsoft.Json;

namespace TP24234.Models
{
    public class Grupo
    {
        [JsonProperty]
        public string nombre { get; private set; }
        [JsonProperty]
        public List<Integrantes> miembros { get; private set; }
        

        public Grupo()
        {
        }
    }
}