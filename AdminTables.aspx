<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminTables.aspx.cs" Inherits="Eisk.Web.AdminTables"  MasterPageFile="~/App_Resources/default.master"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <script src='<%# ResolveUrl ("~/App_Resources/client-scripts/framework/jquery.ui.core.js") %>'
        type="text/javascript"></script>
    <script src='<%# ResolveUrl ("~/App_Resources/client-scripts/framework/jquery.ui.datepicker.js") %>'
        type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            //alert("here");
            $("#CreateDate").datepicker({ minDate: 0, maxDate: '+1M' });
        });
    </script>
    <script type="text/javascript">

        $("#anim").change(function () {
            $("#datepicker").datepicker("option", "showAnim", $(this).val());
        });

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceholder" runat="server">

 <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
 </ajaxToolkit:ToolkitScriptManager>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <h1 class="title-regular clearfix">  </h1>
        <b>Meter Info Find:</b><br />
        <asp:DropDownList ID="drpMeters" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSourceMeters" DataTextField="MeterDescription" 
            DataValueField="MeterDescription" 
            onselectedindexchanged="DropDownList4_SelectedIndexChanged" Width="199px">
        </asp:DropDownList>
        <br />
         <br />
        <asp:Label ID="MessageLabel" runat="server" ForeColor="Red"></asp:Label>
        
              <asp:Button ID="Button1" SkinID="Button" runat="server" onclick="Button1_Click" 
            Text="Add New Meter" />
        
        <asp:Button ID="Button2" SkinID="Button" runat="server" onclick="Button2_Click" 
            Text="Show All" />
        </ContentTemplate>

    </asp:UpdatePanel>
  
         
       
 
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="MeterID" ForeColor="#333333" 
            GridLines="None" SkinID="GridView" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onsorting="GridView1_Sorting" onrowdeleting="GridView1_RowDeleting">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="False" ShowSelectButton="True" />
                <asp:TemplateField HeaderText="ID" InsertVisible="False" 
                    SortExpression="MeterID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("MeterID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("MeterID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="Metername">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Metername") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Metername") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Desc" 
                    SortExpression="MeterDescription">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" 
                            Text='<%# Bind("MeterDescription") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("MeterDescription") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Field" SortExpression="MeterField">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("MeterField") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("MeterField") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Type" SortExpression="MeterType">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("MeterType") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("MeterType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ModelID" SortExpression="ModelID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ModelID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ModelID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" SortExpression="MeterStatus">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("MeterStatus") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("MeterStatus") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Area" SortExpression="Area">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Area") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Area") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Formation" SortExpression="Formation">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Formation") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Formation") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SalesPoint" SortExpression="SalesPoint">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("SalesPoint") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("SalesPoint") %>'></asp:Label>
                    </ItemTemplate>
                

                   
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCADAWellProfileConnectionString %>" 
            DeleteCommand="DELETE FROM [Meter] WHERE [MeterID] = @MeterID" 
            InsertCommand="INSERT INTO [Meter] ([Manufacturer], [ModelID], [RTUSN], [SecurityCode], [MeterComIDAddress], [PrimaryMeasDevice], [BTUBase], [CreatedBy], [CreateDate], [LastModifiedBy], [LastModifiedDate], [Metername], [MeterDescription], [MeterField], [MeterType], [Filter], [Rank], [Route], [Connect], [ConnectString], [NRI], [CSLink], [Choke], [MeterStatus], [Area], [Formation], [ResponsibleParty1], [SalesPoint], [Reports], [ActiveChoke], [AccountingID], [PC_Outsideoperatedflag], [UnitAddress], [GroupAddress], [MeterAddress]) VALUES (@Manufacturer, @ModelID, @RTUSN, @SecurityCode, @MeterComIDAddress, @PrimaryMeasDevice, @BTUBase, @CreatedBy, @CreateDate, @LastModifiedBy, @LastModifiedDate, @Metername, @MeterDescription, @MeterField, @MeterType, @Filter, @Rank, @Route, @Connect, @ConnectString, @NRI, @CSLink, @Choke, @MeterStatus, @Area, @Formation, @ResponsibleParty1, @SalesPoint, @Reports, @ActiveChoke, @AccountingID, @PC_Outsideoperatedflag, @UnitAddress, @GroupAddress, @MeterAddress)" 
            SelectCommand="SELECT [MeterID],[Manufacturer], [ModelID], [RTUSN], [SecurityCode], [MeterComIDAddress], [PrimaryMeasDevice], [BTUBase], [CreatedBy], [CreateDate], [LastModifiedBy], [LastModifiedDate], [Metername], [MeterDescription], [MeterField], [MeterType], [Filter], [Rank], [Route], [Connect], [ConnectString], [NRI], [CSLink], [Choke], [MeterStatus], [Area], [Formation], [ResponsibleParty1], [SalesPoint], [Reports], [ActiveChoke], [AccountingID], [PC_Outsideoperatedflag], [UnitAddress], [GroupAddress], [MeterAddress], [MeterID] FROM [Meter]" 
            UpdateCommand="UPDATE [Meter] SET [Manufacturer] = @Manufacturer, [ModelID] = @ModelID, [RTUSN] = @RTUSN, [SecurityCode] = @SecurityCode, [MeterComIDAddress] = @MeterComIDAddress, [PrimaryMeasDevice] = @PrimaryMeasDevice, [BTUBase] = @BTUBase, [CreatedBy] = @CreatedBy, [CreateDate] = @CreateDate, [LastModifiedBy] = @LastModifiedBy, [LastModifiedDate] = @LastModifiedDate, [Metername] = @Metername, [MeterDescription] = @MeterDescription, [MeterField] = @MeterField, [MeterType] = @MeterType, [Filter] = @Filter, [Rank] = @Rank, [Route] = @Route, [Connect] = @Connect, [ConnectString] = @ConnectString, [NRI] = @NRI, [CSLink] = @CSLink, [Choke] = @Choke, [MeterStatus] = @MeterStatus, [Area] = @Area, [Formation] = @Formation, [ResponsibleParty1] = @ResponsibleParty1, [SalesPoint] = @SalesPoint, [Reports] = @Reports, [ActiveChoke] = @ActiveChoke, [AccountingID] = @AccountingID, [PC_Outsideoperatedflag] = @PC_Outsideoperatedflag, [UnitAddress] = @UnitAddress, [GroupAddress] = @GroupAddress, [MeterAddress] = @MeterAddress WHERE [MeterID] = @MeterID">
            <DeleteParameters>
                <asp:Parameter Name="MeterID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Manufacturer" Type="String" />
                <asp:Parameter Name="ModelID" Type="Int32" />
                <asp:Parameter Name="RTUSN" Type="String" />
                <asp:Parameter Name="SecurityCode" Type="String" />
                <asp:Parameter Name="MeterComIDAddress" Type="String" />
                <asp:Parameter Name="PrimaryMeasDevice" Type="String" />
                <asp:Parameter Name="BTUBase" Type="String" />
                <asp:Parameter Name="CreatedBy" Type="String" />
                <asp:Parameter Name="CreateDate" Type="DateTime" />
                <asp:Parameter Name="LastModifiedBy" Type="String" />
                <asp:Parameter Name="LastModifiedDate" Type="DateTime" />
                <asp:Parameter Name="Metername" Type="String" />
                <asp:Parameter Name="MeterDescription" Type="String" />
                <asp:Parameter Name="MeterField" Type="String" />
                <asp:Parameter Name="MeterType" Type="String" />
                <asp:Parameter Name="Filter" Type="String" />
                <asp:Parameter Name="Rank" Type="Int32" />
                <asp:Parameter Name="Route" Type="Int32" />
                <asp:Parameter Name="Connect" Type="String" />
                <asp:Parameter Name="ConnectString" Type="String" />
                <asp:Parameter Name="NRI" Type="Single" />
                <asp:Parameter Name="CSLink" Type="String" />
                <asp:Parameter Name="Choke" Type="Int32" />
                <asp:Parameter Name="MeterStatus" Type="String" />
                <asp:Parameter Name="Area" Type="String" />
                <asp:Parameter Name="Formation" Type="String" />
                <asp:Parameter Name="ResponsibleParty1" Type="String" />
                <asp:Parameter Name="SalesPoint" Type="String" />
                <asp:Parameter Name="Reports" Type="String" />
                <asp:Parameter Name="ActiveChoke" Type="String" />
                <asp:Parameter Name="AccountingID" Type="String" />
                <asp:Parameter Name="PC_Outsideoperatedflag" Type="String" />
                <asp:Parameter Name="UnitAddress" Type="Int32" />
                <asp:Parameter Name="GroupAddress" Type="Int32" />
                <asp:Parameter Name="MeterAddress" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Manufacturer" Type="String" />
                <asp:Parameter Name="ModelID" Type="Int32" />
                <asp:Parameter Name="RTUSN" Type="String" />
                <asp:Parameter Name="SecurityCode" Type="String" />
                <asp:Parameter Name="MeterComIDAddress" Type="String" />
                <asp:Parameter Name="PrimaryMeasDevice" Type="String" />
                <asp:Parameter Name="BTUBase" Type="String" />
                <asp:Parameter Name="CreatedBy" Type="String" />
                <asp:Parameter Name="CreateDate" Type="DateTime" />
                <asp:Parameter Name="LastModifiedBy" Type="String" />
                <asp:Parameter Name="LastModifiedDate" Type="DateTime" />
                <asp:Parameter Name="Metername" Type="String" />
                <asp:Parameter Name="MeterDescription" Type="String" />
                <asp:Parameter Name="MeterField" Type="String" />
                <asp:Parameter Name="MeterType" Type="String" />
                <asp:Parameter Name="Filter" Type="String" />
                <asp:Parameter Name="Rank" Type="Int32" />
                <asp:Parameter Name="Route" Type="Int32" />
                <asp:Parameter Name="Connect" Type="String" />
                <asp:Parameter Name="ConnectString" Type="String" />
                <asp:Parameter Name="NRI" Type="Single" />
                <asp:Parameter Name="CSLink" Type="String" />
                <asp:Parameter Name="Choke" Type="Int32" />
                <asp:Parameter Name="MeterStatus" Type="String" />
                <asp:Parameter Name="Area" Type="String" />
                <asp:Parameter Name="Formation" Type="String" />
                <asp:Parameter Name="ResponsibleParty1" Type="String" />
                <asp:Parameter Name="SalesPoint" Type="String" />
                <asp:Parameter Name="Reports" Type="String" />
                <asp:Parameter Name="ActiveChoke" Type="String" />
                <asp:Parameter Name="AccountingID" Type="String" />
                <asp:Parameter Name="PC_Outsideoperatedflag" Type="String" />
                <asp:Parameter Name="UnitAddress" Type="Int32" />
                <asp:Parameter Name="GroupAddress" Type="Int32" />
                <asp:Parameter Name="MeterAddress" Type="Int32" />
                <asp:Parameter Name="MeterID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
      
    <p>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
            DataKeyNames="MeterID" DataSourceID="SqlDataSource2" ForeColor="#333333" 
            ondatabound="FormView1_DataBound" 
            oniteminserting="FormView1_ItemInserting" onitemupdated="FormView1_ItemUpdated" 
            onitemupdating="FormView1_ItemUpdating" 
            onitemdeleting="FormView1_ItemDeleting" 
            onitemdeleted="FormView1_ItemDeleted1" onload="FormView1_Load" >
              
            <EditItemTemplate>
                 
                ID:
                <asp:Label ID="MeterIDLabel1" runat="server" Text='<%# Eval("MeterID") %>' />
                <br />
                <br />
                <table class="ui-accordion">

                    <tr>
                        <td>
                            Well:<br />
                             <%--<asp:DropDownList ID="DropDownList5" runat="server" 
                               DataTextField="ExcaliburWellName" 
                               DataValueField="Wellid" /> --%>

                               <asp:TextBox ID="txtWell" runat="server"></asp:TextBox>  


