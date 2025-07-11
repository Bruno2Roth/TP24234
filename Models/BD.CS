using Microsoft.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
using System.Linq;

namespace TP24234.Models
{
    public class BD
    {
        private static string _connectionString = "Server=localhost;Database=TP6_Introducciónabasededatos;Integrated Security=True;TrustServerCertificate=True;";

        public Integrante ObtenerPorUsuario(string user)
        {
            Integrante i = null;
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = "SELECT * FROM Integrantes WHERE Usuario = @pUser";
                i = connection.QueryFirstOrDefault<Integrante>(query, new { pUser = user });
            }

            return i;
        }

        public bool VerificarContraseña(string user, string contraseña)
        {
            var integrante = ObtenerPorUsuario(user);
            if (integrante == null) return false;

            bool logeado = false;
            if (integrante.contraseña == contraseña)
            {
                logeado = true;
            }

            return logeado;
        }

        public List<Integrante> TodosLosDeUnGrupo(int Grupo)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = "SELECT * FROM Integrante WHERE idGrupo = @Grupo";
                return connection.Query<Integrante>(query, new { Grupo }).ToList();
            }
        }

        public void AgregarIntegrante(Integrante nuevo)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = @"INSERT INTO Integrante (idGrupo, usuario, contraseña, nombre, frase, hobby, profeFav, peliculaFav)
                                 VALUES (@idGrupo, @usuario, @contraseña, @nombre, @frase, @hobby, @profeFav, @peliculaFav)";
                connection.Execute(query, nuevo);
            }
        }
    }
}
