<%@ Page Title="Procurar Cliente" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Procurar_Cliente.aspx.cs" Inherits="BusinezMen.Procurar_Cliente" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script runat="server">

    private void ProcessClick( object sender, EventArgs args ) {
        source.SelectParameters[ "nome" ].DefaultValue =
            letra.Text + "%";
    }

</script>
    <form id="form1" runat="server">
   Introduza a letra: 
   <asp:TextBox ID="letra" runat="server" />
   <asp:Button ID="bt" runat="server" Text="Button" 
     OnClick="ProcessClick"  />
   <asp:GridView runat="server" id="grid" DataSourceID="source" />
   <asp:SqlDataSource runat="server" ID="source" 
     connectionstring="<%$ ConnectionStrings:BaseDadosConnectionString %>"
     SelectCommand="SELECT Nome from Utilizador where Nome like @nome">
     <SelectParameters>
      <asp:Parameter Direction="Input" 
               Name="nome" 
               Type="string" ConvertEmptyStringToNull="true" />
     </SelectParameters>
   </asp:SqlDataSource>
 </form>
</asp:Content>