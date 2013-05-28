<%@ Page Title="Gestao de Serviço" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tipo_Servico.aspx.cs" Inherits="BusinezMen.Tipo_Servico" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <form id="form1" runat="server">
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                <asp:BoundField DataField="Tecnologia" HeaderText="Expr1" SortExpression="Expr1" />
                <asp:BoundField DataField="Preco" HeaderText="Preco" SortExpression="Preco" />
                <asp:BoundField DataField="Pontos" HeaderText="Pontos" SortExpression="Pontos" />
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                <asp:BoundField DataField="Expr2" HeaderText="Expr2" SortExpression="Expr2" />
            </Fields>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BaseDadosConnectionString %>" SelectCommand="SELECT Servico.Descricao, Tecnologia.Descricao AS Expr1, Servico.Preco, Servico.Pontos, Produto.Nome, Produto.Descricao AS Expr2 FROM Produto INNER JOIN Servico ON Produto.IdServico = Servico.IdServico INNER JOIN Tecnologia ON Servico.idTecnologia = Tecnologia.IdTecnologia"></asp:SqlDataSource>
    </form>
    
</asp:Content>
