<%@ Page Title="Gestão Serviço" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gestao_Servico.aspx.cs" Inherits="BusinezMen.Gestao_Servico" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <ol class="round">
        <li class="one">
            <h5><a id="A1" runat="server" href="~/Tipo_Servico.aspx">Todos os Serviços</a></h5>
            </li>
        <li class="two">
            <h5><a id="A2" runat="server" href="~/Adicionar_Servico.aspx">Adicionar Serviço</a></h5>
            </li>
        <li class="three">
            <h5><a id="A4" runat="server" href="~/Editar_Servico.aspx">Editar Serviço</a></h5>
            </li>
        </ol>
</asp:Content>
