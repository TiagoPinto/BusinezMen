<%@ Page Title="Estatisticas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Estatisticas.aspx.cs" Inherits="BusinezMen.Estatisticas" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IdEstado" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="IdEstado" HeaderText="IdEstado" InsertVisible="False" ReadOnly="True" SortExpression="IdEstado" />
                <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BaseDadosConnectionString %>" DeleteCommand="DELETE FROM [Estado] WHERE [IdEstado] = @IdEstado" InsertCommand="INSERT INTO [Estado] ([Descricao]) VALUES (@Descricao)" SelectCommand="SELECT * FROM [Estado]" UpdateCommand="UPDATE [Estado] SET [Descricao] = @Descricao WHERE [IdEstado] = @IdEstado">
            <DeleteParameters>
                <asp:Parameter Name="IdEstado" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Descricao" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Descricao" Type="String" />
                <asp:Parameter Name="IdEstado" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>

</asp:Content>

