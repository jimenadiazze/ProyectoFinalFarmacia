<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Crud_WebForms.Farmacia" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2>Gestión de Productos - Farmacia</h2>
            
            <asp:Label ID="lblCodigo" runat="server" CssClass="badge bg-primary" Text="Código"></asp:Label>
            <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" placeholder="Ejem. MED001"></asp:TextBox>
            <br />
            
            <asp:Label ID="lblNombre" runat="server" CssClass="badge bg-primary" Text="Nombre"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            
            <asp:Label ID="lblDesc" runat="server" CssClass="badge bg-primary" Text="Descripción"></asp:Label>
            <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
            <br />
    
            <asp:Label ID="lblPrecio" runat="server" CssClass="badge bg-primary" Text="Precio"></asp:Label>
            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" placeholder="0.00"></asp:TextBox>
            <br />
    
            <asp:Label ID="lblExistencias" runat="server" CssClass="badge bg-primary" Text="Existencias"></asp:Label>
            <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            <br />
    
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-success" OnClick="btnActualizar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMensaje" CssClass="form-label fw-bold" runat="server" Text=""></asp:Label>
            <br /><br />
    
            <h4>Lista de Productos</h4>
            <asp:GridView ID="gridProductos" runat="server" AutoGenerateColumns="False" 
                CssClass="table table-striped table-bordered" DataKeyNames="id"
                OnSelectedIndexChanged="gridProductos_SelectedIndexChanged"
                OnRowDeleting="gridProductos_RowDeleting">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btn_Seleccionar" runat="server" CausesValidation="False" 
                                CommandName="Select" Text="Seleccionar" CssClass="btn btn-info btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btn_Eliminar" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="Eliminar" CssClass="btn btn-danger btn-sm" 
                                OnClientClick="return confirm('¿Está seguro de eliminar este producto?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="codigo" HeaderText="Código" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                    <asp:BoundField DataField="precio_publico" HeaderText="Precio" DataFormatString="{0:C2}" />
                    <asp:BoundField DataField="existencias" HeaderText="Existencias" />
                </Columns>
                <EmptyDataTemplate>
                    <div class="alert alert-warning">No hay productos registrados</div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </form>
</body>
</html>