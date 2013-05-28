<%@ Page Title="Adicionar Candidato" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Estado_Cliente.aspx.cs" Inherits="BusinezMen.Estado" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <form id="form1" runat="server">
        <asp:GridView runat="server" ID="grid" DataSourceID="source" AutoGenerateColumns="False" ForeColor="#333333" 
            GridLines="Vertical" CellPadding="6" DataKeyNames="idUtilizador">
            <FooterStyle ForeColor="White" Font-Bold="True" BackColor="#15317E" />
            <Columns>
                <asp:BoundField DataField="nome" HeaderText="Nome Cliente" />
                <%-- <asp:BoundField DataField="nif" HeaderText="Nif" "/>
                <asp:BoundField DataField="telemovel" HeaderText="Contacto" />
                <asp:BoundField DataField="Nome" HeaderText="Nome Comercial" />
                <asp:BoundField DataField="Descricao" HeaderText="Estado" ControlStyle-Width="70px"/>          --%>
            </Columns>
            <RowStyle BackColor="#E3EAEB" />
            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#666666" />
            <SelectedRowStyle ForeColor="#333333" Font-Bold="True" BackColor="#C5BBAF"/>
            <HeaderStyle ForeColor="White" Font-Bold="True" BackColor="#15317E" />
            <EditRowStyle Font-Italic="False" Font-Bold="False" BackColor="lightgray" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="source" 
            ConnectionString="<%$ ConnectionStrings: BaseDadosConnectionString %>"
            OldValuesParameterFormatString="{0}"
            SelectCommand="SELECT * FROM Utilizador, Morada, Concelho WHERE estado = 1 AND Utilizador.idMorada = Morada.IdMorada AND Morada.idConcelho=Concelho.IdConcelho" 
            DeleteCommand="UPDATE Utilizador SET Estado = 0 WHERE IdUtilizador=@idUtilizador" />
    </form>
</asp:Content>

