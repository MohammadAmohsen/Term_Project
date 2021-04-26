<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GridViewHomePage.ascx.cs" Inherits="Term_Project.GridViewHomePage" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 id="h6Day" runat="server" class="m-0 font-weight-bold text-primary">Your workouts for today</h6>
    </div>
    <div class="card-body">


        <asp:GridView ID="gvWorkoutOftheDay" AutoGenerateColumns="False" runat="server">
            <Columns>
                <asp:BoundField DataField="ExerciseName" HeaderText="ExerciseName: " />
                <asp:BoundField DataField="Sets" HeaderText="Sets: " />
                <asp:BoundField DataField="Reps" HeaderText="Reps: " />
            </Columns>
        </asp:GridView>
        <a target="_blank" rel="nofollow" href="MyProgram.aspx">See your entire workout! &rarr;</a>
    </div>
    <asp:Label ID="lblRestDay" Visible="false" runat="server" Text="Rest Day"></asp:Label>
</div>
