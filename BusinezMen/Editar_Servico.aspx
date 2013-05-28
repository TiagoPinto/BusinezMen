<%@ Page Title="Editar Serviço" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editar_Servico.aspx.cs" Inherits="BusinezMen.Editar_Servico" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IdServico" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <Columns>               
                <asp:BoundField Visible="false" DataField="IdServico" HeaderText="IdServico" InsertVisible="False" ReadOnly="True" SortExpression="IdServico" />
                <asp:TemplateField HeaderText="Descricao" SortExpression="Descricao">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Descricao") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Descricao") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tecnologia" SortExpression="idTecnologia">
                    <EditItemTemplate>
                        <asp:SqlDataSource runat="server" ID="tecnologias" 
                            connectionstring="<%$ ConnectionStrings:BaseDadosConnectionString%>"
                            SelectCommand="SELECT * FROM Tecnologia" />
                            <asp:DropDownList ID="tecnologia" runat="server" DataSourceID="tecnologias" DataTextField="Descricao" DataValueField="IdTecnologia"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Descricao") %>'></asp:Label>
                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Preco" SortExpression="Preco">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Preco") %>' Width="70px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Preco") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pontos" SortExpression="Pontos">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Pontos") %>' Width="70px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Pontos") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Activo" SortExpression="Activo" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Activo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Activo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
            <SelectedRowStyle ForeColor="White" Font-Bold="True" BackColor="#008A8C"/>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle ForeColor="White" Font-Bold="True" BackColor="#000084" />
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BaseDadosConnectionString %>" 
            DeleteCommand="UPDATE [Servico] SET activo = 0 WHERE IdServico=@IdServico" 
            SelectCommand="SELECT * FROM [Servico], [Tecnologia] WHERE Servico.Activo=1 AND Servico.idTecnologia=Tecnologia.idTecnologia" 
            UpdateCommand="UPDATE [Servico] SET [Descricao] = @Descricao, [Preco] = @Preco, [Pontos] = @Pontos WHERE [IdServico] = @IdServico">
            <DeleteParameters>
                <asp:Parameter Name="IdServico" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Descricao" Type="String" />
                <asp:Parameter Name="Preco" Type="Double" />
                <asp:Parameter Name="Pontos" Type="Int32" />
                <asp:Parameter Name="Activo" Type="String" />
                <asp:Parameter Name="IdServico" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    
</asp:Content>