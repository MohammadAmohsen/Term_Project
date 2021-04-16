<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserMessages.aspx.cs" Inherits="Term_Project.UserMessages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Email</title>
    	<meta charset="UTF-8"/>

    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
    <link href="Css/EmailCSS.css" rel="stylesheet" />
</head>
<body>
    <div id="youShallNotPass" runat="server" class="text-center">
        <h2 class="text-center">You Must Log In To See This Site!</h2>
        <img src="Images2/ShallNotPass.gif" style="margin-top: 100px;" />
        <form runat="server">
            <asp:Button ID="btnBackToLogin" class="btn btn-primary" runat="server" Text="BackToLogin" OnClick="btnBackToLogin_Click" Style="margin-top: 100px;" />
        </form>
    </div>
    <form id="form1" runat="server">
        <div class="d-flex" id="wrap">
            <div class="border-right" runat="server" id="sideBar">
                <div class="sidebar-heading text-center">
                    <asp:Image ID="userAvatar" runat="server" ImageUrl="Images2/ivysaur.jpg" Width="100" Height="100" class="rounded" />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="UserName:" CssClass="text-light"></asp:Label> <br />
                <asp:Label ID="userLabel" runat="server" Text="UserName" CssClass="text-light"></asp:Label> 
            </div>
            <br />
            <div class="siderbar-heading text-center">
                <asp:Button ID="btnCompose" runat="server" Text="Compose" class="btn btn-light" OnClick="btnCompose_Click" />
            </div>
            <br />
            <div class="list-group list-group-flush text-center">
                <asp:LinkButton ID="linkbtnInbox" runat="server" class="list-group-item list-group-item-action bg-dark text-light active" OnClick="linkbtnInbox_Click">Inbox</asp:LinkButton>
                <asp:LinkButton ID="linkbtnSent" runat="server" class="list-group-item list-group-item-action bg-dark text-light" OnClick="linkbtnSent_Click">Sent</asp:LinkButton>
            </div>
        </div>

            <div id="content" runat="server">
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
                                <a class="nav-link" href="Explore2.aspx">Explore</a>
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
                        <div class="form-inline my-2 my-lg-0" runat="server">
                            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" />
                            <asp:Button class="btn btn-outline-success my-2 my-sm-0" ID="btnLogOut" runat="server" Text="LogOut" OnClick="btnLogOut_Click" />
                        </div>
                    </div>
                </nav>

                <br />
                <br />
                <br />
                <%--          end nav bar--%>

                <asp:Label ID="lblName" runat="server" Text="INBOX FOLDER"></asp:Label>

                <div class="container-fluid">
                    <br />

                    <asp:Label ID="lblEmpty" runat="server" Text="Your Inbox Is Empty" ></asp:Label>

                <asp:GridView ID="gvEmails" runat="server" AutoGenerateColumns="False" GridLines="Horizontal" CssClass="table table-hover" BorderStyle="None"  OnSelectedIndexChanged="gvEmails_SelectedIndexChanged" AutoGenerateSelectButton ="true">
                    <Columns>
                        <asp:TemplateField HeaderText="Select: ">
                            <ItemTemplate>
                                <asp:CheckBox ID="cbSelectEmail" runat="server" AutoPostBack="true" ></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Sender" HeaderText="Sender: " />
                        <asp:BoundField DataField="Receiver" HeaderText="Receiver: " />
                        <asp:BoundField DataField="EmailSubject" HeaderText="Subject: " />
                        <asp:BoundField DataField="EmailBody" HeaderText="Content: " />
                        <asp:BoundField DataField="Time" HeaderText="CreatedTime: " />
                    </Columns>
                    <RowStyle VerticalAlign="Middle" />
                </asp:GridView>

                 <div id="tbEmail" runat="server" class="container-fluid">
                <h3>
                    <asp:Label ID="subjectID" runat="server" Text="" Visible="true"></asp:Label></h3>
                     <div id="showEmail" class="text-center">
                <table class="table table-borderless text-center">
                    <tbody>
                        <tr>
                            <td>
                                <asp:Label ID="lblCreateTime" runat="server" Text="CreatedTime: " class="mr-sm-2"></asp:Label></td>
                           
                        </tr>

                             <tr>
                            <td colspan="2">
                                <asp:Label ID="lblCreatedTime2" runat="server" Text="" class="mr-sm-2"></asp:Label></td>
                        </tr>
                        

                        <tr>
                            <td>
                                <asp:Label ID="lblFromWho" runat="server" Text="From: " class="mr-sm-2"></asp:Label></td>
                             
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblFromEmail" runat="server" Text="" class="mr-sm-2"></asp:Label></td>
                        </tr>
                        
                         <tr>
                            <td>
                                <asp:Label ID="lblTo" runat="server" Text="To: " class="mr-sm-2"></asp:Label></td>
                             
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblToWho" runat="server" Text="" class="mr-sm-2"></asp:Label></td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblSubject1" runat="server" Text="Subject: " class="mr-sm-2"></asp:Label></td>
                            
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblSub" runat="server" Text="" class="mr-sm-2"></asp:Label></td>
                        </tr>


                        <tr>
                            <td>
                                <asp:Label ID="lblEmailBody" runat="server" Text="Body: " class="mr-sm-2 "></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblBodyEmail" runat="server" Text="" class="mr-sm-2"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
                <asp:Button ID="btnBack2" runat="server" Text="Back" class="btn btn-primary" OnClick="btnBack2_Click" />
              </div>

            </div>

            </div>

            <div id="emailContent" runat="server" class="container-fluid"  visible="false">
                <asp:Label ID="lblTitle" runat="server" CssClass="text-center"><h3>New Message</h3></asp:Label>
                <asp:Label ID="lblSendTo" runat="server" Text="To: " class="mr-sm-2"></asp:Label>
                <asp:TextBox ID="txtEmailTo" runat="server" class="form-control my-2 my-sm-0" placeholder="Receiver" Width="300px"></asp:TextBox>
                <br />
                <asp:Label ID="lblSubject" runat="server" Text="Subject: " class="mr-sm-2"></asp:Label>
                <asp:TextBox ID="txtSubject" runat="server" class="form-control my-2 my-sm-0" placeholder="Subject: " Width="300px"></asp:TextBox>
                <br />
                <asp:Label ID="lvlContent" runat="server" Text="Body: " class="mr-sm-2"></asp:Label>
                <asp:TextBox ID="txtContent" runat="server" class="form-control my-2 my-sm-0" placeholder="Receiver" Height="200px" Width="500px" TextMode="MultiLine"></asp:TextBox>
                <br />
                <asp:Button ID="btnBack" runat="server" Text="Back" class="btn btn-primary" OnClick="btnBack_Click" />
                <asp:Button ID="btnSend" runat="server" Text="Send" class="btn btn-primary" OnClick="btnSend_Click" />

            </div>

        </div>
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
