<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Term_Project.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Login V3</title>
	<meta charset="UTF-8"/>
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
            <a class="navbar-brand" href="Default.aspx">Moe's Fitness</a>
        </nav>
    </header>
 <div class="container-login100" style="background-image: url('images2/background3.jpg');">

	  <form id="form1" runat="server" class="form-signin text-center">
        <div id="userInput" class="d-flex justify-content-center text-center">
            <div class="card" style="width: 50rem; height: 60rem;">
                <div class="container">
                    <br />

                    <div class="row">
                        <br />

                        <div class="col-md-1 mb-3">
                            <img src="../Images2/Logo.png" width="100" height="100" />
                        </div>
                        <br />

                        <div class="col-md-8 mb-3" id="Heading">
                            <h4 class="mb-3">Create Your Very Own Account!</h4>
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
                            <label for="Avatar">Select A Profile Picture!</label><br />
                            <asp:Image ID="profilePicture" runat="server" ImageUrl="../Images2/beginner.png" Width="110" Height="110" class="rounded" />
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Selected="True">Beginner</asp:ListItem>
                                <asp:ListItem>Intermediate</asp:ListItem>
                                <asp:ListItem>Advanced</asp:ListItem>
                            </asp:DropDownList>
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
                            <label for="PhoneNumber">Phone Number</label><br />
                            <asp:TextBox ID="txtPhoneNumber" runat="server" type="number" CssClass="form-control" placeholder="XXX-XXX-XXXX"></asp:TextBox>
                            <div class="invalid-feedback">Your Phone Numver is required!</div>
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
                            <label for="SecurityEmail">Security Email</label>
                            <asp:TextBox ID="txtSecurityEmail" runat="server" CssClass="form-control" placeholder="fake@email.com"></asp:TextBox>
                            <div class="invalid-feedback">Your Seucrity Email Address is required!</div>
                        </div>
                        <br />

                    </div>
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
                    <hr />

                    <div class="form-check">
                        <label for="UserType">Would you like our assistance in finding you the best possible workout?</label>
                        <br />

                        <asp:RadioButtonList ID="rbUser" CssClass="radioButtonList" runat="server" style="margin-left:300px;" RepeatDirection="Vertical"  >
                            <asp:ListItem Value="User" Selected="True">Yes, I would love some help!</asp:ListItem>
                            <asp:ListItem Value="Admin">Nah I'm a fucking idiot</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <hr />

                    <asp:Button ID="btnCreate" runat="server" class="btn btn-md btn-block" type="submit" Text="Create Your Account!" OnClick="btnCreate_Click1" />
                    <asp:Button ID="btnBackToSign" class="btn btn-md btn-light btn-block" runat="server" Text="Sign-In Instead" OnClick="btnBackToSign_Click" />

                </div>
            </div>
        </div>
    </form>
     </div>

</body>
</html>