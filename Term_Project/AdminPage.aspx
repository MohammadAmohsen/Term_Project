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
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnCreateAdmin" class="btn btn-info" runat="server" Text="Create Admin" OnClick="btnCreateAdmin_Click" />
            <asp:Button ID="btnCreateProgram" class="btn btn-info" runat="server" Text="Create Workout" OnClick="btnCreateWorkOut_Click"  />
            <asp:Button ID="btnLogOut" class="btn btn-info" runat="server" Text="LogOut" OnClick="btnLogOut_Click" />
            <asp:Button ID="btnMessages" class="btn btn-info" runat="server" Text="Messages" OnClick="btnMessages_Click" />

        </div>
    </form>

      </div>
    </nav>

    <br/>
    <br/>
     <br/>

    <div>

         <!-- Content Row -->
                    <div class="row" runat="server" id="ContentID">
                        <center>
                        <div class="col-lg-8 mb-4">

                            <!-- Illustrations -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Users List</h6>
                                </div>
                                <div class="card-body">
                                    <div class="text-center">
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                                            src="img/undraw_posting_photo.svg" alt="">
                                    </div>
                                    <p>Display list of users
                                    </p>
                                    <a target="_blank" rel="nofollow" href="https://undraw.co/">Click Here &rarr;</a>
                                </div>
                            </div>

                            <!-- Approach -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Complete Current Workout</h6>
                                </div>
                                <div class="card-body">
                                    <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce
                                        CSS bloat and poor page performance. Custom CSS classes are used to create
                                        custom components and custom utility classes.</p>
                                    <p class="mb-0">Before working with this theme, you should become familiar with the
                                        Bootstrap framework, especially the utility classes.</p>
                                </div>
                            </div>

                        </div>
                            </center>
                    </div>



    </div>


</body>
</html>
