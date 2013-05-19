<%@ Page Title="Procurar Cliente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Procurar_Cliente.aspx.cs" Inherits="BusinezMen.Procurar_Cliente" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Procurar Cliente</h3>
    <form id="form2" runat="server">
        <asp:GridView runat="server" id="GridView1" DataSourceID="Sql" />
        <asp:SqlDataSource runat="server" ID="Sql" 
        connectionstring="<%$ ConnectionStrings:BaseDadosConnectionString%>"
        SelectCommand="select Tipo, Nome FROM Cargo, Utilizador where Utilizador.idcargo = Cargo.IdCargo" />
    </form>    
</asp:Content>
