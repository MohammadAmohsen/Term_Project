<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Term_Project.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Login V3</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />
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
                <div class="card" style="width: 50rem; height: 110rem;">
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
                                <label for="Avatar">What is your Experience Level?</label><br />
                                <asp:Image ID="profilePicture" runat="server" ImageUrl="../Images2/beginner.png" Width="110" Height="110" class="rounded" />
                                <asp:DropDownList ID="ddlImage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlImage_SelectedIndexChanged">
                                    <asp:ListItem Selected="True">Beginner</asp:ListItem>
                                    <asp:ListItem>Intermediate</asp:ListItem>
                                    <asp:ListItem>Advanced</asp:ListItem>
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
                                <asp:TextBox ID="txtLastName" runat="server" type="number" CssClass="form-control" placeholder="Doe"></asp:TextBox>
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
                                <label for="PhoneNumber">Phone Number</label><br />
                                <asp:TextBox ID="txtPhoneNumber" runat="server" type="number" CssClass="form-control" placeholder="XXX-XXX-XXXX"></asp:TextBox>
                                <div class="invalid-feedback">Your Phone Number is required!</div>
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

                        <!---------------------------------------------------- Security Question 1------------------------------------------------------------------------------------------>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <asp:Label ID="SQ1" runat="server" Text="Security Question 1"></asp:Label>
                                <asp:DropDownList ID="ddlSQ1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSQ1_SelectedIndexChanged">
                                    <asp:ListItem Selected="True">What's your favorite animal?</asp:ListItem>
                                    <asp:ListItem>What was your first school called?</asp:ListItem>
                                    <asp:ListItem>What's your favorite food?</asp:ListItem>
                                    <asp:ListItem>What's your favorite color?</asp:ListItem>
                                </asp:DropDownList>
                            </div>
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
                                <asp:DropDownList ID="ddlSQ2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSQ2_SelectedIndexChanged">
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
                                <asp:TextBox ID="txtSQ2Answer" runat="server" CssClass="form-control" placeholder="xxxxxxx"></asp:TextBox>
                            </div>

                        </div>
                        <!---------------------------------------------------- Security Question 3------------------------------------------------------------------------------------------>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <asp:Label ID="lblSQ3" runat="server" Text="Security Question 3"></asp:Label>
                                <asp:DropDownList ID="ddlSQ3" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSQ3_SelectedIndexChanged">
                                    <asp:ListItem Selected="True">What's your favorite animal?</asp:ListItem>
                                    <asp:ListItem>What was your first school called?</asp:ListItem>
                                    <asp:ListItem>What's your favorite food?</asp:ListItem>
                                    <asp:ListItem>What's your favorite color?</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <br />


                            <div class="col-md-6 mb-3">
                                <asp:Label ID="lblSQ3Answer" runat="server" Text="Security Question 1 Answer"></asp:Label>
                                <asp:Label ID="lblSQ3Error" runat="server" Text="Text Can't Be Empty!" ForeColor="#CC0000" Visible="False"></asp:Label>
                                <asp:TextBox ID="txtSQ3Answer" runat="server" CssClass="form-control" placeholder="xxxxxxx"></asp:TextBox>
                            </div>

                        </div>
                        <hr />

                        <%--                    Custom Account Selection--%>


                        <div class="form-check">
                            <label for="UserType">Would you like our assistance in finding you the best possible workout?</label>
                            <br />

                            <asp:RadioButtonList ID="rbAnswer" CssClass="radioButtonList" runat="server" Style="margin-left: 300px;" RepeatDirection="Vertical" OnSelectedIndexChanged="rbAnswer_SelectedIndexChanged">
                                <asp:ListItem Value="No" Selected="True">No</asp:ListItem>
                                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <hr />

                        <center>

                        <%--        ------------------------------------------  Weight Question-------------------------------------------------------%>

                        <div class="row">
                            <div class="col mb-3">
                                <asp:Label ID="LabelWeight" runat="server" Text="What is your current weight (lbs)?" Visible="False"></asp:Label>

                                <div class="col-md-6 mb-3">
                                    <asp:Label ID="Label3" runat="server" Text="Text Can't Be Empty!" ForeColor="#CC0000" Visible="False"></asp:Label>
                                    <asp:TextBox ID="TextBoxWeight" Visible="false" runat="server" CssClass="form-control" placeholder="135"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--        ------------------------------------------ Goal Question-------------------------------------------------------%>

                        <div class="row">
                            <div class="col mb-3">
                                <asp:Label ID="LabelGoals" runat="server" Visible="false" Text="What are your fitness goals"></asp:Label>

                                <asp:DropDownList ID="dropdownlistGoals" runat="server" AutoPostBack="true" Visible="false" OnSelectedIndexChanged="ddlSQ3_SelectedIndexChanged">
                                    <asp:ListItem Selected="True">Gain Weight?</asp:ListItem>
                                    <asp:ListItem>Lose Weight</asp:ListItem>
                                    <asp:ListItem>Maintain Weight</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <br />

                        </div>

                        <%--        ------------------------------------------ How many days a week question Question-------------------------------------------------------%>


                        <div class="row">
                            <div class="col mb-3 ">
                                <asp:Label ID="DaysAWeekProgram" runat="server" Visible="false" Text="How many days a week would you look your program to be?"></asp:Label>
                                <asp:DropDownList ID="dropdownlistDaysAWeek" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="ddlSQ3_SelectedIndexChanged">
                                    <asp:ListItem Selected="True">3</asp:ListItem>
                                    <asp:ListItem>4-5</asp:ListItem>
                                    <asp:ListItem>6-7</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <br />

                        </div>

                        <%--                  ----------------------------------------  Age Question--%>

                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblAge" runat="server" Visible="false" Text="What is your current age?"></asp:Label>
                                <br />

                                <div class="col-md-6 mb-3">
                                    <asp:Label ID="lblErrorAge" runat="server" Text="Text Can't Be Empty!" ForeColor="#CC0000" Visible="False"></asp:Label>
                                    <asp:TextBox ID="textboxAge" runat="server" Visible="false" CssClass="form-control" placeholder="18"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                            <br />

                        <%--                  ----------------------------------------  Type of Training Question--%>
                        <div class="row">
                            <div class="col mb-3">
                                <asp:Label ID="lblTypeOfTraining" runat="server" Visible="false" Text="Type of Training?"></asp:Label>
                                <asp:DropDownList ID="dropdownListTypeOfTraining" Visible="false" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSQ3_SelectedIndexChanged">
                                    <asp:ListItem Selected="True">Hypertrophy (High Repitions)</asp:ListItem>
                                    <asp:ListItem>Strength (Lower Repitions)</asp:ListItem>
                                    <asp:ListItem>Both</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <br />

                                                </div>

                        <%--                  ----------------------------------------  Buttons for account of create --%>


                            <div class="row">
                                <br />
                            <div class="col mb-3">

                        <asp:Button ID="btnCreate" runat="server" class="btn btn-md btn-block" type="submit" Text="Create Your Account!" OnClick="btnCreate_Click1" />
                        <asp:Button ID="btnBackToSign" class="btn btn-md btn-light btn-block" runat="server" Text="Sign-In Instead" OnClick="btnBackToSign_Click" />
                            </div>
                            </div>
                            </center>
                </div>
            </div>
        </form>
    </div>

</body>
</html>
