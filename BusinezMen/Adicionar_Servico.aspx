<%@ Page Title="Adicionar Serviço" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Adicionar_Servico.aspx.cs" Inherits="BusinezMen.Adicionar_Servico" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<script runat="server">
    private void ProcessInfo(object sender, EventArgs args)
    {
        string id;
        int nprod = Convert.ToInt32(DropDownList1.SelectedValue);
        BusinezMen.Content.BaseDados.ExecuteInsertServico(DescricaoServico.Text, tecnologia.SelectedValue, Preco.Text, Pontos.Text, "1");
        id = BusinezMen.Content.BaseDados.ExecuteSelectIdServico(DescricaoServico.Text, tecnologia.SelectedValue);
        
        for (int i=1; i<=nprod; i++){
            if(i == 1){
                BusinezMen.Content.BaseDados.ExecuteInsertProduto(Nome1.Text,Descricao1.Text,id);
            }
            if (i == 2)
            {
                BusinezMen.Content.BaseDados.ExecuteInsertProduto(Nome2.Text, Descricao2.Text, id);
            }
            if (i == 3)
            {
                BusinezMen.Content.BaseDados.ExecuteInsertProduto(Nome3.Text, Descricao3.Text, id);
            }
            if (i == 4)
            {
                BusinezMen.Content.BaseDados.ExecuteInsertProduto(Nome4.Text, Descricao4.Text, id);
            }
        }
        //call the method to execute insert to the database
        Response.Write("Record was successfully added!");
    }
</script>
    <form id="inserirServico" runat="server">
    <asp:Table ID="Alinhamento" runat="server" CellPadding="2" HorizontalAlign="Center" Width="100%">
        <asp:tableRow>
            <asp:TableCell Width="40%"><h4>Tipo de Serviço:</h4></asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:tableRow>
        <asp:TableRow >
            <asp:TableCell>
                <asp:Table ID="Table1" runat="server" CellPadding="2" HorizontalAlign="Center" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Right" VerticalAlign="Middle">Descrição:</asp:TableCell>
                        <asp:TableCell><asp:TextBox runat="server" ID="DescricaoServico" Width="350px" TextMode="MultiLine"/></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="Table3" runat="server" CellPadding="2" HorizontalAlign="Center" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center">Preço:</asp:TableCell>
                        <asp:TableCell HorizontalAlign="Center">Pontos:</asp:TableCell>
                        <asp:TableCell HorizontalAlign="Center">Tecnologia:</asp:TableCell>
                        <asp:TableCell HorizontalAlign="Center">N. de Produtos</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>                     
                        <asp:TableCell HorizontalAlign="Center"><asp:TextBox runat="server" ID="Preco" Width="50px"/></asp:TableCell>                        
                        <asp:TableCell HorizontalAlign="Center"><asp:TextBox runat="server" ID="Pontos" Width="50px" TextMode="Number"/></asp:TableCell>
                        <asp:TableCell HorizontalAlign="Center">
                            <asp:SqlDataSource runat="server" ID="tecnologias" 
                            connectionstring="<%$ ConnectionStrings:BaseDadosConnectionString%>"
                            SelectCommand="SELECT * FROM Tecnologia" />
                            <asp:DropDownList ID="tecnologia" runat="server" DataSourceID="tecnologias" DataTextField="Descricao" DataValueField="IdTecnologia">
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell HorizontalAlign="Center">
                            <asp:DropDownList id="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                 <asp:ListItem Value="1">1</asp:ListItem>
                                 <asp:ListItem Value="2">2</asp:ListItem>
                                 <asp:ListItem Value ="3">3</asp:ListItem>
                                 <asp:ListItem Value ="4">4</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="Table2" runat="server" CellPadding="2" HorizontalAlign="Center" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell><h4>Produtos:</h4></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Width="30%"><b>Produto 1 -</b></asp:TableCell>
                        <asp:TableCell>
                            <asp:Table ID="Table8" runat="server" CellPadding="0" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right">Nome:</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right"><asp:TextBox runat="server" ID="Nome1" Width="200px"/></asp:TableCell>
                                </asp:TableRow>
                                </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell>
                            <asp:Table ID="Table7" runat="server" CellPadding="0" HorizontalAlign="Center" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right" VerticalAlign="Middle">Descrição:</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right"><asp:TextBox runat="server" ID="Descricao1" Width="200px" TextMode="MultiLine"/></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>               
            </asp:TableCell>
            <asp:TableCell VerticalAlign="Top">
                <asp:Table ID="Table4" runat="server" CellPadding="2" HorizontalAlign="Center" Width="100%" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell Width="30%"><b>Produto 2 -</b></asp:TableCell>
                        <asp:TableCell>
                            <asp:Table ID="Table5" runat="server" CellPadding="0" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right">Nome:</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right"><asp:TextBox runat="server" ID="Nome2" Width="200px"/></asp:TableCell>
                                </asp:TableRow>
                                </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell>
                            <asp:Table ID="Table6" runat="server" CellPadding="0" HorizontalAlign="Center" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right" VerticalAlign="Middle">Descrição:</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right"><asp:TextBox runat="server" ID="Descricao2" Width="200px" TextMode="MultiLine"/></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="Table9" runat="server" CellPadding="2" HorizontalAlign="Center" Width="100%" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell Width="30%"><b>Produto 3 -</b></asp:TableCell>
                        <asp:TableCell>
                            <asp:Table ID="Table10" runat="server" CellPadding="0" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right">Nome:</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right"><asp:TextBox runat="server" ID="Nome3" Width="200px"/></asp:TableCell>
                                </asp:TableRow>
                                </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell>
                            <asp:Table ID="Table11" runat="server" CellPadding="0" HorizontalAlign="Center" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right" VerticalAlign="Middle">Descrição:</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right"><asp:TextBox runat="server" ID="Descricao3" Width="200px" TextMode="MultiLine"/></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="Table12" runat="server" CellPadding="2" HorizontalAlign="Center" Width="100%" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell Width="30%"><b>Produto 4 -</b></asp:TableCell>
                        <asp:TableCell>
                            <asp:Table ID="Table13" runat="server" CellPadding="0" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right">Nome:</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right"><asp:TextBox runat="server" ID="Nome4" Width="200px"/></asp:TableCell>
                                </asp:TableRow>
                                </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell>
                            <asp:Table ID="Table14" runat="server" CellPadding="0" HorizontalAlign="Center" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="Right" VerticalAlign="Middle">Descrição:</asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right"><asp:TextBox runat="server" ID="Descricao4" Width="200px" TextMode="MultiLine"/></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>                                                      
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell HorizontalAlign="Center"><asp:Button runat="server" Width="40%" ID="bt" Text="Adicionar Serviço" OnClick="ProcessInfo" /></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    </form>
</asp:Content>