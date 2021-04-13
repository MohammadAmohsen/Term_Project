<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminMessages.aspx.cs" Inherits="Term_Project.AdminAspx.AdminMessages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Email</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="../Css/EmailCSS.css" rel="stylesheet" />
 </head>
<body>

    <form id="form1" runat="server">
        <div class="d-flex" id="wrap">
        <div class="border-right" runat="server" id="sideBar">
            <div class="sidebar-heading text-center">
                <asp:Image ID="userAvatar" runat="server" ImageUrl="../Images/Aang.jpg" Width="100" Height="100" class="rounded" />
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

        <div id="content">
            <nav class="navbar navbar-expand-md navbar-dark fixed-top" runat="server" id="headerNav">
                <a class="navbar-brand" href="Default.aspx">Appa Mail</a>                
                <img class="mb-4" src="../Bootstrap/Images2/Logo.PNG" width="50" height="50" />
                <div class="collapse navbar-collapse" id="navCollapse">
                    <ul class="navbar-nav mr-auto">
                    </ul>
                    <div class="form-inline mt-2 mt-md-0">
                        <asp:Button ID="btnLogOut" runat="server" Text="Log Out" class="btn btn-light my-2 my-sm-0" OnClick="btnLogOut_Click" />
                    </div>
                </div>
            </nav>
            <br />

           <asp:Label ID="lblName" runat="server" Text="INBOX FOLDER" ></asp:Label>

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
                        <asp:BoundField DataField="SenderName" HeaderText="Sender: " />
                        <asp:BoundField DataField="RecieverName" HeaderText="Receiver: " />
                        <asp:BoundField DataField="Subject" HeaderText="Subject: " />
                        <asp:BoundField DataField="EmailBody" HeaderText="Content: " />
                        <asp:BoundField DataField="CreatedTime" HeaderText="CreatedTime: " />
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
             </div>

        </div>
        </div>
</form>
</body>
</html>
