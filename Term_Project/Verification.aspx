<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Verification.aspx.cs" Inherits="Term_Project.Verification" %>

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
						Forgot Password?
					</span>


					<div class="container">
                    <asp:Label ID="lblEmail2" runat="server" Text="Enter Email" style="margin-left:40px;"></asp:Label>
                    <asp:Label ID="lblinputEmailError" Visible="false" runat="server" Text="Please input a valid Email Address" ForeColor="Red"></asp:Label>
                    <asp:TextBox class="input100"  runat="server" ID="txtEmail" name="pass" placeholder="Email Address"></asp:TextBox>
                    <span class="focus-input100" data-placeholder="&#xf207;"></span>
						</div>


					<div class="container">
                    <asp:Label ID="lblVerification" Visible="false" runat="server" style="margin-left:40px;"></asp:Label>
                    <asp:Label ID="lblInputPassError" Visible="false" runat="server" Text="Please input a valid code" ForeColor="Red"></asp:Label>
                    <asp:TextBox class="input100" Visible="false" runat="server" ID="txtVerification" name="pass" placeholder="number"></asp:TextBox>
                    <span class="focus-input100" data-placeholder="&#xf207;"></span>
						</div>

                    <div class="container-login100-form-btn">
                        <asp:Button ID="btnContinue" runat="server" class="login100-form-btn" Text="Continue" OnClick="btnContinue_Click" />
                    </div>
                    <div class="container-login100-form-btn">
                        <asp:Button ID="btnSignIn" runat="server" Visible="false" class="login100-form-btn" Text="Sign-In" OnClick="btnSignIn_Click" />
                    </div>

                    <div class="text-center p-t-90">
                        <a class="txt1" id="btnBackToHome2" runat="server" href="LogIn.aspx">Back To Sign-In</a>
                    </div>

                    <div class="container-login100-form-btn">
                        <asp:Button ID="btnBack" runat="server" class="login100-form-btn" Text="Back" OnClick="btnBack_Click" Visible="false"/>
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