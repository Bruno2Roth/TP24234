using Microsoft.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TP24234.Models;

namespace TP24234.Models
{
    public class BD
    {
        private static string _connectionString = "@Server=localhost;DataBase = TP6_Introducciónabasededatos; Integrates Security = True; TrustServerCertificate=True;";
        public bool VerificarContraseña(string user, string contraseña)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = "SELECT Contraseña FROM Integrantes WHERE Usuario = @user";

                string contraseñaBD = connection.QueryFirstOrDefault<string>(query, new { user });

                if (contraseñaBD == null)
                {
                    return false;
                }

                return contraseñaBD == contraseña;
            }
        }
        public List<Integrantes> IntegrantesDelGrupo()
        {
            List<Integrantes> integrantes = new List<Integrantes>();
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = "SELECT * FROM Integrantes WHERE ";
                integrantes = connection.Query<Integrantes>(query).ToList();
            }
            return integrantes;
        }
    }
}