<%@ Page Title="Adicionar Pessoal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Adicionar_Pessoal.aspx.cs" Inherits="BusinezMen.Adicionar_Pessoal" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<script type="text/javascript" src="Scripts/googlemaps.js"></script>
<script runat="server">
    private void ProcessInfo(object sender, EventArgs args)
    {
        string codpostal = cod1.Text + '-' + cod2.Text;
        string idMorada, idCoordenadas;
        //call the method to execute insert to the database
        BusinezMen.Content.BaseDados.ExecuteInsertCoordenadas(Convert.ToString(latitude.Value), Convert.ToString(longitude.Value));
        idCoordenadas = BusinezMen.Content.BaseDados.ExecuteSelectIdCoordenadas(Convert.ToString(latitude.Value), Convert.ToString(longitude.Value));
        BusinezMen.Content.BaseDados.ExecuteInsertMorada(rua.Text, porta.Text, localidade.Text, codpostal, concelho.SelectedValue, idCoordenadas);
        idMorada = BusinezMen.Content.BaseDados.ExecuteSelectIdMorada(rua.Text, localidade.Text);
        BusinezMen.Content.BaseDados.ExecuteInsertDados(equipa.SelectedValue, funcao.SelectedValue, nome.Text, bi.Text, nif.Text, telefone.Text, email.Text, "1", idMorada);
        Response.Write("Record was successfully added!");
    }
