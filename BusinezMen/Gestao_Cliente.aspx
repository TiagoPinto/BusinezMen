<%@ Title="Gestão de Clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gestao_Cliente.aspx.cs" Inherits="BusinezMen.Content.Gestao_Cliente" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <ol class="round">
        <li class="one">
            <h5><a runat="server" href="~/Cobertura_Cliente.aspx">Cobertura</a></h5>
            </li>
        <li class="two">
            <h5><a runat="server" href="~/Procurar_Cliente.aspx">Procurar Cliente</a></h5>
            </li>
        <li class="three">
            <h5><a runat="server" href="~/Estado_Cliente.aspx">Estado de Cliente</a></h5>
            </li>
        <li class="four">
            <h5><a runat="server" href="~/Editar_Cliente.aspx">Editar Cliente</a></h5>
            </li>
        </ol>
</asp:Content>