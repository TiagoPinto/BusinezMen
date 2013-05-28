<%@ Page Title="Remover Pessoal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Remover_Pessoal.aspx.cs" Inherits="BusinezMen.Remover_Pessoal" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<form id="form1" runat="server">
        <asp:GridView runat="server" ID="grid" DataSourceID="source" AutoGenerateColumns="False" ForeColor="#333333" 
            GridLines="Vertical" CellPadding="6" DataKeyNames="idUtilizador">
            <FooterStyle ForeColor="White" Font-Bold="True" BackColor="#15317E" />
            <Columns>
                <asp:BoundField DataField="Nome" HeaderText="Nome" />
                <asp:BoundField DataField="Bi" HeaderText="BI" ControlStyle-Width="70px"/>
                <asp:BoundField DataField="Nif" HeaderText="NiF"/>
                <asp:BoundField DataField="Contacto" HeaderText="Contacto" ControlStyle-Width="70px"/>
                <asp:BoundField DataField="Rua" HeaderText="Rua" />
                <asp:BoundField DataField="Localidade" HeaderText="Localidade" ControlStyle-Width="70px"/>
                <asp:BoundField DataField="NomeConcelho" HeaderText="Concelho" ControlStyle-Width="70px"/>
                <asp:BoundField DataField="Codigo Postal" HeaderText="Cod. Postal" ControlStyle-Width="60px"/>            
                <asp:CommandField ShowDeleteButton="true" DeleteText="Eliminar" />
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