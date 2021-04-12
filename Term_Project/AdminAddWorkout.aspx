<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAddWorkout.aspx.cs" Inherits="Term_Project.AdminAddWorkout" %>

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

     <div id="youShallNotPass" runat="server" class="text-center">
    <h2 class="text-center">You Must Log In To See This Site!</h2>
    <img src="Images2/ShallNotPass.gif" style="margin-top: 100px;"/>
         <form runat="server">
        <asp:Button ID="btnBackToLogin" class="btn btn-primary" runat="server" Text="BackToLogin" OnClick="btnBackToLogin_Click" style="margin-top:100px;"/>
             </form>
        </div>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top " id="headerNav" runat="server">
            <a class="navbar-brand" href="Default.aspx">Moe's Fitness - Admin</a>
        </nav>
    </header>
 <div class="container-login100" style="background-image: url('images2/background3.jpg');" id="ContentID" runat="server">

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
                            <h4 class="mb-3">Create A Workout Program!</h4>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="ProgramName">Program Name</label>
                            <asp:TextBox ID="txtProgramName" runat="server" class="form-control" placeholder="Name" autofocus=""></asp:TextBox>
                            <div class="invalid-feedback">Your Program Name Is Required</div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="Experience">Program experience level?</label><br />
                            <asp:DropDownList ID="ddlExpereience" runat="server" AutoPostBack="true">
                                <asp:ListItem Selected="True" Value="Beginner">Beginner</asp:ListItem>
                                <asp:ListItem Value="Intermediate">Intermediate</asp:ListItem>
                                <asp:ListItem Value="Advanced">Advanced</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                   <br />

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="Program">Type Of Program</label>
                           <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="true">
                                <asp:ListItem Selected="True" Value="Hypertrophy">Hypertrophy</asp:ListItem>
                                <asp:ListItem Value="Strength">Strength</asp:ListItem>
                                <asp:ListItem Value="Mixed">Mixed</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                       <div class="col-md-6 mb-3">
                            <label for="Program">Days of Workout</label>
                           <asp:RadioButtonList ID="rbDays" runat="server" CssClass="radioButtonList" AutoPostback="true" style="margin-left:50px;" RepeatDirection="Horizontal" > 
                               <asp:ListItem Selected="True" Value="3" style="margin-right:90px">3 Days</asp:ListItem>
                                <asp:ListItem Value="5" style="margin-right:90px" >4-5 Days</asp:ListItem>
                               <asp:ListItem Value="7" style="margin-right: 90px">6-7 Days</asp:ListItem>
                           </asp:RadioButtonList>
                       </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="Program">Description Of Program</label>
                            <asp:TextBox ID="txtDesc" runat="server" class="form-control" placeholder="Description" autofocus=""></asp:TextBox>
                            <div class="invalid-feedback">Your Program Description Is Required</div>
                        </div>
                    </div>
                    <br />
                    <hr />


                    <!-- Monday -->
                    <h3 id="h3Monday" class="text-center" runat="server">Monday Workout</h3>
                    <br />

                    <div class="col-md-6 mb-3 text-center" style="margin-left: 180px;">
                        <label for="Desc">Workout Description</label>
                        <asp:TextBox ID="txtMondayDescription" runat="server" class="form-control" placeholder="Back/Biceps"></asp:TextBox>
                        <div class="invalid-feedback">Your Description is required!</div>
                    </div>

                    

                    <div class="col-md-6 mb-3" style="margin-left: 180px;">
                        <label for="ExerciseName">Exercise Name</label>
                        <asp:TextBox ID="txtExerciseMonday" runat="server" CssClass="form-control" placeholder="Deadlift"></asp:TextBox>
                        <div class="invalid-feedback">Your Exercise is required!</div>
                    </div>


                    <br />

                    <div class="row">
                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Sets">Sets for this exercise</label>
                            <asp:TextBox ID="txtSetsMonday" runat="server" type="number" CssClass="form-control" placeholder="3"></asp:TextBox>
                            <div class="invalid-feedback">Sets are required!</div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Reps">Reps for this exercise</label><br />
                            <asp:TextBox ID="txtRepsMonday" runat="server" type="number" CssClass="form-control" placeholder="8"></asp:TextBox>
                            <div class="invalid-feedback">Reps are required!</div>
                        </div>

                    </div>
                    <br />

                      <asp:Button ID="btnAddMonday" runat="server"  Text="Add Workouts!" OnClick="btnAddMonday_Click"  />

                    <hr />

                    <!-- Tuesday -->
                    <h3 id="h1" class="text-center" runat="server">Tuesday Workout</h3>
                    <br />



                    <div class="col-md-6 mb-3 text-center" style="margin-left: 180px;">
                        <label for="Desc">Workout Description</label>
                        <asp:TextBox ID="txtDescTuesday" runat="server" class="form-control" placeholder="Back/Biceps"></asp:TextBox>
                        <div class="invalid-feedback">Your Description is required!</div>
                    </div>


                    <div class="col-md-6 mb-3" style="margin-left: 180px;">
                        <label for="ExerciseName">Exercise Name</label>
                        <asp:TextBox ID="txtExcerciseTuesday" runat="server" CssClass="form-control" placeholder="Deadlift"></asp:TextBox>
                        <div class="invalid-feedback">Your Exercise is required!</div>
                    </div>


                    <br />

                    <div class="row">
                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Sets">Sets for this exercise</label>
                            <asp:TextBox ID="txtSetsTuesday" runat="server" type="number" CssClass="form-control" placeholder="3"></asp:TextBox>
                            <div class="invalid-feedback">Sets are required!</div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Reps">Reps for this exercise</label><br />
                            <asp:TextBox ID="txtRepsTuesday" runat="server" type="number" CssClass="form-control" placeholder="8"></asp:TextBox>
                            <div class="invalid-feedback">Reps are required!</div>
                        </div>

                    </div>
                    <asp:Button ID="btnSubmitTuesday" runat="server" Text="Add" OnClick="btnSubmitTuesday_Click" />
                    <br />
                    <hr />

                    <!-- Wednesday -->
                    <h3 id="h2" class="text-center" runat="server">Wednesday Workout</h3>
                    <br />



                    <div class="col-md-6 mb-3 text-center" style="margin-left: 180px;">
                        <label for="Desc">Workout Description</label>
                        <asp:TextBox ID="txtDescWed" runat="server" class="form-control" placeholder="Back/Biceps"></asp:TextBox>
                        <div class="invalid-feedback">Your Description is required!</div>
                    </div>


                    <div class="col-md-6 mb-3" style="margin-left: 180px;">
                        <label for="ExerciseName">Exercise Name</label>
                        <asp:TextBox ID="txtExerciseWed" runat="server" CssClass="form-control" placeholder="Deadlift"></asp:TextBox>
                        <div class="invalid-feedback">Your Exercise is required!</div>
                    </div>


                    <br />

                    <div class="row">
                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Sets">Sets for this exercise</label>
                            <asp:TextBox ID="txtSetsWed" runat="server" type="number" CssClass="form-control" placeholder="3"></asp:TextBox>
                            <div class="invalid-feedback">Sets are required!</div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Reps">Reps for this exercise</label><br />
                            <asp:TextBox ID="txtRepsWed" runat="server" type="number" CssClass="form-control" placeholder="8"></asp:TextBox>
                            <div class="invalid-feedback">Reps are required!</div>
                        </div>
                                            <asp:Button ID="btnAddWednesday" runat="server" Text="Add Wednesday" OnClick="btnAddWednesday_Click" />

                    </div>
                    <br />
                    <hr />

                    <!-- Thursday -->
                    <h3 id="h3" class="text-center" runat="server">Thursday Workout</h3>
                    <br />



                    <div class="col-md-6 mb-3 text-center" style="margin-left: 180px;">
                        <label for="Desc">Workout Description</label>
                        <asp:TextBox ID="txtDesThurs" runat="server" class="form-control" placeholder="Back/Biceps"></asp:TextBox>
                        <div class="invalid-feedback">Your Description is required!</div>
                    </div>


                    <div class="col-md-6 mb-3" style="margin-left: 180px;">
                        <label for="ExerciseName">Exercise Name</label>
                        <asp:TextBox ID="txtExerciseThurs" runat="server" CssClass="form-control" placeholder="Deadlift"></asp:TextBox>
                        <div class="invalid-feedback">Your Exercise is required!</div>
                    </div>


                    <br />

                    <div class="row">
                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Sets">Sets for this exercise</label>
                            <asp:TextBox ID="txtSetsThurs" runat="server" type="number" CssClass="form-control" placeholder="3"></asp:TextBox>
                            <div class="invalid-feedback">Sets are required!</div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Reps">Reps for this exercise</label><br />
                            <asp:TextBox ID="txtRepsThurs" runat="server" type="number" CssClass="form-control" placeholder="8"></asp:TextBox>
                            <div class="invalid-feedback">Reps are required!</div>
                        </div>
                     <asp:Button ID="btnAddThursday" runat="server" Text="Add Thursday" OnClick="btnAddThursday_Click" />

                    </div>
                    <br />
                    <hr />

                    <!-- Friday -->
                    <h3 id="h4" class="text-center" runat="server">Friday Workout</h3>
                    <br />



                    <div class="col-md-6 mb-3 text-center" style="margin-left: 180px;">
                        <label for="Desc">Workout Description</label>
                        <asp:TextBox ID="txtDescFri" runat="server" class="form-control" placeholder="Back/Biceps"></asp:TextBox>
                        <div class="invalid-feedback">Your Description is required!</div>
                    </div>


                    <div class="col-md-6 mb-3" style="margin-left: 180px;">
                        <label for="ExerciseName">Exercise Name</label>
                        <asp:TextBox ID="txtExerciseFri" runat="server" CssClass="form-control" placeholder="Deadlift"></asp:TextBox>
                        <div class="invalid-feedback">Your Exercise is required!</div>
                    </div>


                    <br />

                    <div class="row">
                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Sets">Sets for this exercise</label>
                            <asp:TextBox ID="txtSetsFri" runat="server" type="number" CssClass="form-control" placeholder="3"></asp:TextBox>
                            <div class="invalid-feedback">Sets are required!</div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Reps">Reps for this exercise</label><br />
                            <asp:TextBox ID="txtRepsFri" runat="server" type="number" CssClass="form-control" placeholder="8"></asp:TextBox>
                            <div class="invalid-feedback">Reps are required!</div>
                        </div>
                <asp:Button ID="btnFriday" runat="server" Text="Add Friday" OnClick="btnFriday_Click" />

                    </div>
                    <br />
                    <hr />

                    <!-- Saturday -->
                    <h3 id="h5" class="text-center" runat="server">Saturday Workout</h3>
                    <br />



                    <div class="col-md-6 mb-3 text-center" style="margin-left: 180px;">
                        <label for="Desc">Workout Description</label>
                        <asp:TextBox ID="txtDescSat" runat="server" class="form-control" placeholder="Back/Biceps"></asp:TextBox>
                        <div class="invalid-feedback">Your Description is required!</div>
                    </div>


                    <div class="col-md-6 mb-3" style="margin-left: 180px;">
                        <label for="ExerciseName">Exercise Name</label>
                        <asp:TextBox ID="txtExerciseSat" runat="server" CssClass="form-control" placeholder="Deadlift"></asp:TextBox>
                        <div class="invalid-feedback">Your Exercise is required!</div>
                    </div>


                    <br />

                    <div class="row">
                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Sets">Sets for this exercise</label>
                            <asp:TextBox ID="txtSetsSat" runat="server" type="number" CssClass="form-control" placeholder="3"></asp:TextBox>
                            <div class="invalid-feedback">Sets are required!</div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Reps">Reps for this exercise</label><br />
                            <asp:TextBox ID="txtRepsSat" runat="server" type="number" CssClass="form-control" placeholder="8"></asp:TextBox>
                            <div class="invalid-feedback">Reps are required!</div>
                        </div>
                    <asp:Button ID="btnAddSaturday" runat="server" Text="Add Saturday" OnClick="btnAddSaturday_Click" />

                    </div>
                    <br />
                    <hr />

                    <!-- Sunday -->
                    <h3 id="h6" class="text-center" runat="server">Sunday Workout</h3>
                    <br />



                    <div class="col-md-6 mb-3 text-center" style="margin-left: 180px;">
                        <label for="Desc">Workout Description</label>
                        <asp:TextBox ID="txtDescSun" runat="server" class="form-control" placeholder="Back/Biceps"></asp:TextBox>
                        <div class="invalid-feedback">Your Description is required!</div>
                    </div>


                    <div class="col-md-6 mb-3" style="margin-left: 180px;">
                        <label for="ExerciseName">Exercise Name</label>
                        <asp:TextBox ID="txtExerciseSun" runat="server" CssClass="form-control" placeholder="Deadlift"></asp:TextBox>
                        <div class="invalid-feedback">Your Exercise is required!</div>
                    </div>


                    <br />

                    <div class="row">
                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Sets">Sets for this exercise</label>
                            <asp:TextBox ID="txtSetsSun" runat="server" type="number" CssClass="form-control" placeholder="3"></asp:TextBox>
                            <div class="invalid-feedback">Sets are required!</div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-5 mb-2" style="margin-left: 230px;">
                            <label for="Reps">Reps for this exercise</label><br />
                            <asp:TextBox ID="txtRepsSun" runat="server" type="number" CssClass="form-control" placeholder="8"></asp:TextBox>
                            <div class="invalid-feedback">Reps are required!</div>
                        </div>
                    <asp:Button ID="btnAddSunday" runat="server" Text="Add Sunday" OnClick="btnAddSunday_Click" />

                    </div>
                    <br />
                    <hr />

                    <asp:Button ID="btnCreateProgram" runat="server" class="btn btn-md btn-block" type="submit" Text="Create Your Workout Program!" OnClick="btnCreateProgram_Click" />
                    <asp:Button ID="btnBack" class="btn btn-md btn-light btn-block" runat="server" Text="Back To Admin Page!" OnClick="btnBack_Click" />

                </div>
            </div>
        </div>
      </form>
 </div>

</body>
</html>
