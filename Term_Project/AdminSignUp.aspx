﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminSignUp.aspx.cs" Inherits="Term_Project.AdminSignUp" %>

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
        <link href="Css/SignUpCSS.css" rel="stylesheet" />

<!--===============================================================================================-->
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top " id="headerNav">
            <a class="navbar-brand" href="Default.aspx">Moe's Fitness - Admin</a>
        </nav>
    </header>
 <div class="container-login100" style="background-image: url('images2/background3.jpg');">

	  <form id="form1" runat="server" class="form-signin text-center">
        <div id="userInput" class="d-flex justify-content-center text-center">
            <div class="card" id="cardSize" runat="server" style="width: 50rem; height: auto;">
                <div class="container">
                    <br />

                    <div class="row">
                        <br />

                        <div class="col-md-1 mb-3">
                            <img src="../Images2/Logo.png" width="100" height="100" />
                        </div>
                        <br />

                        <div class="col-md-8 mb-3" id="Heading">
                            <h4 class="mb-3">Admin Sign Up!</h4>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="username">Username</label>
                            <asp:TextBox ID="txtUserName" runat="server" class="form-control" placeholder="Name" autofocus=""></asp:TextBox>
                            <div class="invalid-feedback">Your Username Is Required</div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="Avatar">What is your experience level?</label><br />
                            <asp:Image ID="profilePicture" runat="server" ImageUrl="../Images2/Admin1.png" Width="110" Height="110" class="rounded" />
                            <asp:DropDownList ID="ddlImage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlImage_SelectedIndexChanged"  >
                                <asp:ListItem Selected="True" Value="Admin1">Admin 1</asp:ListItem>
                                <asp:ListItem Value="Admin2">Admin 2</asp:ListItem>
                                <asp:ListItem Value="Admin3">Admin 3</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                   <br />

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="FirstName">First Name</label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="John"></asp:TextBox>
                            <div class="invalid-feedback">Your First Name is required!</div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="LastName">Last Name</label><br />
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Doe"></asp:TextBox>
                            <div class="invalid-feedback">Your Last Name is required!</div>
                        </div>

                    </div>
                    <br />

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="Address">Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="1234 Fake St"></asp:TextBox>
                            <div class="invalid-feedback">Your address is required!</div>
                        </div>

                         <div class="col-md-6 mb-3">
                            <label for="Address">Billing Address</label>
                            <asp:TextBox ID="txtBillingAddress" runat="server" CssClass="form-control" placeholder="1234 Fake St"></asp:TextBox>
                            <div class="invalid-feedback">Your Billing address is required!</div>
                        </div>

                    </div>
                    <br />

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="NewEmail">New Email</label>
                            <asp:TextBox ID="txtNewEmail" runat="server" CssClass="form-control" placeholder="fake@email.com"></asp:TextBox>
                            <div class="invalid-feedback">Your address is required!</div>
                        </div>
                        <br />


                       <div class="col-md-6 mb-3">
                            <label for="PhoneNumber">Phone Number</label><br />
                            <asp:TextBox ID="txtPhoneNumber" runat="server" type="number" CssClass="form-control" placeholder="XXX-XXX-XXXX"></asp:TextBox>
                            <div class="invalid-feedback">Your Phone Number is required!</div>
                        </div>

                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                            <asp:Label ID="lblPassError" runat="server" Text="Passwords Do NOT Match!" ForeColor="#CC0000" Visible="False"></asp:Label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="xxxxxxxxx" type="password"></asp:TextBox>
                        </div>
                        <br />


                        <div class="col-md-6 mb-3">
                            <asp:Label ID="lblPassword1" runat="server" Text="Re-Enter Password"></asp:Label>
                            <asp:Label ID="lblPassError1" runat="server" Text="Passwords Do NOT Match!" ForeColor="#CC0000" Visible="False"></asp:Label>
                            <asp:TextBox ID="txtPasswordReenter" runat="server" CssClass="form-control" placeholder="xxxxxxx" type="password"></asp:TextBox>
                        </div>

                    </div>

    <!---------------------------------------------------- Security Question 1------------------------------------------------------------------------------------------>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <asp:Label ID="SQ1" runat="server" Text="Security Question 1"></asp:Label>
                                 <asp:DropDownList ID="ddlSQ1" runat="server" AutoPostBack="true" >
                                <asp:ListItem Selected="True">What's your favorite animal?</asp:ListItem>
                                <asp:ListItem>What was your first school called?</asp:ListItem>
                                <asp:ListItem>What's your favorite food?</asp:ListItem>
                                <asp:ListItem>What's your favorite color?</asp:ListItem>
                            </asp:DropDownList>                        </div>
                        <br />


                        <div class="col-md-6 mb-3">
                            <asp:Label ID="lblSQ1Answer" runat="server" Text="Security Question 1 Answer"></asp:Label>
                            <asp:Label ID="lblSQ1AnswerError" runat="server" Text="Text Can't Be Empty!" ForeColor="#CC0000" Visible="False"></asp:Label>
                            <asp:TextBox ID="txtSQ1Answer" runat="server" CssClass="form-control" placeholder="xxxxxxx"></asp:TextBox>
                        </div>

                    </div>
   <!---------------------------------------------------- Security Question 2------------------------------------------------------------------------------------------>


                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <asp:Label ID="lblSQ2" runat="server" Text="Security Question 2"></asp:Label>
                                 <asp:DropDownList ID="ddlSQ2" runat="server" AutoPostBack="true"  >
                                <asp:ListItem Selected="True">What's your favorite animal?</asp:ListItem>
                                <asp:ListItem>What was your first school called?</asp:ListItem>
                                <asp:ListItem>What's your favorite food?</asp:ListItem>
                                <asp:ListItem>What's your favorite color?</asp:ListItem>
                            </asp:DropDownList>                        

                        </div>
                        <br />


                        <div class="col-md-6 mb-3">
                            <asp:Label ID="lblSQ2Answer" runat="server" Text="Security Question 2 Answer"></asp:Label>
                            <asp:Label ID="lblSQ2Error" runat="server" Text="Text Can't Be Empty!" ForeColor="#CC0000" Visible="False"></asp:Label>
                            <asp:TextBox ID="txtSQ2Answer" runat="server" CssClass="form-control" placeholder="xxxxxxx" ></asp:TextBox>
                        </div>

                    </div>
   <!---------------------------------------------------- Security Question 3------------------------------------------------------------------------------------------>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <asp:Label ID="lblSQ3" runat="server" Text="Security Question 3"></asp:Label>
                                 <asp:DropDownList ID="ddlSQ3" runat="server" AutoPostBack="true"  >
                                <asp:ListItem Selected="True">What's your favorite animal?</asp:ListItem>
                                <asp:ListItem>What was your first school called?</asp:ListItem>
                                <asp:ListItem>What's your favorite food?</asp:ListItem>
                                <asp:ListItem>What's your favorite color?</asp:ListItem>
                            </asp:DropDownList>                        </div>
                        <br />


                        <div class="col-md-6 mb-3">
                            <asp:Label ID="lblSQ3Answer" runat="server" Text="Security Question 1 Answer"></asp:Label>
                            <asp:Label ID="lblSQ3Error" runat="server" Text="Text Can't Be Empty!" ForeColor="#CC0000" Visible="False"></asp:Label>
                            <asp:TextBox ID="txtSQ3Answer" runat="server" CssClass="form-control" placeholder="xxxxxxx" ></asp:TextBox>
                        </div>

                    </div>
                    <hr />

                 

                    <asp:Button ID="btnCreate" runat="server" class="btn btn-md btn-block" type="submit" Text="Create Your Account!" OnClick="btnCreate_Click1" />
                    <asp:Button ID="btnBack" class="btn btn-md btn-light btn-block" runat="server" Text="Back To Admin Page!" OnClick="btnBackToSign_Click" />

                </div>
            </div>
        </div>
    </form>
     </div>

</body>
</html>