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
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/LogIn.css" />
    <link rel="stylesheet" type="text/css" href="css/StyleSheet1.css" />
    <!--===============================================================================================-->

    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
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

                    <asp:HiddenField ID="hdn" runat="server" value="" />
                     <asp:HiddenField ID="hdn2" runat="server" value="" />

					<div class="container">
                    <asp:Label ID="lblEmail2" runat="server" Text="Enter Email" style="margin-left:40px;"></asp:Label>
                    <asp:Label ID="lblinputEmailError" Visible="false" runat="server" Text="Please input a valid Email Address" ForeColor="Red"></asp:Label>
                    <asp:TextBox class="input100"  runat="server" ID="txtEmail" name="pass" placeholder="Email Address" ClientIDMode="Static"></asp:TextBox>
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
						 <input type="button" value="HTML Continue" id="btnHtmlContinue" onclick="btnHtmlContinue_Click()" />
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
	

    <script>

        function btnHtmlContinue_Click() {
            var email = $("#hdn").val();
            //var email = $("#txtEmail").val();
           // var email = $("#txtEmail").val();
            var strURL = "https://localhost:44314/api/Fitness/GetEmail/";
            var url2 = strURL + email;

           //  var codes = new Object();
            //var f = true;

            //if (zipcode1 == "" || zipcode1 < 10000) {
            //    f = false;
            //    alert("Zipcode has an incorrect input. Please Try Again!")
            //}

            //if (f === true) {
                $.ajax({
                    type: "GET",
                    url: url2,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if ($("#txtVerification").val() == data) {
                            var strURL = "https://localhost:44314/api/Fitness/UpdateProgram/";
                            var url2 = strURL + email;
                            var strInput = JSON.stringify(email);

                            $.ajax({
                                type: "PUT",
                                url: url2,
                                contentType: "application/json",
                                dataType: "json",
                                data: strInput,
                                success: function (data) {
                                    alert("your account is verified");
                                },
                                error: function (req, status, error) {
                                    alert("error2");
                                }

                            });
                        }
                        else {
                            alert("verification code was wrong");
                        }
                     },
                    error: function (req, status, error) {
                        alert("error1");
                    }
                });          
        }
        
    </script>

</body>
</html>