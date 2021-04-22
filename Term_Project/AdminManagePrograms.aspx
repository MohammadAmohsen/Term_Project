<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminManagePrograms.aspx.cs" Inherits="Term_Project.AdminManagePrograms" %>

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
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">

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
        <div>
            <asp:Button ID="btnCreateAdmin" class="btn btn-info" runat="server" Text="Create Admin" OnClick="btnCreateAdmin_Click" />
            <asp:Button ID="btnCreateProgram" class="btn btn-info" runat="server" Text="Create Workout" OnClick="btnCreateWorkOut_Click"  />
            <asp:Button ID="btnLogOut" class="btn btn-info" runat="server" Text="LogOut" OnClick="btnLogOut_Click" />
            <asp:Button ID="btnMessages" class="btn btn-info" runat="server" Text="Messages" OnClick="btnMessages_Click" />

        </div>
      </nav>

        <br />
        <br />
        <br />
        <asp:Button ID="btnDelete" class="btn btn-info" runat="server" Text="delete" OnClick="btnDelete_Click" />


        <!-- Content Row -->
        <div class="row justify-content-center" runat="server" id="ContentID">
            <asp:GridView ID="gvManagePrograms" Style="margin-left: auto; margin-right: auto;" Visible="true" runat="server" AutoGenerateSelectButton="true" AutoGenerateColumns="False" CssClass="table table-hover" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="90%" OnSelectedIndexChanged="gvManagePrograms_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Select: ">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:ImageField DataImageUrlField="Image" HeaderText="Image" ControlStyle-Width="100" ControlStyle-Height="100">
                        <ControlStyle Height="100px" Width="100px"></ControlStyle>
                    </asp:ImageField>
                    <asp:BoundField DataField="programID" HeaderText="ProgramID" />
                    <asp:BoundField DataField="programName" HeaderText="Name" />
                    <asp:BoundField DataField="dateAdded" HeaderText="Date: " />
                    <asp:BoundField DataField="description" HeaderText="description" />
                    <asp:BoundField DataField="programType" HeaderText="programType" />
                    <asp:BoundField DataField="programExperience" HeaderText="Experience:" />
                    <asp:BoundField DataField="Days" HeaderText="Days" />
                    <asp:BoundField DataField="lengthOfProgram" HeaderText="length Of Program:" />

                </Columns>
            </asp:GridView>
        </div>


        <div class="album py-5 bg-light">
            <div class="container">
                <div class="row">
                        <!-- Illustrations -->
                    <div class="col-md-3">

                        <div class="card shadow mb-3">
                            <div class="card-header py-3">
                                <h6 id="h6Day" runat="server" class="m-0 font-weight-bold text-primary">Monday</h6>
                            </div>
                            <div class="card-body" style="height: auto; width: 15rem">

                                <asp:ListView ID="lvMonday" Visible="false" runat="server" ItemPlaceholderID="PlaceHolder1">
                                    <ItemTemplate>
                                        <strong>Exercise Name: </strong>
                                        <asp:Label runat="server" ID="ExerciseName" Text='<%# Eval("ExerciseName") %>'></asp:Label>
                                        <br />
                                        <strong>Sets: </strong>
                                        <asp:Label runat="server" ID="Sets" Text='<%# Eval("Sets") %>'></asp:Label>
                                        <br />
                                        <strong>Reps: </strong>
                                        <asp:Label runat="server" ID="Reps" Text='<%# Eval("Reps") %>'></asp:Label>
                                        <br />
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
                                    </LayoutTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                    <!-- Second Card -->
                    <div class="col-md-3">

                        <div class="card shadow mb-3">
                            <div class="card-header py-3">
                                <h6 id="h1" runat="server" class="m-0 font-weight-bold text-primary">Tuesday</h6>
                            </div>
                            <div class="card-body" style="height: auto; width: 15rem">

                                <asp:ListView ID="lvTuesday" Visible="false" runat="server" ItemPlaceholderID="PlaceHolder1">
                                    <ItemTemplate>
                                        <strong>Exercise Name: </strong>
                                        <asp:Label runat="server" ID="ExerciseName" Text='<%# Eval("ExerciseName") %>'></asp:Label>
                                        <br />
                                        <strong>Sets: </strong>
                                        <asp:Label runat="server" ID="Sets" Text='<%# Eval("Sets") %>'></asp:Label>
                                        <br />
                                        <strong>Reps: </strong>
                                        <asp:Label runat="server" ID="Reps" Text='<%# Eval("Reps") %>'></asp:Label>
                                        <br />
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
                                    </LayoutTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                    <!-- Third Card -->
                    <div class="col-md-3">

                        <div class="card shadow mb-3">
                            <div class="card-header py-3">
                                <h6 id="h2" runat="server" class="m-0 font-weight-bold text-primary">Wednesday</h6>
                            </div>
                            <div class="card-body" style="height: auto; width: 15rem">

                                <asp:ListView ID="lvWednesday" Visible="false" runat="server" ItemPlaceholderID="PlaceHolder1">
                                    <ItemTemplate>
                                        <strong>Exercise Name: </strong>
                                        <asp:Label runat="server" ID="ExerciseName" Text='<%# Eval("ExerciseName") %>'></asp:Label>
                                        <br />
                                        <strong>Sets: </strong>
                                        <asp:Label runat="server" ID="Sets" Text='<%# Eval("Sets") %>'></asp:Label>
                                        <br />
                                        <strong>Reps: </strong>
                                        <asp:Label runat="server" ID="Reps" Text='<%# Eval("Reps") %>'></asp:Label>
                                        <br />
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
                                    </LayoutTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                        <!--Fourth Card -->
                    <div class="col-md-3">

                        <div class="card shadow mb-3">
                            <div class="card-header py-3">
                                <h6 id="h3" runat="server" class="m-0 font-weight-bold text-primary">Thursday</h6>
                            </div>
                            <div class="card-body" style="height: auto; width: 15rem">

                                <asp:ListView ID="lvThursday" Visible="false" runat="server" ItemPlaceholderID="PlaceHolder1">
                                    <ItemTemplate>
                                        <strong>Exercise Name: </strong>
                                        <asp:Label runat="server" ID="ExerciseName" Text='<%# Eval("ExerciseName") %>'></asp:Label>
                                        <br />
                                        <strong>Sets: </strong>
                                        <asp:Label runat="server" ID="Sets" Text='<%# Eval("Sets") %>'></asp:Label>
                                        <br />
                                        <strong>Reps: </strong>
                                        <asp:Label runat="server" ID="Reps" Text='<%# Eval("Reps") %>'></asp:Label>
                                        <br />
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
                                    </LayoutTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <!-- Illustrations -->
                    <div class="col-md-3">

                        <div class="card shadow mb-3">
                            <div class="card-header py-3">
                                <h6 id="h4" runat="server" class="m-0 font-weight-bold text-primary">Friday</h6>
                            </div>
                            <div class="card-body" style="height: auto; width: 15rem">

                                <asp:ListView ID="lvFriday" Visible="false" runat="server" ItemPlaceholderID="PlaceHolder1">
                                    <ItemTemplate>
                                        <strong>Exercise Name: </strong>
                                        <asp:Label runat="server" ID="ExerciseName" Text='<%# Eval("ExerciseName") %>'></asp:Label>
                                        <br />
                                        <strong>Sets: </strong>
                                        <asp:Label runat="server" ID="Sets" Text='<%# Eval("Sets") %>'></asp:Label>
                                        <br />
                                        <strong>Reps: </strong>
                                        <asp:Label runat="server" ID="Reps" Text='<%# Eval("Reps") %>'></asp:Label>
                                        <br />
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
                                    </LayoutTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                    <!-- Second Card -->
                    <div class="col-md-3">

                        <div class="card shadow mb-3">
                            <div class="card-header py-3">
                                <h6 id="h5" runat="server" class="m-0 font-weight-bold text-primary">Saturday</h6>
                            </div>
                            <div class="card-body" style="height: auto; width: 15rem">

                                <asp:ListView ID="lvSaturday" Visible="false" runat="server" ItemPlaceholderID="PlaceHolder1">
                                    <ItemTemplate>
                                        <strong>Exercise Name: </strong>
                                        <asp:Label runat="server" ID="ExerciseName" Text='<%# Eval("ExerciseName") %>'></asp:Label>
                                        <br />
                                        <strong>Sets: </strong>
                                        <asp:Label runat="server" ID="Sets" Text='<%# Eval("Sets") %>'></asp:Label>
                                        <br />
                                        <strong>Reps: </strong>
                                        <asp:Label runat="server" ID="Reps" Text='<%# Eval("Reps") %>'></asp:Label>
                                        <br />
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
                                    </LayoutTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                    <!-- Third Card -->
                    <div class="col-md-3">

                        <div class="card shadow mb-3">
                            <div class="card-header py-3">
                                <h6 id="h6" runat="server" class="m-0 font-weight-bold text-primary">Sunday</h6>
                            </div>
                            <div class="card-body" style="height: auto; width: 15rem">

                                <asp:ListView ID="lvSunday" Visible="false" runat="server" ItemPlaceholderID="PlaceHolder1">
                                    <ItemTemplate>
                                        <strong>Exercise Name: </strong>
                                        <asp:Label runat="server" ID="ExerciseName" Text='<%# Eval("ExerciseName") %>'></asp:Label>
                                        <br />
                                        <strong>Sets: </strong>
                                        <asp:Label runat="server" ID="Sets" Text='<%# Eval("Sets") %>'></asp:Label>
                                        <br />
                                        <strong>Reps: </strong>
                                        <asp:Label runat="server" ID="Reps" Text='<%# Eval("Reps") %>'></asp:Label>
                                        <br />
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
                                    </LayoutTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>              
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

    
	<%--<script>
        var stats;          // global variable used to store the fetched data before it's needed
        var request;        // global variable used to store the XMLHttpRequest object used to handle AJAX.

        try {
            // Code for IE7+, Firefox, Chrome, Opera, Safari
            request = new XMLHttpRequest();
        }

        catch (try_older_microsoft) {
            try {
                // Code for IE6, IE5
                request = new ActiveXObject("Microsoft.XMLHTTP");
            }

            catch (other) {
                request = false;
                alert("Your browser doesn't support AJAX!");
            }
        }

        window.onload = function () {
            var programName = document.getElementById("<%=hdn.ClientID%>").value;

            // Use the JavaScript proxy object to make an AJAX call to an ASP.NET Core 2.0 Web API
            request.open("GET", "https://localhost:44314/api/Fitness/DeleteUser/" + programName, true);

            //xmlhttp.setRequestHeader("Access-Control-Allow-Origin", "*");
            request.onreadystatechange = onComplete;
            document.getElementById('<%=hdn.ClientID%>').value = 1;

            request.send();
        }
              
       

        // Callback function used to perform some action when an asynchronous request is completed
        function onComplete() {
            if (request.readyState == 4 && request.status == 200) {
                stats = request.responseText;
            }
    
        }
        

    </script>--%>

</body>
</html>
