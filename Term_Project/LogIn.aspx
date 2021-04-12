<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Term_Project.LogIn" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Moe's Fitness</title>
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
<!--===============================================================================================-->
</head>
<body>
	
         <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top " runat="server" id="headerNav">
            <a class="navbar-brand" href="Default.aspx">Moe's Fitness</a>
        </nav>
    </header>

	<div class="limiter">
		<div class="container-login100" style="background-image: url('images2/background3.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" runat="server">
					<img id="imgLogo"  src="Images2/Logo.PNG" /> 

					<span class="login100-form-title p-b-34 p-t-27">
						Log in
					</span>

					<div class="wrap-input100 validate-input" id="lblEmail" runat="server" data-validate = "Enter Email">
						 <asp:Label ID="lblinputEmailError" Visible="false" runat="server" Text="Please input a valid Email Address" ForeColor="Red"></asp:Label>
                         <asp:TextBox class="input100" runat="server" id="txtEmail" name="pass" placeholder="Email Address"></asp:TextBox>
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" runat="server" id="lblPassword" data-validate="Enter password">
				    <asp:Label ID="lblInputPassError" Visible="false" runat="server" Text="Please input a valid Password" ForeColor="Red"></asp:Label>
						<asp:TextBox class="input100" runat="server" type="password" id="txtPassword" name="pass" placeholder="Password"></asp:TextBox>
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<div class="contact100-form-checkbox">
                        <asp:CheckBox ID="cbRememberMe"  runat="server" AutoPostBack="True" /><p style="display:inline; color:white;"> Remember Me</p>
					</div>
 
					<div class="container-login100-form-btn">
						<asp:Button ID="btnLogin" runat="server" class="login100-form-btn" Text="Log-In" type="submit" OnClick="btnLogin_Click"/>
 
					</div>
											<br />

			    	<div class="container-login100-form-btn">
 						<asp:Button ID="btnSignUp" runat="server" class="login100-form-btn" Text="Sign-Up" OnClick="btnSignUp_Click"/>

			    	</div>
 
					<div class="text-center p-t-90">
						<a class="txt1" href="ForgotPassword.aspx">
							Forgot Password?
						</a>
						<br />
						<a class="txt1" href="Verification.aspx">
							Verify Your Email
						</a>
					</div>


				</form>
			</div>
		</div>
	</div>
	
	
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