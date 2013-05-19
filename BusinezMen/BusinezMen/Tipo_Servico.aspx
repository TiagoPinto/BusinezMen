<%@ Page Title="Tipo de Serviço" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tipo_Servico.aspx.cs" Inherits="BusinezMen.Tipo_Servico" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Tipo Servico</h3>
    <form id="form1" runat="server">
        <asp:GridView runat="server" id="grid" DataSourceID="source" />
        <asp:SqlDataSource runat="server" ID="source" 
        connectionstring="<%$ ConnectionStrings:BaseDadosConnectionString%>"
        SelectCommand="select IdConcelho, NomeConcelho from Concelho" />
    </form>
</asp:Content>
