using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Eisk.Web;
using System.Reflection;
using EXCO.Utility;

namespace Eisk.Web
{
    public partial class AdminTables : System.Web.UI.Page
    {
        private static List<Well> _allWells = null;
        private static DateTime _lastCachedTime = DateTime.Now;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetAllWellHeaders();
            }

            //if (!Page.IsPostBack)
            //{

            //Call Stored procedure
            //try
            //{
            //     Return ID Intentity of Inserted Record
            //    Int32? refint = 1;
            //    WellProfileDataContext dc = new WellProfileDataContext();
            //    dc.proc_WellXMeterHistoryInsert(ref refint, 14, 37896, "", "", 8, "", 1011, "", "", "", System.DateTime.Now, "", System.DateTime.Now);
            //    dc.SubmitChanges();
            //}
            //catch
            //{

            //}

            try
            {
                string currentuser = Authenication.GetCurrentUserWindowsLogin();
            }
            catch
            {
            }
            
           
            bindGridView();
            
            //}
            ///    
            //MessageLabel.Text = FormView1.CurrentMode.ToString();
            //SqlDataSource1 = " SELECT [MeterID],[Manufacturer], [ModelID], [RTUSN], [SecurityCode], [MeterComIDAddress], [PrimaryMeasDevice], [BTUBase], [CreatedBy], [CreateDate], [LastModifiedBy], [LastModifiedDate], [Metername], [MeterDescription], [MeterField], [MeterType], [Filter], [Rank], [Route], [Connect], [ConnectString], [NRI], [CSLink], [Choke], [MeterStatus], [Area], [Formation], [ResponsibleParty1], [SalesPoint], [Reports], [ActiveChoke], [AccountingID], [PC_Outsideoperatedflag], [UnitAddress], [GroupAddress], [MeterAddress], [MeterID] FROM [Meter]";
            //SqlDataSource1=
           
        }
        

          
        private void bindGridView()
        {
            WellProfileDataContext dc = new WellProfileDataContext();
            if (drpMeters.SelectedValue.Length > 0)
            {
                var NewDataSource = from data in dc.Meters.Where(x => x.MeterDescription == drpMeters.SelectedValue)
                                    select data;

                GridView1.DataSource = NewDataSource.ToList();
                GridView1.DataBind();
            }

            else
            {
              
                GridView1.DataSource = dc.Meters.ToList();
                GridView1.DataBind();
                
            }      

          
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridView1.PageIndex = e.NewPageIndex;
            bindGridView(); //bindgridview will get the data source and bind it again
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {

            //System.Linq.IOrderedEnumerable<Meter> lm = Sort(dc.Meters.ToList(), e.SortExpression.ToString(), e.SortDirection.ToString());
            //string sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);
            
            WellProfileDataContext dc = new WellProfileDataContext();

            string area = e.SortExpression.ToString();
            string order = GetSortDirection(area);
         


            string caseSwitch = e.SortExpression.ToString();

            switch (caseSwitch)
            {
                case "Area":
                    area = "Area";               
                    break;
                case "Metername":
                    area = "Metername";
                    break;
                case "MeterDescription":
                    area = "MeterDescription";
                    break;
                default:
                  
                    break;
            }

            var NewDataSource = from data in dc.Meters
                                select data;

            //System.Linq.IOrderedQueryable<Meter> query;

            if (area == "Area")
            {
                if (order == "ASC")
                {
                    NewDataSource = NewDataSource.OrderBy(x => x.Area);
                }
                else
                {
                    NewDataSource = NewDataSource.OrderByDescending(x => x.Area);
                }            
               

            }
            if (area == "Metername")
            {
                if (order == "ASC")
                {
                    NewDataSource = NewDataSource.OrderBy(x => x.Metername);
                }
                else
                {
                    NewDataSource = NewDataSource.OrderByDescending(x => x.Metername);
                }


            }



            GridView1.DataSource = NewDataSource.ToList();      
            GridView1.DataBind();

        }

        protected void UpdateButton_Click(Object sender, EventArgs e)
        {

            try
            {
                //Use the UpdateItem method to programmatically update
                //the current record in the FormView control. 

                String key = FormView1.DataKey.Value.ToString();

                //Calendar cl = new Calendar();
                //cl= (Calendar)FormView1.FindControl("createdate");

                //cl.SelectedDate = Convert.ToDateTime("12/10/2013");
                
                TextBox txtTextBoxValue = new TextBox();
                txtTextBoxValue = (TextBox)FormView1.FindControl("MeternameTextBox");

                TextBox txtTextBoxValue1 = new TextBox();
                txtTextBoxValue1 = (TextBox)FormView1.FindControl("Meterid");

                //TODO
                //,[CreatedBy]
                //,[CreateDate]
                //,[LastModifiedBy]
                //,[LastModifiedDate]

                if (FormView1.CurrentMode == FormViewMode.Edit)
                {
                    TextBox txtTextBoxCreatedBy = new TextBox();
                    txtTextBoxCreatedBy = (TextBox)FormView1.FindControl("Createdby");
                    txtTextBoxCreatedBy.Text = Authenication.GetCurrentUserWindowsLogin();

                }

                //Hidden fiels- must be bound to update
                TextBox txtTextBoxSecurity = new TextBox();
                txtTextBoxSecurity = (TextBox)FormView1.FindControl("SecurityCodeTextBox");

                TextBox txtTextBoxSecurityEnc = new TextBox();
                txtTextBoxSecurityEnc = (TextBox)FormView1.FindControl("Security");
                
                try
                {
                    txtTextBoxSecurityEnc.Text = Encryption.Encrypt(txtTextBoxSecurity.Text, "NoPass123456789");
                }
                catch
                {
                   
                }
                //End Hidden


               
               


                //TextBox txtTextBoxValue2 = new TextBox();
                //txtTextBoxValue2 = (TextBox)FormView1.FindControl("ManufacturerTextBox");
                //txtTextBoxValue2.Text = "Eagle";

                //Response.Write(txtTextBoxValue.Text);

                try
                {
                    FormView1.UpdateItem(true);
                    FormView1.ChangeMode(FormViewMode.Edit);
                }
                catch (Exception ex)
                {
                    MessageLabel.Text = "Error Inserting";
                }



            }
            catch (HttpException ex)
            {
                //MessageLabel.Text = "The FormView control must be in edit mode to update a record.";
            }

        }

        public DateTime Fixdate(object value)
        {
            if (value != null & value.ToString()!="")
            {
                return (System.DateTime) value;
            }
            else
            {
                return System.DateTime.Now;
            }
           
        }

        public String Decrypt(object value)
        {
            string code ="spikergo";
            string encode ="spikergo";

            encode = Encryption.Encrypt(code, "NoPass123456789");
            
            if (value != null & value.ToString() != "")
            {
                
                return Encryption.Decrypt((System.String)value, "NoPass123456789");
            }
            else
            {
                return System.String.Empty;
               
            }

        }

        protected void InsertButton_Click(Object sender, EventArgs e)
        {

            try
            {
              
                TextBox txtTextBoxValue = new TextBox();
                txtTextBoxValue = (TextBox)FormView1.FindControl("MeternameTextBox");

                TextBox txtTextBoxValue1 = new TextBox();
                txtTextBoxValue1 = (TextBox)FormView1.FindControl("Meterid");

                //TextBox txtTextBoxValue2 = new TextBox();
                //txtTextBoxValue2 = (TextBox)FormView1.FindControl("ManufacturerTextBox");
                //txtTextBoxValue2.Text = "Eagle";

                Response.Write(txtTextBoxValue.Text);

                try
                {
                    //FormView1.InsertItem(true);
                    FormView1.ChangeMode(FormViewMode.Insert);
                }
                catch (Exception ex)
                {
                    MessageLabel.Text = "Error Inserting";
                }



            }
            catch (HttpException ex)
            {
                //MessageLabel.Text = "The FormView control must be in edit mode to update a record.";
            }

        }

        protected void FormView1_DataBound(object sender, EventArgs e)
        {
            try

            {
                if (FormView1.CurrentMode == FormViewMode.Edit)
                {
                    DropDownList DropDownListValue = new DropDownList();
                    DropDownListValue = (DropDownList)FormView1.FindControl("DropDownList5");
                    if (DropDownListValue!=null)
                    {
                        DropDownListValue.DataSource = _allWells;
                        DropDownListValue.DataBind();

                    }
                    
                }
            }
            catch
            {
            }
           

            Console.WriteLine("Here");

            MessageLabel.Text = "";
            if (FormView1.CurrentMode == FormViewMode.Edit)
            {
                //DropDownList ddlStrategies = (DropDownList)frmOrderDetails.FindControl("ddlStrategies");
                //ddlStrategies.SelectedValue = Your DB Value Goes here;
            }
        }

        protected void CancelButton_Click(Object sender, EventArgs e)
        {

            //// Return the FormView control to read-only
            //// mode.
            //FormView1.ChangeMode(FormViewMode.ReadOnly);
            //MessageLabel.Text = "";

        }


        private string GetSortDirection(string column)
        {

            // By default, set the sort direction to ascending.
            string sortDirection = "ASC";

            // Retrieve the last column that was sorted.
            string sortExpression = ViewState["SortExpression"] as string;

            if (sortExpression != null)
            {
                // Check if the same column is being sorted.
                // Otherwise, the default value can be returned.
                if (sortExpression == column)
                {
                    string lastDirection = ViewState["SortDirection"] as string;
                    if ((lastDirection != null) && (lastDirection == "ASC"))
                    {
                        sortDirection = "DESC";
                    }
                }
            }

            // Save new values in ViewState.
            ViewState["SortDirection"] = sortDirection;
            ViewState["SortExpression"] = column;

            return sortDirection;
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            try
            {
            }
            catch
            {
            }

        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {          
             if(MessageLabel.Text=="Error Inserting")
             {
                 e.Cancel = true;
             }
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {

            if (MessageLabel.Text == "Error Inserting")
            {
                e.Cancel = true;
            }
            
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //delete the row and rebind
            //GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            //TableCell cell = GridView1.Rows[e.RowIndex].Cells[3];
            String key = GridView1.DataKeys[e.RowIndex].Value.ToString();

        }

        protected void FormView1_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            TableCell cell = GridView1.Rows[e.RowIndex].Cells[3];
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            WellProfileDataContext dc = new WellProfileDataContext();
            GridView1.DataSource = dc.Meters.ToList();
            GridView1.DataBind();
        }

        protected void FormView1_ItemDeleted1(object sender, FormViewDeletedEventArgs e)
        {
            WellProfileDataContext dc = new WellProfileDataContext();
            GridView1.DataSource = dc.Meters.ToList();
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //GridView1.Visible = false;
            //LinkButton1.Visible = false;
            FormView1.ChangeMode(FormViewMode.Insert);
            FormView1.Visible = true;

        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            WellProfileDataContext dc = new WellProfileDataContext();
            var NewDataSource = from data in dc.Meters.Where(x => x.MeterDescription == drpMeters.SelectedValue)
                                select data;



            GridView1.DataSource = NewDataSource.ToList();
            GridView1.DataBind();
            FormView1.ChangeMode(FormViewMode.Edit);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            drpMeters.SelectedIndex = -1;
            WellProfileDataContext dc = new WellProfileDataContext();
            GridView1.DataSource = dc.Meters.ToList();
            GridView1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            TextBox txtTextBoxValue = new TextBox();
            txtTextBoxValue = (TextBox)FormView1.FindControl("TextBox10");
          
        }

        protected static List<Well> BindWellList()
        {
            List<Well> wells = new List<Well>();
          
            WellProfileDataContext dc = new WellProfileDataContext();
            wells = dc.Wells.ToList();
                       

            //foreach (Well wl in wells)
            //{                
            //    wells.Add(new Well
            //    {
            //        ExcaliburWellName = wl.ExcaliburWellName,
            //        WellID = wl.WellID
            //    });
            //}
            
            return wells;
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static String[] GetCompletionList(string prefixText, int count, string contextKey)
        {

            Well[] wa = (from m in _allWells where m.ExcaliburWellName.StartsWith(prefixText, StringComparison.CurrentCultureIgnoreCase) select m).Take(count).ToArray();

            int counter = wa.Length;
            string[] wells = new string[counter - 1];

            for (int i = 0; i < counter - 1; i++)
            {
                wells[i] = wa[i].ExcaliburWellName;
            }


            return (from m in wells where m.StartsWith(prefixText, StringComparison.CurrentCultureIgnoreCase) select m).Take(count).ToArray();
        }  

        private static List<Well> GetAllWellHeaders()
        {
            bool refreshCache = false;

            if (_allWells == null)
            {
                refreshCache = true;

            }
            else
            {
                TimeSpan timeSinceLastCache = DateTime.Now - _lastCachedTime;
                if (timeSinceLastCache != null)
                {
                    if (timeSinceLastCache.Minutes > 20)
                    {
                        refreshCache = true;
                    }
                }
            }

            if (refreshCache)
            {
                lock (typeof(Well))
                {
                    _allWells = BindWellList();
                    _lastCachedTime = DateTime.Now;
                }
            }

            return _allWells;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            TextBox txtTextBoxValue = new TextBox();
            txtTextBoxValue = (TextBox)FormView1.FindControl("TextBox10");

        }

        protected void FormView1_Load(object sender, EventArgs e)
        {
              DropDownList DropDownListValue = new DropDownList ();
              DropDownListValue = (DropDownList)FormView1.FindControl("DropDownList5");
              Console.WriteLine("Here");
        }  
   

    }
}