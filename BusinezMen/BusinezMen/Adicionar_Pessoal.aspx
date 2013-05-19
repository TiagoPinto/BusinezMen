<%@ Page Title="Adicionar Pessoal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Adicionar_Pessoal.aspx.cs" Inherits="BusinezMen.Adicionar_Pessoal" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Adicionar Funcionário</h2>
    <script runat="server">
    
        private void ExecuteInsertMorada(string rua, string porta, string localidade, string cod, string idconcelho)
        {
            string connString = ConfigurationManager.ConnectionStrings["BaseDadosConnectionString"].ConnectionString;
            SqlConnection conn = null;

            conn = new SqlConnection(connString);
            string sql = "INSERT INTO Morada (Rua,Porta,Localidade,[Codigo Postal],idConcelho) VALUES "
                        + " (@rua,@porta,@localidade,@codigo,@idconcelho)";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[5];
                param[0] = new SqlParameter("@rua", SqlDbType.NVarChar, 50);
                param[1] = new SqlParameter("@porta", SqlDbType.NVarChar, 50);
                param[2] = new SqlParameter("@localidade", SqlDbType.NVarChar, 50);
                param[3] = new SqlParameter("@codigo", SqlDbType.NVarChar, 50);
                param[4] = new SqlParameter("@idconcelho", SqlDbType.Int);
                
                param[0].Value = rua;
                param[1].Value = porta;
                param[2].Value = localidade;
                param[3].Value = cod;
                param[4].Value = Convert.ToInt32(idconcelho);
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

        private void ExecuteInsertDados(string idequipa, string idcargo, string nome, string bi, string nif, string tel, string mail, string estado, string idmorada)
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
                param[4] = new SqlParameter("@nif", SqlDbType.NVarChar,50);
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
                param[8].Value = idmorada;
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

        private string ExecuteSelectIdMorada(string rua, string Localidade)
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
        
        private void ProcessInfo( object sender, EventArgs args ) {
            string codpostal = cod1.Text+'-'+cod2.Text;
            string id = "2";
             //call the method to execute insert to the database
            ExecuteInsertMorada(rua.Text,porta.Text,localidade.Text,codpostal,concelho.SelectedValue);
            id = ExecuteSelectIdMorada(rua.Text, localidade.Text);
            ExecuteInsertDados(equipa.SelectedValue, funcao.SelectedValue, nome.Text, bi.Text, nif.Text, telefone.Text, email.Text, "1", id);
            Response.Write("Record was successfully added!");
        }

    </script>
    <form id="inserirFuncionario" runat="server">
        <h4>Dados Pessoais:</h4>
            Nome: <asp:TextBox runat="server" ID="nome" Width="436px" />
        <br />
            Bilhete de Identidade: <asp:TextBox runat="server" ID="bi" Width="80px" />
            &nbsp;Número de Contribuinte: <asp:TextBox runat="server" ID="nif" Width="80px" />
        <br />
            Telefone: <asp:TextBox runat="server" ID="telefone" Width="163px" MaxLength="9"/>
            Email: <asp:TextBox runat="server" ID="email" Width="205px" />
        <br />
        <h4>Morada:</h4>
            Rua:<asp:TextBox runat="server" ID="rua" Width="270px" />
            Localidade:<asp:TextBox runat="server" ID="localidade" Width="100px" />
        <br />
            Porta: <asp:TextBox runat="server" ID="porta" Width="28px" MaxLength="4"/>&nbsp;&nbsp;
            Codigo Postal:&nbsp; <asp:TextBox runat="server" ID="cod1" Width="30px" MaxLength="4"/>-<asp:TextBox runat="server" ID="cod2" Width="25px" MaxLength="3"/>
            <asp:SqlDataSource runat="server" ID="concelhos" 
            connectionstring="<%$ ConnectionStrings:BaseDadosConnectionString%>"
            SelectCommand="select * from Concelho" />
            &nbsp;&nbsp;&nbsp; Concelho:&nbsp;
            <asp:DropDownList ID="concelho" runat="server" DataSourceID="concelhos" DataTextField="NomeConcelho" DataValueField="IdConcelho">
            </asp:DropDownList><br />
        <br />
        <h4>Cargo:</h4>
            Função:
            <asp:SqlDataSource runat="server" ID="cargos" 
            connectionstring="<%$ ConnectionStrings:BaseDadosConnectionString%>"
            SelectCommand="SELECT IdCargo,tipo from Cargo" /> 
            <asp:RadioButtonList runat="server" ID="funcao" RepeatDirection="Horizontal" TextAlign="Left" Width="450px" DataSourceID="cargos" DataTextField="tipo" DataValueField="IdCargo">
            </asp:RadioButtonList>
            Equipa:
            <asp:SqlDataSource runat="server" ID="equipas" 
            connectionstring="<%$ ConnectionStrings:BaseDadosConnectionString%>"
            SelectCommand="select IdEquipa from Equipa" />
            <asp:DropDownList ID="equipa" runat="server" DataSourceID="equipas" DataTextField="IdEquipa" DataValueField="IdEquipa">
            </asp:DropDownList><br />

            <br />
            <asp:Button runat="server" ID="bt" Text="Confirmar" OnClick="ProcessInfo" />
        <br />
        <br />
    </form>
</asp:Content>