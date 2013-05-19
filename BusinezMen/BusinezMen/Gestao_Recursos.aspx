<%@ Page Title="Gestão de Recursos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gestao_Recursos.aspx.cs" Inherits="BusinezMen.Gestao_Recursos" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <ol class="round">
        <li class="one">
            <h5><a id="A1" runat="server" href="~/Percurso_Comercial.aspx">Percurso dos Comerciais</a></h5>
            </li>
        <li class="two">
            <h5><a id="A2" runat="server" href="~/Localizacao_Comercial.aspx">Localização dos Comerciais</a></h5>
            </li>
        <li class="three">
            <h5><a id="A3" runat="server" href="~/Vencimentos.aspx">Vencimentos</a></h5>
            </li>
        <li class="four">
            <h5><a id="A4" runat="server" href="~/Adicionar_Pessoal.aspx">Adicionar Pessoal</a></h5>
            </li>
        <li class="five">
            <h5><a id="A5" runat="server" href="~/Remover_Pessoal.aspx">Remover Pessoal</a></h5>
            </li>
        </ol>
</asp:Content>
