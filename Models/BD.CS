using Microsoft.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
using System.Linq;

namespace TP24234.Models
{
    public static class BD
    {
        private static string _connectionString = "Server=localhost;Database=TP6_Introducciónabasededatos;Integrated Security=True;TrustServerCertificate=True;";

        public static Integrante ObtenerPorUsuario(string user)
        {
            Integrante i = new Integrante();
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = "SELECT * FROM Integrantes WHERE Usuario = @pUser";
                i = connection.QueryFirstOrDefault<Integrante>(query, new { pUser = user });
            }

            return i;
        }

        public static bool VerificarContraseña(string user, string contraseña)
        {
            Integrante integrante = ObtenerPorUsuario(user);
            if (integrante == null) return false;

            bool logeado = false;
            if (integrante.Contraseña == contraseña)
            {
                logeado = true;
            }

            return logeado;
        }

        public static List<Integrante> TodosLosDeUnGrupo(int Grupo)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = "SELECT * FROM Integrantes WHERE idGrupo = @Grupo";
                return connection.Query<Integrante>(query, new { Grupo }).ToList();
            }
        }

        public static void AgregarIntegrante(int idGrupo, string usuario, string contraseña, string nombre, string frase, string hobby, string profeFav, string p)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = @"INSERT INTO Integrantes(Nombre, Usuario, Contraseña, nombre, Frase, Hobby, ProfeFav, PeliculaFav, idGrupo) 
                               VALUES (@idGrupo, @usuario, @contraseña, @nombre, @frase, @hobby, @profeFav, @peliculaFav)";

                connection.Execute(query);
            }
        }
    }
}
