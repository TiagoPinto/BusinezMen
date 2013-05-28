using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace BusinezMen.Content 
{
    public class BaseDados
    {
        public static void ExecuteInsertCoordenadas(string latitude, string longitude)
        {
            string connString = ConfigurationManager.ConnectionStrings["BaseDadosConnectionString"].ConnectionString;
            SqlConnection conn = null;

            conn = new SqlConnection(connString);
            string sql = "INSERT INTO Coordenadas (Latitude, Longitude) VALUES "
                        + " (@latitude, @longitude)";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@latitude", SqlDbType.NVarChar, 20);
                param[1] = new SqlParameter("@longitude", SqlDbType.NVarChar, 20);


                param[0].Value = latitude;
                param[1].Value = longitude;
                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            finally
            {
                conn.Close();
            }
        }

        public static void ExecuteInsertProduto(string nome, string descricao, string idservico)
        {
            string connString = ConfigurationManager.ConnectionStrings["BaseDadosConnectionString"].ConnectionString;
            SqlConnection conn = null;

            conn = new SqlConnection(connString);
            string sql = "INSERT INTO Produto (Nome,Descricao,IdServico) VALUES "
                        + " (@nome, @descricao, @idservico)";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[3];
                param[0] = new SqlParameter("@nome", SqlDbType.NVarChar, 20);
                param[1] = new SqlParameter("@descricao", SqlDbType.NVarChar, 20);
                param[2] = new SqlParameter("@idservico", SqlDbType.NVarChar, 20);


                param[0].Value = nome;
                param[1].Value = descricao;
                param[2].Value = idservico;

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            finally
            {
                conn.Close();
            }
        }

        public static void ExecuteInsertServico(string descricao, string idtecnologia, string preco, string pontos, string activo)
        {
            string connString = ConfigurationManager.ConnectionStrings["BaseDadosConnectionString"].ConnectionString;
            SqlConnection conn = null;

            conn = new SqlConnection(connString);
            string sql = "INSERT INTO Servico (Descricao,idTecnologia,Preco,Pontos,Activo) VALUES "
                        + " (@descricao,@idtecnologia,@preco,@pontos,@activo)";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[5];
                param[0] = new SqlParameter("@descricao", SqlDbType.NVarChar, 100);
                param[1] = new SqlParameter("@idtecnologia", SqlDbType.Int);
                param[2] = new SqlParameter("@preco", SqlDbType.Float);
                param[3] = new SqlParameter("@pontos", SqlDbType.Int);
                param[4] = new SqlParameter("@activo", SqlDbType.NVarChar, 1);

                param[0].Value = descricao;
                param[1].Value = idtecnologia;
                param[2].Value = preco;
                param[3].Value = pontos;
                param[4].Value = activo;

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            finally
            {
                conn.Close();
            }
        }

        public static void ExecuteInsertMorada(string rua, string porta, string localidade, string cod, string idconcelho, string coordenadas)
        {
            string connString = ConfigurationManager.ConnectionStrings["BaseDadosConnectionString"].ConnectionString;
            SqlConnection conn = null;

            conn = new SqlConnection(connString);
            string sql = "INSERT INTO Morada (Rua,Porta,Localidade,[Codigo Postal],idConcelho,idCoordenadas) VALUES "
                        + " (@rua,@porta,@localidade,@codigo,@idconcelho,@coordenadas)";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[6];
                param[0] = new SqlParameter("@rua", SqlDbType.NVarChar, 50);
                param[1] = new SqlParameter("@porta", SqlDbType.NVarChar, 50);
                param[2] = new SqlParameter("@localidade", SqlDbType.NVarChar, 50);
                param[3] = new SqlParameter("@codigo", SqlDbType.NVarChar, 50);
                param[4] = new SqlParameter("@idconcelho", SqlDbType.Int);
                param[5] = new SqlParameter("@coordenadas", SqlDbType.Int);

                param[0].Value = rua;
                param[1].Value = porta;
                param[2].Value = localidade;
                param[3].Value = cod;
                param[4].Value = Convert.ToInt32(idconcelho);
                param[5].Value = Convert.ToInt32(coordenadas);
                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            finally
            {
                conn.Close();
            }
        }

        public static void ExecuteInsertDados(string idequipa, string idcargo, string nome, string bi, string nif, string tel, string mail, string estado, string idmorada)
        {
            string connString = ConfigurationManager.ConnectionStrings["BaseDadosConnectionString"].ConnectionString;
            SqlConnection conn = null;

            conn = new SqlConnection(connString);
            string sql = "INSERT INTO Utilizador (idEquipa,idCargo,Nome,Bi,Nif,Contacto,Email,Estado,idMorada) VALUES "
                        + " (@idequipa,@idcargo,@nome,@bi,@nif,@contacto,@email,@estado,@idMorada)";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[9];
                param[0] = new SqlParameter("@idequipa", SqlDbType.Int);
                param[1] = new SqlParameter("@idcargo", SqlDbType.Int);
                param[2] = new SqlParameter("@nome", SqlDbType.NVarChar, 50);
                param[3] = new SqlParameter("@bi", SqlDbType.NVarChar, 50);
                param[4] = new SqlParameter("@nif", SqlDbType.NVarChar, 50);
                param[5] = new SqlParameter("@contacto", SqlDbType.NVarChar, 9);
                param[6] = new SqlParameter("@email", SqlDbType.NVarChar, 50);
                param[7] = new SqlParameter("@estado", SqlDbType.NVarChar, 1);
                param[8] = new SqlParameter("@idMorada", SqlDbType.Int);

                param[0].Value = Convert.ToInt32(idequipa);
                param[1].Value = Convert.ToInt32(idcargo);
                param[2].Value = nome;
                param[3].Value = bi;
                param[4].Value = nif;
                param[5].Value = tel;
                param[6].Value = mail;
                param[7].Value = estado;
                param[8].Value = Convert.ToInt32(idmorada);
                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            finally
            {
                conn.Close();
            }
        }

        public static void ExecuteInsertVisita(string nome, string idmorada, string data, string horamin, string horamax, string tel, string mail, string estado, string idoperador, string idcomercial, string relatorio)
        {
            string connString = ConfigurationManager.ConnectionStrings["BaseDadosConnectionString"].ConnectionString;
            SqlConnection conn = null;

            conn = new SqlConnection(connString);
            string sql = "INSERT INTO Visita (Nome,idMorada,Data,HoraMinima,HoraMaxima,Contato,Email,Estado,idOperador,idComercial,Relatorio) VALUES "
                        + " (@nome,@idmorada,@data,@horamin,@horamax,@contato,@email,@estado,@idoperador,@idcomercial,@relatorio)";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[11];
                param[0] = new SqlParameter("@nome", SqlDbType.NVarChar,50);
                param[1] = new SqlParameter("@idmorada", SqlDbType.Int);
                param[2] = new SqlParameter("@data", SqlDbType.Date);
                param[3] = new SqlParameter("@horamin", SqlDbType.Time);
                param[4] = new SqlParameter("@horamax", SqlDbType.Time);
                param[5] = new SqlParameter("@contato", SqlDbType.NVarChar, 9);
                param[6] = new SqlParameter("@email", SqlDbType.NVarChar, 30);
                param[7] = new SqlParameter("@estado", SqlDbType.NVarChar, 1);
                param[8] = new SqlParameter("@idOperador", SqlDbType.Int);
                param[9] = new SqlParameter("@idComercial", SqlDbType.Int);
                param[10] = new SqlParameter("@relatorio", SqlDbType.NVarChar);

                param[0].Value = nome;
                param[1].Value = Convert.ToInt32(idmorada);
                param[2].Value = DateTime.Parse(data);
                param[3].Value = DateTime.Parse(horamin).TimeOfDay;
                param[4].Value = DateTime.Parse(horamax).TimeOfDay;
                param[5].Value = tel;
                param[6].Value = mail;
                param[7].Value = estado;
                param[8].Value = Convert.ToInt32(idoperador);
                param[9].Value = Convert.ToInt32(idcomercial);
                param[10].Value = relatorio;
                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            finally
            {
                conn.Close();
            }
        }

        public static string ExecuteSelectIdMorada(string rua, string Localidade)
        {
            string connString = ConfigurationManager.ConnectionStrings["BaseDadosConnectionString"].ConnectionString;
            SqlConnection conn = null;
            string idmorada = null;
            conn = new SqlConnection(connString);
            string sql = "SELECT IdMorada FROM Morada Where Rua = @rua";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@rua", SqlDbType.NVarChar, 50);
                //param[1] = new SqlParameter("@localidade", SqlDbType.NVarChar, 50);

                param[0].Value = rua;
                //param[1].Value = localidade;
                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                SqlDataReader resposta;
                resposta = cmd.ExecuteReader();
                if (resposta.HasRows)
                {
                    while (resposta.Read())
                    {
                        idmorada = Convert.ToString(resposta.GetInt32(0));
                    }
                }
                resposta.Close();
            }
            finally
            {
                conn.Close();

            }
            return idmorada;
        }

        public static string ExecuteSelectIdServico(string descricao, string tecnologia)
        {
            string connString = ConfigurationManager.ConnectionStrings["BaseDadosConnectionString"].ConnectionString;
            SqlConnection conn = null;
            string idmorada = null;
            conn = new SqlConnection(connString);
            string sql = "SELECT IdServico FROM Servico Where Descricao = @descricao AND idTecnologia = @idtecnologia";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@descricao", SqlDbType.NVarChar, 100);
                param[1] = new SqlParameter("@idtecnologia", SqlDbType.NVarChar, 1);

                param[0].Value = descricao;
                param[1].Value = tecnologia;
                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                SqlDataReader resposta;
                resposta = cmd.ExecuteReader();
                if (resposta.HasRows)
                {
                    while (resposta.Read())
                    {
                        idmorada = Convert.ToString(resposta.GetInt32(0));
                    }
                }
                resposta.Close();
            }
            finally
            {
                conn.Close();

            }
            return idmorada;
        }

        public static string ExecuteSelectIdCoordenadas(string lat, string longi)
        {
            string connString = ConfigurationManager.ConnectionStrings["BaseDadosConnectionString"].ConnectionString;
            SqlConnection conn = null;
            string idmorada = null;
            conn = new SqlConnection(connString);
            string sql = "SELECT IdCoordenadas FROM Coordenadas Where Latitude = @latitude AND LONGITUDE = @longitude";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@latitude", SqlDbType.NVarChar, 20);
                param[1] = new SqlParameter("@longitude", SqlDbType.NVarChar, 20);

                param[0].Value = lat;
                param[1].Value = longi;
                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                SqlDataReader resposta;
                resposta = cmd.ExecuteReader();
                if (resposta.HasRows)
                {
                    while (resposta.Read())
                    {
                        idmorada = Convert.ToString(resposta.GetInt32(0));
                    }
                }
                resposta.Close();
            }
            finally
            {
                conn.Close();

            }
            return idmorada;
        }
    }
}