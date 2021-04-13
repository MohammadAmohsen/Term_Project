<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Explore2.aspx.cs" Inherits="Term_Project.Explore2" %>

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
<%--    nav bar start--%>
     <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-primary">
      <a class="navbar-brand" href="#">Moe's Gym</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="HomePage.aspx">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Explore</a>
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
          </div>
         </nav>
 
    <br />    <br />
    <br />    <br />
    <br />    <br />
    <br />    <br />
    <br />

<%--          end nav bar--%>


    <form class="form-inline my-2 my-lg-0" runat="server">
        <div style="text-align: center; margin-left:auto; margin-right:auto;">

            <table>
                <tr style="color: #CC3300;">
 

                </tr>

                <asp:Repeater ID="rptPrograms" runat="server" OnItemCommand="rptPrograms_OnItemCommand">
                    <ItemTemplate>
                        <tr>

                            <td>
                                <asp:Image ID="lblProgramImage" Height="100px" Width="100px" runat="server" ImageUrl='<%# Eval("ProgramImage") %>' />

                            </td>
                        </tr>

                        <tr>

                            <td>
                                <asp:Label ID="lblProgramName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProgramName") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>

                            <td>
                                <asp:Label ID="lblProgramDesc" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblProgramDescription" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateAdded") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblProgramType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProgramType") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblProgramExperience" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProgramExperience") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>

                            <td>
                                <asp:Label ID="lblAmountOfDays" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AmountOfDays") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnDetailView" class="btn btn-primary" Text="Open Program" runat="server" OnClick="btnDetailView_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnSaveProgram"  class="btn btn-primary" Text="Save" runat="server" OnClick="btnSaveProgram_Click"  />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>                               
            <asp:Button ID="btnBack"  visible="false" class="btn btn-primary" Text="Back" runat="server" OnClick="btnBack_Click"  />

            </div>
    </form>


    <!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
</body>
</html>
