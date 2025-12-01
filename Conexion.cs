using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace ModeloFar
{
    public class Conexion
    {
        public MySqlConnection conexionBD;

        public Conexion()
        {
            conexionBD = new MySqlConnection();
        }

        public void abrirBD()
        {
            string servidor = "localhost";
            string bd = "farmacia";
            string usuario = "root";
            string password = "jimena";
            string cadenaConexion = $"Server={servidor};Port=8082;Database={bd};Uid={usuario};Pwd={password};";

            try
            {
                conexionBD.ConnectionString = cadenaConexion;
                conexionBD.Open();
                System.Diagnostics.Debug.WriteLine("Se conecta");
            }
            catch (MySqlException ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
            }
        }

        public void cerrarBD()
        {
            try
            {
                if (conexionBD.State == ConnectionState.Open)
                {
                    conexionBD.Close();
                    System.Diagnostics.Debug.WriteLine("Se desconecta");
                }
            }
            catch (MySqlException ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
            }
        }
    }
}