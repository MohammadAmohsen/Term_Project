<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserSavedPrograms.aspx.cs" Inherits="Term_Project.UserSavedPrograms" %>
<%@ Register Src="~/LogoutNav.ascx" TagPrefix="uc1" TagName="LogoutNav" %>

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
    <form runat="server">

        <div id="youShallNotPass" runat="server" class="text-center">
            <h2 class="text-center">You Must Log In To See This Site!</h2>
            <img src="Images2/ShallNotPass.gif" style="margin-top: 100px;" />
                    <uc1:LogoutNav runat="server" ID="LogoutNav1" />
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
                        <a class="nav-link" href="HomePage.aspx">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Explore2.aspx">Explore Workout Programs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UserSavedPrograms.aspx">Saved Programs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MyProgram.aspx">My Programs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">My Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UserMessages.aspx">Customer Service</a>
                    </li>
                </ul>
                <div class="form-inline my-2 my-lg-0" runat="server">
                    <uc1:LogoutNav runat="server" ID="LogoutNav" />
                </div>
            </div>
        </nav>

        <br />
        <br />
    <br />    <br />
    <br />    <br />
    <br />    <br />
    <br />

<%--          end nav bar--%>

        <div id="content" runat="server">
        <div class="row justify-content-center">
 
            <table>
                
                <asp:Repeater ID="rptPrograms" runat="server" OnItemCommand="rptPrograms_OnItemCommand">
                    <ItemTemplate>

                        <tr>

                            <td>
                                <asp:Label ID="lblProgramID" visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProgramID") %>'></asp:Label>

                            </td>
                        </tr>
                        <tr>

                            <td>
                                <asp:Image ID="lblProgramImage" Height="100px" Width="100px" runat="server" ImageUrl='<%# Eval("Image") %>' />

                            </td>
                        </tr>

                        <tr>

                            <td>
                                <asp:Label ID="lblProgramName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProgramName") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>

                            <td>
                                <asp:Label ID="lblProgramDesc" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateAdded") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblProgramType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProgramType") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblProgramExperience" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProgramExperience") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>

                            <td>
                                <asp:Label ID="lblAmountOfDays" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Days") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>

                            <td>
                                <asp:Label ID="lblLength" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "LengthOfProgram") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnDetailView" class="btn btn-primary" Text="Open Program" runat="server" OnClick="btnDetailView_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnSaveProgram" class="btn btn-primary" Text="Save" runat="server" OnClick="btnSaveProgram_Click" />
                            </td>
                            <td></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
             <asp:Button ID="btnBack" Visible="false" class="btn btn-primary" Text="Back" runat="server" OnClick="btnBack_Click" />

         </div>
         <%--        List View for each individual Workout and Program--%>

        <div id="lvContent" runat="server" visible="false">
        <div class="album py-5 bg-light" visible="false">
            <div class="container" visible="false">
                <div class="row" visible="false">
                        <!-- Illustrations -->
                    <div class="col-md-3" visible="false">

                        <div class="card shadow mb-3" visible="false">
                            <div class="card-header py-3">
                                <h6 id="h6Day"  runat="server" class="m-0 font-weight-bold text-primary">Monday</h6>
                            </div>
                            <div class="card-body" style="height: auto; width: 15rem" visible="false">

                                <asp:ListView ID="lvMonday" Visible="false"  runat="server" ItemPlaceholderID="PlaceHolder1">
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
        </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />



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

    <script>
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
                // Use the JavaScript proxy object to make an AJAX call to an ASP.NET Core 2.0 Web API
                request.open("GET", "https://localhost:44314/api/Fitness/AllPrograms/", true);

                //xmlhttp.setRequestHeader("Access-Control-Allow-Origin", "*");
                request.onreadystatechange = onComplete;
                request.send();
           
        } // end of page load event



        // Callback function used to perform some action when an asynchronous request is completed
        function onComplete() {
            if (request.readyState == 4 && request.status == 200) {
                var m = request.responseText;

            }
        }


    </script>
        </form>
</body>
</html>
