<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Term_Project.HomePage" %>

<%@ Register Src="~/LogoutNav.ascx" TagPrefix="uc1" TagName="LogoutNav" %>
<%@ Register Src="~/GridViewHomePage.ascx" TagPrefix="uc1" TagName="GridViewHomePage" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>

</head>
<body>
     <form runat="server">
     <div id="youShallNotPass" runat="server" class="text-center">
    <h2 class="text-center">You Must Log In To See This Site!</h2>
    <img src="Images2/ShallNotPass.gif" style="margin-top: 100px;"/>
        <asp:Button ID="btnBackToLogin" class="btn btn-primary" runat="server" Text="BackToLogin" OnClick="btnBackToLogin_Click" style="margin-top:100px;"/>
        </div>
<%--    nav bar start--%>
     <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-primary">
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
            <a class="nav-link" href="Explore2.aspx">Explore</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Programs</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My Profile</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="MyProgram.aspx">My Program</a>
              <a class="dropdown-item" href="#">Another action</a>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </li>
        </ul>
                  <div class="form-inline my-2 my-lg-0" runat="server">
    <uc1:LogoutNav runat="server" ID="LogoutNav" />
             <asp:Button class="btn btn-outline-success my-2 my-sm-0" id="btnMessages" runat="server" Text="Messages" OnClick="btnMessages_Click" />
             <asp:Button class="btn btn-outline-success my-2 my-sm-0" id="btnMyPage" runat="server" Text="MyPage" OnClick="btnMyPage_Click" />
             <asp:Button class="btn btn-outline-success my-2 my-sm-0" id="btnSaved" runat="server" Text="Saved Programs" OnClick="btnSaved_Click" />
        </div>
          </div>
         </nav>
 
    <br />    <br />
    <br />    

<%--          end nav bar--%>

        <div>
 <!-- Begin Page Content -->
            <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>
                <div class="container-fluid" id="ContentID" runat="server">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Current Weight</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">135 (lbs)</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Goal Weight</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">165 (lbs)</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                <asp:Label ID="lblProgram" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                                                        <asp:Label ID="lblCompletionPercentage" runat="server" Text="Label"></asp:Label>                                                       
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" runat="server" id="progressBar" role="progressbar"
                                                            style="width: 60%" aria-valuenow="70" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Days left of program:</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                <asp:Label ID="lblDaysLeft" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <center>
                        <div class="col-lg-8 mb-4">

                            <!-- Illustrations -->
                            <uc1:GridViewHomePage runat="server" id="GridViewHomePage" />
              <%--         <%--     <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 id="h6Day" runat="server" class="m-0 font-weight-bold text-primary">Your workouts for today</h6>
                                </div>
                                <div class="card-body">


                     <%--                <asp:GridView ID="gvWorkoutOftheDay" AutoGenerateColumns="False" runat="server">
                                          <Columns>
                                             <asp:BoundField DataField="ExerciseName" HeaderText="ExerciseName: " />
                                             <asp:BoundField DataField="Sets" HeaderText="Sets: " />
                                              <asp:BoundField DataField="Reps" HeaderText="Reps: " />
                                          </Columns>
                                      </asp:GridView>--%>
                            <%--        <a target="_blank" rel="nofollow" href="https://undraw.co/">See previous workouts &rarr;</a>
                                </div>
                                      <asp:Label ID="lblRestDay" visible="false" runat="server" Text="Rest Day"></asp:Label>
                            </div> --%>

                            <!-- Approach -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Complete Current Workout</h6>
                                </div>
                                <div class="card-body">
                                    <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce
                                        CSS bloat and poor page performance. Custom CSS classes are used to create
                                        custom components and custom utility classes.</p>
                                    <p class="mb-0">Before working with this theme, you should become familiar with the
                                        Bootstrap framework, especially the utility classes.</p>
                                </div>
                            </div>

                        </div>
                            </center>
                    </div>

                </div>
            <!-- /.container-fluid -->

        </div>
            <!-- End of Main Content -->      
    <br>
    </form> 

</body>
</html>