</script>
<form id="inserirFuncionario" runat="server">
    <asp:Table ID="Table" runat="server" BorderWidth="0" CellPadding="2"  GridLines="horizontal" HorizontalAlign="Center" Width="100%">
        <asp:tableRow>
            <asp:TableCell>                   
                <asp:Table ID="Table3" runat="server" BorderWidth="0" CellPadding="0"  GridLines="horizontal" HorizontalAlign="Left" Width="100%">
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <h4>Dados Pessoais:</h4>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="Table8" runat="server" BorderWidth="0" CellPadding="2"  GridLines="horizontal" HorizontalAlign="Left" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell>Nome:</asp:TableCell>
                        <asp:TableCell><asp:TextBox runat="server" ID="nome" Width="415px" MaxLength="50"/></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="Table4" runat="server" BorderWidth="0" CellPadding="2"  GridLines="horizontal" HorizontalAlign="Left" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell>Bilhete de Identidade:</asp:TableCell>
                        <asp:TableCell><asp:TextBox runat="server" ID="bi" Width="64px" MaxLength="20"/></asp:TableCell>
                        <asp:TableCell>Número de Contribuinte: </asp:TableCell>
                        <asp:TableCell><asp:TextBox runat="server" ID="nif" Width="64px" MaxLength="20"/></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="Table5" runat="server" BorderWidth="0" CellPadding="2"  GridLines="horizontal" HorizontalAlign="Left" Width="100%">
                <asp:TableRow>
                    <asp:TableCell>Telefone:</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="telefone" Width="80px" MaxLength="9" TextMode="Phone"/></asp:TableCell>
                    <asp:TableCell>Email:</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="email" Width="265px" MaxLength="50" TextMode="Email"/></asp:TableCell>
                </asp:TableRow>
                </asp:Table>
                <asp:Table ID="Table9" runat="server" BorderWidth="0" CellPadding="0"  GridLines="horizontal" HorizontalAlign="Left" Width="100%">
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <h4>Morada:</h4>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="Table7" runat="server" BorderWidth="0" CellPadding="2"  GridLines="horizontal" HorizontalAlign="Left" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell>Rua:</asp:TableCell>
                        <asp:TableCell><asp:TextBox runat="server" ID="rua" Width="240px" onChange="return FindLocation()"/></asp:TableCell>
                        <asp:TableCell>Localidade:</asp:TableCell>
                        <asp:TableCell><asp:TextBox runat="server" ID="localidade" Width="100px" onChange="return FindLocation()"/></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="Table6" runat="server" BorderWidth="0" CellPadding="2"  GridLines="horizontal" HorizontalAlign="Left" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell>Porta:</asp:TableCell>
                        <asp:TableCell><asp:TextBox runat="server" ID="porta" Width="28px" MaxLength="4"/></asp:TableCell>
                        <asp:TableCell>Código Postal:</asp:TableCell>
                        <asp:TableCell><asp:TextBox runat="server" ID="cod1" Width="30px" MaxLength="4"/>-<asp:TextBox runat="server" ID="cod2" Width="25px" MaxLength="3"/></asp:TableCell>
                        <asp:TableCell>Concelho:</asp:TableCell>
                        <asp:TableCell>
                        <asp:SqlDataSource runat="server" ID="concelhos" 
                        connectionstring="<%$ ConnectionStrings:BaseDadosConnectionString%>"
                        SelectCommand="select * from Concelho" />
                        <asp:DropDownList ID="concelho" runat="server" DataSourceID="concelhos" DataTextField="NomeConcelho" DataValueField="IdConcelho">
                        </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="Table10" runat="server" BorderWidth="0" CellPadding="0"  GridLines="horizontal" HorizontalAlign="Left" Width="100%">
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                            <h4>Cargo:</h4>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table runat="server" ID="Table1" BorderWidth="0" CellPadding="2"  GridLines="horizontal" HorizontalAlign="Left" Width="100%">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:SqlDataSource runat="server" ID="cargos" 
                        connectionstring="<%$ ConnectionStrings:BaseDadosConnectionString%>"
                        SelectCommand="SELECT IdCargo,tipo from Cargo" /> 
                        <asp:RadioButtonList runat="server" ID="funcao" RepeatDirection="Horizontal" TextAlign="Left" Width="450px" DataSourceID="cargos" DataTextField="tipo" DataValueField="IdCargo">
                        </asp:RadioButtonList>
                    </asp:TableCell>                       
                </asp:TableRow>                    
                </asp:Table>
                <asp:Table runat="server" ID="Table2" BorderWidth="0" CellPadding="2" GridLines="horizontal" HorizontalAlign="Left" Width="30%">
                <asp:TableRow>
                    <asp:TableCell>Equipa:</asp:TableCell>
                    <asp:TableCell>
                        <asp:SqlDataSource runat="server" ID="equipas" 
                        connectionstring="<%$ ConnectionStrings:BaseDadosConnectionString%>"
                        SelectCommand="select IdEquipa from Equipa" />
                        <asp:DropDownList ID="equipa" runat="server" DataSourceID="equipas" DataTextField="IdEquipa" DataValueField="IdEquipa">
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
            <asp:TableCell>
                <div id="map" style="width: 380px; height: 370px"></div>
            </asp:TableCell>
        </asp:tableRow>
        <asp:TableRow>
            <asp:TableCell>                   
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Center"><asp:Button runat="server" Width="30%" ID="bt" Text="Confirmar" OnClick="ProcessInfo" /></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
<asp:HiddenField ID="latitude" runat="server"/>
<asp:HiddenField ID="longitude" runat="server"/>
</form>
<script type="text/javascript">
    window.onload = InitializeMap;

    function FindLocation() {
        geocoder = new google.maps.Geocoder();
        InitializeMap();

        var txtAddress1 = document.getElementById("<%= rua.ClientID %>");
        var txtAddress2 = document.getElementById("<%= localidade.ClientID %>");
        var address1 = txtAddress1.value;
        var address2 = txtAddress2.value;
        var address = address1.concat(", ").concat(address2);
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location

                });
                GetCoordinates();
            }
            else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
    }

    function GetCoordinates() {
        geocoder = new google.maps.Geocoder();

        var txtAddress = document.getElementById("<%= rua.ClientID %>");
        var address = txtAddress.value;
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var latitude = results[0].geometry.location.lat();
                var longitude = results[0].geometry.location.lng();
                var hiddenLon = '<%: longitude.ClientID %>';
                var hiddenLat = '<%= latitude.ClientID %>';
                document.getElementById(hiddenLat).value = latitude;
                document.getElementById(hiddenLon).value = longitude;
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });

    }

    function InitializeMap() {

        var latlng = new google.maps.LatLng(41.561390, -8.397591);
        var myOptions =
        {
            zoom: 15,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            //disableDefaultUI: true
        };
        map = new google.maps.Map(document.getElementById("map"), myOptions);
    }
</script>            
</asp:Content>