<cc1:AutoCompleteExtender   
   ID="AutoCompleteExtender1"   
    TargetControlID="txtWell"   
    runat="server" UseContextKey="True" 
    ServiceMethod="GetCompletionList" 
 
    />  
                         </td> 

                         <td>
                         MeterRun:<br />
                          <asp:TextBox ID="TextBox12" runat="server" 
                                 CssClass="CreateDate"/>
                         </td>
                         <td>
                         MeterIPAddress:<br />
                          <asp:TextBox ID="TextBox13" runat="server" 
                                 CssClass="CreateDate"/>
                         </td>
                         <td>
                         MeterIPPortNumber:<br />
                          <asp:TextBox ID="TextBox14" runat="server" 
                                 CssClass="CreateDate"/>
                         </td>
                         <td>
                         MeterType:<br />
                          <asp:TextBox ID="TextBox15" runat="server" 
                                 CssClass="CreateDate"/>
                         </td>


                         <td>
                          <br />
                             <asp:Button ID="Button4" runat="server" Text="Save Well" OnClick="Button4_Click" />
                         
                         </td>
                           <%--<cc1:CalendarExtender   ID="CalendarExtender4"    TargetControlID="TextBox12" runat="server" />
                            <cc1:CalendarExtender   ID="CalendarExtender5"    TargetControlID="TextBox13" runat="server" />--%>
                    <tr><td><hr /></td><td><hr /></td><td><hr /></td><td><hr /></td><td><hr /></td></tr>
                        
                        </tr>
                     <tr>
                     
                        <td>
                            Radio:<br />
                             <asp:DropDownList ID="DropDownList4" runat="server" 
                                DataSourceID="SqlDataSourceRadio" DataTextField="RadioName" 
                               DataValueField="Radioid" /> 
                         </td> 

                         <td>
                         Effective Date:<br />
                          <asp:TextBox ID="TextBox10" runat="server" 
                                 CssClass="CreateDate"/>
                         </td>
                         <td>
                         End date:<br />
                          <asp:TextBox ID="TextBox11" runat="server" 
                                 CssClass="CreateDate"/>
                         </td>
                         <td>
                          <br />
                             <asp:Button ID="Button3" runat="server" Text="Save Radio" OnClick="Button3_Click" />
                         
                         </td>
                           <tr><td><hr /></td><td><hr /></td><td><hr /></td><td><hr /></td><td><hr /></td></tr>
                           <cc1:CalendarExtender   ID="CalendarExtender2"    TargetControlID="TextBox10" runat="server" />
                             <cc1:CalendarExtender   ID="CalendarExtender3"    TargetControlID="TextBox11" runat="server" />
                    <tr>
                    
                    </tr>
                        <td>
                            Manufacturer:<br />
                            <asp:DropDownList ID="Manufacturer" runat="server" 
                                DataSourceID="sdsManufacturer" DataTextField="Manufacturer" 
                                DataValueField="Manufacturer" SelectedValue='<%# Bind("Manufacturer") %>' />
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            ModelID:
                            <br />
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sdsModel" 
                                DataTextField="Model" DataValueField="ModelID" 
                                SelectedValue='<%# Bind("ModelID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            RTUSN:<br />
                            <asp:TextBox ID="RTUSNTextBox" runat="server" Text='<%# Bind("RTUSN") %>' />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="RTUSNTextBox" ForeColor=Red></asp:RequiredFieldValidator >

                        </td>
                       
                        <td>
                            &nbsp;</td>
                        <td>
                            SecurityCode:
                            <br />
                            <%--<asp:TextBox ID="SecurityCodeTextBox" runat="server" 
                                Text='<%# Bind("SecurityCode") %>' />--%>
                            <asp:TextBox ID="SecurityCodeTextBox" runat="server" 
                                Text='<%# Decrypt(Eval("SecurityCode")) %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MeterComIDAddress:<br />
                            <asp:TextBox ID="MeterComIDAddressTextBox" runat="server" 
                                Text='<%# Bind("MeterComIDAddress") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            PrimaryMeasDevice:<br />
                            <asp:DropDownList ID="DropDownList3" runat="server" 
                                DataSourceID="sdsPrimaryMeasDevice" DataTextField="PrimaryMeasDevice" 
                                DataValueField="PrimaryMeasDevice" 
                                SelectedValue='<%# Bind("PrimaryMeasDevice") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            BTUBase:<br />
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sdsBTUBase" 
                                DataTextField="BTUBase" DataValueField="BTUBase" 
                                SelectedValue='<%# Bind("BTUBase") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            Filter:<br />
                            <asp:TextBox ID="FilterTextBox" runat="server" Text='<%# Bind("Filter") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MeterType:<br />
                            <asp:TextBox ID="MeterTypeTextBox" runat="server" 
                                Text='<%# Bind("MeterType") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            MeterField:<br />
                            <asp:TextBox ID="MeterFieldTextBox" runat="server" 
                                Text='<%# Bind("MeterField") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Description:<br />
                            <asp:TextBox ID="MeterDescriptionTextBox" runat="server" 
                                Text='<%# Bind("MeterDescription") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            Name:<br />
                            <asp:TextBox ID="MeternameTextBox" runat="server" 
                                Text='<%# Bind("Metername") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            GroupAddress:<br />
                            <asp:TextBox ID="GroupAddressTextBox" runat="server" 
                                Text='<%# Bind("GroupAddress") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            UnitAddress:<br />
                            <asp:TextBox ID="UnitAddressTextBox" runat="server" 
                                Text='<%# Bind("UnitAddress") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PC_Outsideoperatedflag:<br />
                            <asp:TextBox ID="PC_OutsideoperatedflagTextBox" runat="server" 
                                Text='<%# Bind("PC_Outsideoperatedflag") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            AccountingID:<br />
                            <asp:TextBox ID="AccountingIDTextBox" runat="server" 
                                Text='<%# Bind("AccountingID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ActiveChoke:<br />
                            <asp:TextBox ID="ActiveChokeTextBox" runat="server" 
                                Text='<%# Bind("ActiveChoke") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            Reports:<br />
                            <asp:TextBox ID="ReportsTextBox" runat="server" Text='<%# Bind("Reports") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            SalesPoint:<br />
                            <asp:TextBox ID="SalesPointTextBox" runat="server" 
                                Text='<%# Bind("SalesPoint") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            ResponsibleParty1:<br />
                            <asp:TextBox ID="ResponsibleParty1TextBox" runat="server" 
                                Text='<%# Bind("ResponsibleParty1") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Formation:<br />
                            <asp:TextBox ID="FormationTextBox" runat="server" 
                                Text='<%# Bind("Formation") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>

                       <tr>
                        <td>
                            Created:<br />
                   
                         <%--<asp:Calendar ID="CreateDate" runat="server" SelectedDate='<%# Fixdate(Eval("createdate")) %>' VisibleDate='<%# Fixdate(Eval("createdate")) %>' ></asp:Calendar>--%>
                          
                          

                          <asp:TextBox ID="CreateDate" runat="server" 
                                Text='<%# Bind("CreateDate") %>'  CssClass="CreateDate"/>

                          <asp:TextBox ID="CreatedBy" runat="server"  Visible="false"
                                Text='<%# Bind("CreatedBy") %>' />

                           <asp:TextBox ID="Security" runat="server" visible="false"
                                Text='<%# Bind("SecurityCode") %>' />

                       
              
                            
                          &nbsp;</td>
                    </tr>

                    <tr>
                     <cc1:CalendarExtender   ID="CalendarExtender1"    TargetControlID="CreateDate" runat="server" />
                     
                        <td>
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                CommandName="Update" OnClick="UpdateButton_Click" Text="Update" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                </table>
                <br />
                &nbsp;&nbsp;
            </EditItemTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                <table class="ui-accordion">
                    <tr>
                        <td>
                            Manufacturer:<br />
                            <asp:DropDownList ID="ManufacturerIns" runat="server" 
                                DataSourceID="sdsManufacturer" DataTextField="Manufacturer" 
                                DataValueField="Manufacturer" SelectedValue='<%# Bind("Manufacturer") %>' />
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            ModelID:<br />
                            <asp:DropDownList ID="Modelidins" runat="server" DataSourceID="sdsModel" 
                                DataTextField="Model" DataValueField="ModelID" 
                                SelectedValue='<%# Bind("ModelID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            RTUSN:<br />
                            <asp:TextBox ID="RTUSNTextBox" runat="server" Text='<%# Bind("RTUSN") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            SecurityCode:<br />
                            <asp:TextBox ID="SecurityCodeTextBox" runat="server" 
                                Text='<%# Bind("SecurityCode") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MeterComIDAddress:<br />
                            <asp:TextBox ID="MeterComIDAddressTextBox" runat="server" 
                                Text='<%# Bind("MeterComIDAddress") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            PrimaryMeasDevice:<br />
                            <asp:DropDownList ID="PrimaryMeasDeviceIns" runat="server" 
                                DataSourceID="sdsPrimaryMeasDevice" DataTextField="PrimaryMeasDevice" 
                                DataValueField="PrimaryMeasDevice" 
                                SelectedValue='<%# Bind("PrimaryMeasDevice") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            BTUBase:<br />
                            <asp:DropDownList ID="BTUBaseIns" runat="server" DataSourceID="sdsBTUBase" 
                                DataTextField="BTUBase" DataValueField="BTUBase" 
                                SelectedValue='<%# Bind("BTUBase") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            Filter:<br />
                            <asp:TextBox ID="FilterTextBox" runat="server" Text='<%# Bind("Filter") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MeterType:
                            <br />
                            <asp:TextBox ID="MeterTypeTextBox" runat="server" 
                                Text='<%# Bind("MeterType") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            MeterField:<br />
                            <asp:TextBox ID="MeterFieldTextBox" runat="server" 
                                Text='<%# Bind("MeterField") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MeterDescription:<br />
                            <asp:TextBox ID="MeterDescriptionTextBox" runat="server" 
                                Text='<%# Bind("MeterDescription") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            Metername:<br />
                            <asp:TextBox ID="MeternameTextBox" runat="server" 
                                Text='<%# Bind("Metername") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            GroupAddress:<br />
                            <asp:TextBox ID="GroupAddressTextBox" runat="server" 
                                Text='<%# Bind("GroupAddress") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            UnitAddress:<br />
                            <asp:TextBox ID="UnitAddressTextBox" runat="server" 
                                Text='<%# Bind("UnitAddress") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PC_Outsideoperatedflag:<br />
                            <asp:TextBox ID="PC_OutsideoperatedflagTextBox" runat="server" 
                                Text='<%# Bind("PC_Outsideoperatedflag") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            AccountingID:<br />
                            <asp:TextBox ID="AccountingIDTextBox" runat="server" 
                                Text='<%# Bind("AccountingID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ActiveChoke:<br />
                            <asp:TextBox ID="ActiveChokeTextBox" runat="server" 
                                Text='<%# Bind("ActiveChoke") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            Reports:<br />
                            <asp:TextBox ID="ReportsTextBox" runat="server" Text='<%# Bind("Reports") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            SalesPoint:<br />
                            <asp:TextBox ID="SalesPointTextBox" runat="server" 
                                Text='<%# Bind("SalesPoint") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            ResponsibleParty1:<br />
                            <asp:TextBox ID="ResponsibleParty1TextBox" runat="server" 
                                Text='<%# Bind("ResponsibleParty1") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Formation:<br />
                            <asp:TextBox ID="FormationTextBox" runat="server" 
                                Text='<%# Bind("Formation") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" OnClick="InsertButton_Click" Text="Insert" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                <table class="ui-accordion">
                    <tr>
                        <td>
                            MeterID:
                            <asp:Label ID="MeterIDLabel" runat="server" Text='<%# Eval("MeterID") %>' />
                        </td>
                        <td>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                        <td>
                            Manufacturer:
                            <asp:Label ID="ManufacturerLabel" runat="server" 
                                Text='<%# Bind("Manufacturer") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ModelID:
                            <asp:Label ID="ModelIDLabel" runat="server" Text='<%# Bind("ModelID") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            RTUSN:
                            <asp:Label ID="RTUSNLabel" runat="server" Text='<%# Bind("RTUSN") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            SecurityCode:
                            <asp:Label ID="SecurityCodeLabel" runat="server" 
                                Text='<%# Bind("SecurityCode") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            MeterComIDAddress:
                            <asp:Label ID="MeterComIDAddressLabel" runat="server" 
                                Text='<%# Bind("MeterComIDAddress") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            PrimaryMeasDevice:
                            <asp:Label ID="PrimaryMeasDeviceLabel" runat="server" 
                                Text='<%# Bind("PrimaryMeasDevice") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            BTUBase:
                            <asp:Label ID="BTUBaseLabel" runat="server" Text='<%# Bind("BTUBase") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Filter:
                            <asp:Label ID="FilterLabel" runat="server" Text='<%# Bind("Filter") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            MeterType:
                            <asp:Label ID="MeterTypeLabel" runat="server" Text='<%# Bind("MeterType") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MeterField:
                            <asp:Label ID="MeterFieldLabel" runat="server" 
                                Text='<%# Bind("MeterField") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            MeterDescription:
                            <asp:Label ID="MeterDescriptionLabel" runat="server" 
                                Text='<%# Bind("MeterDescription") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Metername:
                            <asp:Label ID="MeternameLabel" runat="server" Text='<%# Bind("Metername") %>' />
                            <%-- <br />
                LastModifiedDate:
                <asp:Label ID="LastModifiedDateLabel" runat="server" 
                    Text='<%# Bind("LastModifiedDate") %>' />
                <br />
                LastModifiedBy:
                <asp:Label ID="LastModifiedByLabel" runat="server" 
                    Text='<%# Bind("LastModifiedBy") %>' />
                <br />
                CreateDate:
                <asp:Label ID="CreateDateLabel" runat="server" 
                    Text='<%# Bind("CreateDate") %>' />
                <br />
                CreatedBy:
                <asp:Label ID="CreatedByLabel" runat="server" 
                    Text='<%# Bind("CreatedBy") %>' />--%>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            GroupAddress:
                            <asp:Label ID="GroupAddressLabel" runat="server" 
                                Text='<%# Bind("GroupAddress") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            UnitAddress:
                            <asp:Label ID="UnitAddressLabel" runat="server" 
                                Text='<%# Bind("UnitAddress") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            PC_Outsideoperatedflag:
                            <asp:Label ID="PC_OutsideoperatedflagLabel" runat="server" 
                                Text='<%# Bind("PC_Outsideoperatedflag") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            AccountingID:
                            <asp:Label ID="AccountingIDLabel" runat="server" 
                                Text='<%# Bind("AccountingID") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            ActiveChoke:
                            <asp:Label ID="ActiveChokeLabel" runat="server" 
                                Text='<%# Bind("ActiveChoke") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Reports:
                            <asp:Label ID="ReportsLabel" runat="server" Text='<%# Bind("Reports") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            SalesPoint:
                            <asp:Label ID="SalesPointLabel" runat="server" 
                                Text='<%# Bind("SalesPoint") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ResponsibleParty1:
                            <asp:Label ID="ResponsibleParty1Label" runat="server" 
                                Text='<%# Bind("ResponsibleParty1") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            Formation:
                            <asp:Label ID="FormationLabel" runat="server" Text='<%# Bind("Formation") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MeterAddress:
                            <asp:Label ID="MeterAddressLabel" runat="server" 
                                Text='<%# Bind("MeterAddress") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="Delete" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:FormView>
        </ContentTemplate></asp:UpdatePanel>    
    <%--<asp:TextBox ID="SecurityCodeTextBox" runat="server" 
                                Text='<%# Bind("SecurityCode") %>' />--%>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCADAWellProfileConnectionString %>" 
            DeleteCommand="DELETE FROM [Meter] WHERE [MeterID] = @MeterID" 
            InsertCommand="INSERT INTO [Meter] ([Manufacturer], [ModelID], [RTUSN], [SecurityCode], [MeterComIDAddress], [PrimaryMeasDevice], [BTUBase], [Filter], [MeterType], [MeterField], [MeterDescription], [Metername], [LastModifiedDate], [LastModifiedBy], [CreateDate], [CreatedBy], [GroupAddress], [UnitAddress], [PC_Outsideoperatedflag], [AccountingID], [ActiveChoke], [Reports], [SalesPoint], [ResponsibleParty1], [Formation]) VALUES (@Manufacturer, @ModelID, @RTUSN, @SecurityCode, @MeterComIDAddress, @PrimaryMeasDevice, @BTUBase, @Filter, @MeterType, @MeterField, @MeterDescription, @Metername, @LastModifiedDate, @LastModifiedBy, @CreateDate, @CreatedBy, @GroupAddress, @UnitAddress, @PC_Outsideoperatedflag, @AccountingID, @ActiveChoke, @Reports, @SalesPoint, @ResponsibleParty1, @Formation)" 
            SelectCommand="SELECT [MeterID], [Manufacturer], [ModelID], [RTUSN], [SecurityCode], [MeterComIDAddress], [PrimaryMeasDevice], [BTUBase], [Filter], [MeterType], [MeterField], [MeterDescription], [Metername], [LastModifiedDate], [LastModifiedBy], [CreateDate], [CreatedBy], [GroupAddress], [UnitAddress], [PC_Outsideoperatedflag], [AccountingID], [ActiveChoke], [Reports], [SalesPoint], [ResponsibleParty1], [Formation], [MeterAddress] FROM [Meter] where meterid=@meterid" 
            
            UpdateCommand="UPDATE [Meter] SET [Manufacturer] = @Manufacturer, [ModelID] = @ModelID, [RTUSN] = @RTUSN, [SecurityCode] = @SecurityCode, [MeterComIDAddress] = @MeterComIDAddress, [PrimaryMeasDevice] = @PrimaryMeasDevice, [BTUBase] = @BTUBase, [Filter] = @Filter, [MeterType] = @MeterType, [MeterField] = @MeterField, [MeterDescription] = @MeterDescription, [Metername] = @Metername, [LastModifiedDate] = @LastModifiedDate, [LastModifiedBy] = @LastModifiedBy, [CreateDate] = @CreateDate, [CreatedBy] = @CreatedBy, [GroupAddress] = @GroupAddress, [UnitAddress] = @UnitAddress, [PC_Outsideoperatedflag] = @PC_Outsideoperatedflag, [AccountingID] = @AccountingID, [ActiveChoke] = @ActiveChoke, [Reports] = @Reports, [SalesPoint] = @SalesPoint, [ResponsibleParty1] = @ResponsibleParty1, [Formation] = @Formation WHERE [MeterID] = @MeterID">
            <DeleteParameters>
                <asp:Parameter Name="MeterID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
            <asp:ControlParameter ControlID="GridView1"  Name="MeterID" Type="Int32" PropertyName="SelectedValue"/>
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="Manufacturer" Type="String" />
                <asp:Parameter Name="ModelID" Type="Int32" />
                <asp:Parameter Name="RTUSN" Type="String" />
                <asp:Parameter Name="SecurityCode" Type="String" />
                <asp:Parameter Name="MeterComIDAddress" Type="String" />
                <asp:Parameter Name="PrimaryMeasDevice" Type="String" />
                <asp:Parameter Name="BTUBase" Type="String" />
                <asp:Parameter Name="Filter" Type="String" />
                <asp:Parameter Name="MeterType" Type="String" />
                <asp:Parameter Name="MeterField" Type="String" />
                <asp:Parameter Name="MeterDescription" Type="String" />
                <asp:Parameter Name="Metername" Type="String" />
                <asp:Parameter Name="LastModifiedDate" Type="DateTime" />
                <asp:Parameter Name="LastModifiedBy" Type="String" />
                <asp:Parameter Name="CreateDate" Type="DateTime" />
                <asp:Parameter Name="CreatedBy" Type="String" />
                <asp:Parameter Name="GroupAddress" Type="Int32" />
                <asp:Parameter Name="UnitAddress" Type="Int32" />
                <asp:Parameter Name="PC_Outsideoperatedflag" Type="String" />
                <asp:Parameter Name="AccountingID" Type="String" />
                <asp:Parameter Name="ActiveChoke" Type="String" />
                <asp:Parameter Name="Reports" Type="String" />
                <asp:Parameter Name="SalesPoint" Type="String" />
                <asp:Parameter Name="ResponsibleParty1" Type="String" />
                <asp:Parameter Name="Formation" Type="String" />
                <asp:Parameter Name="MeterAddress" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Manufacturer" Type="String" />
                <asp:Parameter Name="ModelID" Type="Int32" />
                <asp:Parameter Name="RTUSN" Type="String" />
                <asp:Parameter Name="SecurityCode" Type="String" />
                <asp:Parameter Name="MeterComIDAddress" Type="String" />
                <asp:Parameter Name="PrimaryMeasDevice" Type="String" />
                <asp:Parameter Name="BTUBase" Type="String" />
                <asp:Parameter Name="Filter" Type="String" />
                <asp:Parameter Name="MeterType" Type="String" />
                <asp:Parameter Name="MeterField" Type="String" />
                <asp:Parameter Name="MeterDescription" Type="String" />
                <asp:Parameter Name="Metername" Type="String" />
                <asp:Parameter Name="LastModifiedDate" Type="DateTime" />
                <asp:Parameter Name="LastModifiedBy" Type="String" />
                <asp:Parameter Name="CreateDate" Type="DateTime" />
                <asp:Parameter Name="CreatedBy" Type="String" />
                <asp:Parameter Name="GroupAddress" Type="Int32" />
                <asp:Parameter Name="UnitAddress" Type="Int32" />
                <asp:Parameter Name="PC_Outsideoperatedflag" Type="String" />
                <asp:Parameter Name="AccountingID" Type="String" />
                <asp:Parameter Name="ActiveChoke" Type="String" />
                <asp:Parameter Name="Reports" Type="String" />
                <asp:Parameter Name="SalesPoint" Type="String" />
                <asp:Parameter Name="ResponsibleParty1" Type="String" />
                <asp:Parameter Name="Formation" Type="String" />
                <asp:Parameter Name="MeterAddress" Type="Int32" />
                <asp:Parameter Name="MeterID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsManufacturer" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCADAWellProfileConnectionString %>"  
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT [Manufacturer] FROM [libMeterManufacturer] union select null">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsModel" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCADAWellProfileConnectionString %>" 
            
            SelectCommand="SELECT [ModelID], [Model] FROM [libMeterModel]  union select null,null">
        </asp:SqlDataSource>
        &nbsp;<asp:SqlDataSource ID="sdsBTUBase" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCADAWellProfileConnectionString %>" 
            SelectCommand="SELECT [BTUBase] FROM [libMeterBTUBase] union select null"></asp:SqlDataSource>

    <p>
        <asp:SqlDataSource ID="sdsPrimaryMeasDevice" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCADAWellProfileConnectionString %>" 
            
            SelectCommand="SELECT [PrimaryMeasDevice] FROM [libMeterPrimaryMeasDevice] union select null">
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSourceMeters" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCADAWellProfileConnectionString %>" 
            SelectCommand="SELECT MeterDescription FROM Meter WHERE (LEN(MeterDescription) &gt; 0) union select null ORDER BY MeterDescription">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceRadio" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCADAWellProfileConnectionString %>" 
            SelectCommand="SELECT [RadioID], [RadioName] FROM [Radio]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceWell" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCADAWellProfileConnectionString %>" 
            SelectCommand="SELECT [ExcaliburWellName], [WellID] FROM [Well]">
        </asp:SqlDataSource>
        <br />
    </p>
     

</asp:Content>
