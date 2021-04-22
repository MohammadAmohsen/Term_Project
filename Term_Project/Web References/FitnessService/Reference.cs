﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by Microsoft.VSDesigner, Version 4.0.30319.42000.
// 
#pragma warning disable 1591

namespace Term_Project.FitnessService {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    using System.Data;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="FitnessSoapSoap", Namespace="http://tempuri.org/")]
    public partial class FitnessSoap : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback TestOperationCompleted;
        
        private System.Threading.SendOrPostCallback AddUserOperationCompleted;
        
        private System.Threading.SendOrPostCallback GetAllUsersOperationCompleted;
        
        private System.Threading.SendOrPostCallback GetAllProgramOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public FitnessSoap() {
            this.Url = global::Term_Project.Properties.Settings.Default.Term_Project_FitnessService_FitnessSoap;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event TestCompletedEventHandler TestCompleted;
        
        /// <remarks/>
        public event AddUserCompletedEventHandler AddUserCompleted;
        
        /// <remarks/>
        public event GetAllUsersCompletedEventHandler GetAllUsersCompleted;
        
        /// <remarks/>
        public event GetAllProgramCompletedEventHandler GetAllProgramCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/Test", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public WorkoutSoap Test(string m) {
            object[] results = this.Invoke("Test", new object[] {
                        m});
            return ((WorkoutSoap)(results[0]));
        }
        
        /// <remarks/>
        public void TestAsync(string m) {
            this.TestAsync(m, null);
        }
        
        /// <remarks/>
        public void TestAsync(string m, object userState) {
            if ((this.TestOperationCompleted == null)) {
                this.TestOperationCompleted = new System.Threading.SendOrPostCallback(this.OnTestOperationCompleted);
            }
            this.InvokeAsync("Test", new object[] {
                        m}, this.TestOperationCompleted, userState);
        }
        
        private void OnTestOperationCompleted(object arg) {
            if ((this.TestCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.TestCompleted(this, new TestCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/AddUser", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public bool AddUser(User newUsers) {
            object[] results = this.Invoke("AddUser", new object[] {
                        newUsers});
            return ((bool)(results[0]));
        }
        
        /// <remarks/>
        public void AddUserAsync(User newUsers) {
            this.AddUserAsync(newUsers, null);
        }
        
        /// <remarks/>
        public void AddUserAsync(User newUsers, object userState) {
            if ((this.AddUserOperationCompleted == null)) {
                this.AddUserOperationCompleted = new System.Threading.SendOrPostCallback(this.OnAddUserOperationCompleted);
            }
            this.InvokeAsync("AddUser", new object[] {
                        newUsers}, this.AddUserOperationCompleted, userState);
        }
        
        private void OnAddUserOperationCompleted(object arg) {
            if ((this.AddUserCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.AddUserCompleted(this, new AddUserCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetAllUsers", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public User GetAllUsers(System.Data.DataSet myData, int i) {
            object[] results = this.Invoke("GetAllUsers", new object[] {
                        myData,
                        i});
            return ((User)(results[0]));
        }
        
        /// <remarks/>
        public void GetAllUsersAsync(System.Data.DataSet myData, int i) {
            this.GetAllUsersAsync(myData, i, null);
        }
        
        /// <remarks/>
        public void GetAllUsersAsync(System.Data.DataSet myData, int i, object userState) {
            if ((this.GetAllUsersOperationCompleted == null)) {
                this.GetAllUsersOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetAllUsersOperationCompleted);
            }
            this.InvokeAsync("GetAllUsers", new object[] {
                        myData,
                        i}, this.GetAllUsersOperationCompleted, userState);
        }
        
        private void OnGetAllUsersOperationCompleted(object arg) {
            if ((this.GetAllUsersCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetAllUsersCompleted(this, new GetAllUsersCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetAllProgram", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public Program GetAllProgram(System.Data.DataSet myData, int i) {
            object[] results = this.Invoke("GetAllProgram", new object[] {
                        myData,
                        i});
            return ((Program)(results[0]));
        }
        
        /// <remarks/>
        public void GetAllProgramAsync(System.Data.DataSet myData, int i) {
            this.GetAllProgramAsync(myData, i, null);
        }
        
        /// <remarks/>
        public void GetAllProgramAsync(System.Data.DataSet myData, int i, object userState) {
            if ((this.GetAllProgramOperationCompleted == null)) {
                this.GetAllProgramOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetAllProgramOperationCompleted);
            }
            this.InvokeAsync("GetAllProgram", new object[] {
                        myData,
                        i}, this.GetAllProgramOperationCompleted, userState);
        }
        
        private void OnGetAllProgramOperationCompleted(object arg) {
            if ((this.GetAllProgramCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetAllProgramCompleted(this, new GetAllProgramCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.8.4084.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
    public partial class WorkoutSoap {
        
        private string nameField;
        
        /// <remarks/>
        public string Name {
            get {
                return this.nameField;
            }
            set {
                this.nameField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.8.4084.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
    public partial class Program {
        
        private int programIDField;
        
        private int lengthOfProgramField;
        
        private string imageField;
        
        private int daysField;
        
        private string programNameField;
        
        private string dateAddedField;
        
        private string descriptionField;
        
        private string programTypeField;
        
        private string programExperienceField;
        
        /// <remarks/>
        public int ProgramID {
            get {
                return this.programIDField;
            }
            set {
                this.programIDField = value;
            }
        }
        
        /// <remarks/>
        public int LengthOfProgram {
            get {
                return this.lengthOfProgramField;
            }
            set {
                this.lengthOfProgramField = value;
            }
        }
        
        /// <remarks/>
        public string Image {
            get {
                return this.imageField;
            }
            set {
                this.imageField = value;
            }
        }
        
        /// <remarks/>
        public int Days {
            get {
                return this.daysField;
            }
            set {
                this.daysField = value;
            }
        }
        
        /// <remarks/>
        public string programName {
            get {
                return this.programNameField;
            }
            set {
                this.programNameField = value;
            }
        }
        
        /// <remarks/>
        public string dateAdded {
            get {
                return this.dateAddedField;
            }
            set {
                this.dateAddedField = value;
            }
        }
        
        /// <remarks/>
        public string description {
            get {
                return this.descriptionField;
            }
            set {
                this.descriptionField = value;
            }
        }
        
        /// <remarks/>
        public string programType {
            get {
                return this.programTypeField;
            }
            set {
                this.programTypeField = value;
            }
        }
        
        /// <remarks/>
        public string programExperience {
            get {
                return this.programExperienceField;
            }
            set {
                this.programExperienceField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.8.4084.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
    public partial class User {
        
        private string programNameField;
        
        private string userGoalsField;
        
        private int userWeightField;
        
        private int userAgeField;
        
        private string amountOfDaysField;
        
        private string userTrainingTypeField;
        
        private string dateCreatedField;
        
        private string billingAddressField;
        
        private string userNameField;
        
        private string firstNameField;
        
        private string lastNameField;
        
        private string emailAddressField;
        
        private string passwordField;
        
        private string securityQuestion1Field;
        
        private string securityAnswer1Field;
        
        private string securityQuestion2Field;
        
        private string securityAnswer2Field;
        
        private string securityQuestion3Field;
        
        private string securityAnswer3Field;
        
        private string experienceField;
        
        private string typeField;
        
        private string userImageField;
        
        /// <remarks/>
        public string programName {
            get {
                return this.programNameField;
            }
            set {
                this.programNameField = value;
            }
        }
        
        /// <remarks/>
        public string UserGoals {
            get {
                return this.userGoalsField;
            }
            set {
                this.userGoalsField = value;
            }
        }
        
        /// <remarks/>
        public int userWeight {
            get {
                return this.userWeightField;
            }
            set {
                this.userWeightField = value;
            }
        }
        
        /// <remarks/>
        public int userAge {
            get {
                return this.userAgeField;
            }
            set {
                this.userAgeField = value;
            }
        }
        
        /// <remarks/>
        public string amountOfDays {
            get {
                return this.amountOfDaysField;
            }
            set {
                this.amountOfDaysField = value;
            }
        }
        
        /// <remarks/>
        public string userTrainingType {
            get {
                return this.userTrainingTypeField;
            }
            set {
                this.userTrainingTypeField = value;
            }
        }
        
        /// <remarks/>
        public string DateCreated {
            get {
                return this.dateCreatedField;
            }
            set {
                this.dateCreatedField = value;
            }
        }
        
        /// <remarks/>
        public string BillingAddress {
            get {
                return this.billingAddressField;
            }
            set {
                this.billingAddressField = value;
            }
        }
        
        /// <remarks/>
        public string UserName {
            get {
                return this.userNameField;
            }
            set {
                this.userNameField = value;
            }
        }
        
        /// <remarks/>
        public string FirstName {
            get {
                return this.firstNameField;
            }
            set {
                this.firstNameField = value;
            }
        }
        
        /// <remarks/>
        public string LastName {
            get {
                return this.lastNameField;
            }
            set {
                this.lastNameField = value;
            }
        }
        
        /// <remarks/>
        public string EmailAddress {
            get {
                return this.emailAddressField;
            }
            set {
                this.emailAddressField = value;
            }
        }
        
        /// <remarks/>
        public string Password {
            get {
                return this.passwordField;
            }
            set {
                this.passwordField = value;
            }
        }
        
        /// <remarks/>
        public string SecurityQuestion1 {
            get {
                return this.securityQuestion1Field;
            }
            set {
                this.securityQuestion1Field = value;
            }
        }
        
        /// <remarks/>
        public string SecurityAnswer1 {
            get {
                return this.securityAnswer1Field;
            }
            set {
                this.securityAnswer1Field = value;
            }
        }
        
        /// <remarks/>
        public string SecurityQuestion2 {
            get {
                return this.securityQuestion2Field;
            }
            set {
                this.securityQuestion2Field = value;
            }
        }
        
        /// <remarks/>
        public string SecurityAnswer2 {
            get {
                return this.securityAnswer2Field;
            }
            set {
                this.securityAnswer2Field = value;
            }
        }
        
        /// <remarks/>
        public string SecurityQuestion3 {
            get {
                return this.securityQuestion3Field;
            }
            set {
                this.securityQuestion3Field = value;
            }
        }
        
        /// <remarks/>
        public string SecurityAnswer3 {
            get {
                return this.securityAnswer3Field;
            }
            set {
                this.securityAnswer3Field = value;
            }
        }
        
        /// <remarks/>
        public string Experience {
            get {
                return this.experienceField;
            }
            set {
                this.experienceField = value;
            }
        }
        
        /// <remarks/>
        public string Type {
            get {
                return this.typeField;
            }
            set {
                this.typeField = value;
            }
        }
        
        /// <remarks/>
        public string UserImage {
            get {
                return this.userImageField;
            }
            set {
                this.userImageField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    public delegate void TestCompletedEventHandler(object sender, TestCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class TestCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal TestCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public WorkoutSoap Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((WorkoutSoap)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    public delegate void AddUserCompletedEventHandler(object sender, AddUserCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class AddUserCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal AddUserCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public bool Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((bool)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    public delegate void GetAllUsersCompletedEventHandler(object sender, GetAllUsersCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetAllUsersCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetAllUsersCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public User Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((User)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    public delegate void GetAllProgramCompletedEventHandler(object sender, GetAllProgramCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetAllProgramCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetAllProgramCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public Program Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((Program)(this.results[0]));
            }
        }
    }
}

#pragma warning restore 1591