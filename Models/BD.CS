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
    }
    public List<Integrantes> LevantarIntegrante()
    {
        List<Integrantes> integrantes = new List<Integrantes>();
        using (SqlConnection connection = new SqlConnection(_connectionString))
        {
            string query = "SELECT * FROM Integrantes";
            integrantes = connection.Query<Integrantes>(query).ToList();
        }
        return integrantes;
    }
}