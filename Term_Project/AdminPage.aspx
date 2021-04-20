<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Term_Project.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    	<meta name="viewport" content="width=device-width, initial-scale=1"/>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/LogIn.css"/>
	<link rel="stylesheet" type="text/css" href="css/StyleSheet1.css"/>
<!--===============================================================================================-->
</head>
<body>
    <form id="form1" runat="server">

    <div id="youShallNotPass" runat="server" class="text-center">
    <h2 class="text-center">You Must Log In To See This Site!</h2>
    <img src="Images2/ShallNotPass.gif" style="margin-top: 100px;"/>
         <form runat="server">
        <asp:Button ID="btnBackToLogin" class="btn btn-primary" runat="server" Text="BackToLogin" OnClick="btnBackToLogin_Click" style="margin-top:100px;"/>
             </form>
        </div>

    <%--    nav bar start--%>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-primary" id="navBar" runat="server">
      <a class="navbar-brand" href="#">Moe's Gym</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Explore.aspx">Explore</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Programs</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My Profile</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </li>
        </ul>     

<%--          end nav bar--%>
        <div>
            <asp:Button ID="btnCreateAdmin" class="btn btn-info" runat="server" Text="Create Admin" OnClick="btnCreateAdmin_Click" />
            <asp:Button ID="btnCreateProgram" class="btn btn-info" runat="server" Text="Create Workout" OnClick="btnCreateWorkOut_Click"  />
            <asp:Button ID="btnLogOut" class="btn btn-info" runat="server" Text="LogOut" OnClick="btnLogOut_Click" />
            <asp:Button ID="btnMessages" class="btn btn-info" runat="server" Text="Messages" OnClick="btnMessages_Click" />

        </div>
 </nav>
 
    <br />
    <br />
    <br />

    
        <!-- Content Row -->
        <div class="row justify-content-center" runat="server" id="ContentID">
                <asp:GridView ID="gvManageAccounts" style="margin-left:auto; margin-right:auto;" Visible="true" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="90%">
                    <Columns>
                        <asp:TemplateField HeaderText="Select: ">
                            <ItemTemplate>
                                <asp:CheckBox ID="cbSelect" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:ImageField DataImageUrlField="UserImage" HeaderText="UserImage" ControlStyle-Width="100" ControlStyle-Height="100">
                            <ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                         <asp:BoundField DataField="FirstName" HeaderText="UserName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName: " />
                        <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" />
                        <asp:BoundField DataField="DateCreated" HeaderText="DateCreated:" />
                        <asp:BoundField DataField="userWeight" HeaderText="User Weight" />
                        <asp:BoundField DataField="userAge" HeaderText="User Age: " />
                        <asp:BoundField DataField="UserGoals" HeaderText="User Goals:" />
                        <asp:BoundField DataField="userTrainingType" HeaderText="User Training Type: " />
                        <asp:BoundField DataField="Experience" HeaderText="Experience:" />
                        <asp:BoundField DataField="amountOfDays" HeaderText="Amount Of Days:" />
                        <asp:BoundField DataField="programName" HeaderText="Program:" />

                    </Columns>
                </asp:GridView>



        </div>
    </form>

</body>
</html>
