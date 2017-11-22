<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TesteWeb.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />

</head>
<body>
    <div class="container">
        <form class="form-inline" runat="server">
            <div class="bs-example">
                <div class="form-group">
                    <label class="sr-only" for="exampleInputEmail3">Produto</label>
                    <asp:TextBox class="form-control" ID="TextBox1"  runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Pesquisar" class="btn btn-warning" OnClick="Button1_Click" />
                &nbsp;<asp:Button ID="Button2" runat="server" Text="Pesquisar" class="btn btn-warning" OnClick="Button2_Click" />
                <hr />
                <asp:GridView ID="GridView1" class="table table-bordered  table-hover table-responsive" runat="server"></asp:GridView>
            </div>
        </form>
    </div>
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</body>
</html>
