using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MicNets.Model;
using MicNets.BizLogic;

namespace MicNets.Web.Blog.Member.Admin
{
    public partial class UserAdmin : SecurityPage
    {
        // Fields
        private DataTable dtRoles;
        protected GridView gvUsers;
        protected HiddenField hidSortDirection;
        protected HiddenField hidSortExpression;
        protected Label lblSubTitle;
        private Customer oUser;
        protected ScriptManager ScriptManager1;
        protected UpdatePanel UpdatePanel1;

        // Methods
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Customer customer = new Customer();
            customer.Info.UserName = ((TextBox)this.gvUsers.FooterRow.Cells[0].FindControl("txtNewUserName")).Text.Trim();
            customer.Info.Password = "123456";
            customer.Info.Email = ((TextBox)this.gvUsers.FooterRow.Cells[1].FindControl("txtNewEmail")).Text.Trim();
            customer.Info.CustRole = (NRole)Enum.Parse(typeof(NRole), ((DropDownList)this.gvUsers.FooterRow.Cells[2].FindControl("ddlNewRoles")).SelectedValue);
            customer.Info.LastName = ((TextBox)this.gvUsers.FooterRow.Cells[3].FindControl("txtNewLastName")).Text.Trim();
            customer.Info.FirstName = ((TextBox)this.gvUsers.FooterRow.Cells[4].FindControl("txtNewFirstName")).Text.Trim();
            customer.Add();
            this.SetScreen();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
        }

        private int GetIndexOfDeleteColumn()
        {
            for (int i = 0; i < this.gvUsers.Columns.Count; i++)
            {
                if (this.gvUsers.Columns[i].SortExpression.Equals("Delete"))
                {
                    return i;
                }
            }
            return (this.gvUsers.Columns.Count - 1);
        }

        protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.gvUsers.Columns[this.GetIndexOfDeleteColumn()].Visible = true;
            this.gvUsers.EditIndex = -1;
            this.SetScreen();
        }

        protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (TableCell cell in e.Row.Cells)
                {
                    if (cell.HasControls())
                    {
                        LinkButton button = (LinkButton)cell.Controls[0];
                        button.CssClass = "noUnderLine";
                        if ((button != null) && this.hidSortExpression.Value.Equals(button.CommandArgument))
                        {
                            Image child = new Image();
                            child.ImageUrl = this.hidSortDirection.Value.Equals("ASC") ? "~/Image/up.gif" : "~/Image/down.gif";
                            cell.Controls.Add(new LiteralControl(" "));
                            cell.Controls.Add(child);
                        }
                    }
                }
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList listControl = (DropDownList)e.Row.FindControl("ddlNewRoles");
                this.oHelper.LoadData(this.dtRoles, listControl);
                listControl.DataBind();
            }
            else if (((e.Row.RowType == DataControlRowType.DataRow) && (e.Row.RowState == DataControlRowState.Edit)) && (e.Row.FindControl("ddlRoles") != null))
            {
                DropDownList list2 = (DropDownList)e.Row.FindControl("ddlRoles");
                this.oHelper.LoadData(this.dtRoles, list2);
                list2.DataBind();
                string strText = ((DataRowView)e.Row.DataItem).Row.ItemArray[4].ToString();
                this.oHelper.SelectedByText(list2, strText);
            }
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            CustomerInfo oCustInfo = new CustomerInfo();
            oCustInfo.CustID = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
            this.oUser.Remove(oCustInfo);
            this.SetScreen();
        }

        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsers.Columns[GetIndexOfDeleteColumn()].Visible = false;
            gvUsers.EditIndex = e.NewEditIndex;
            SetScreen();
        }

        protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            gvUsers.Columns[GetIndexOfDeleteColumn()].Visible = true;
            gvUsers.EditIndex = -1;

            CustomerInfo oInfo = new CustomerInfo();
            oInfo.CustID = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            GridViewRow editRow = gvUsers.Rows[e.RowIndex];


            oInfo.UserName = ((TextBox)editRow.Cells[0].FindControl("txtUserName")).Text.Trim();
            oInfo.Email = ((TextBox)editRow.Cells[1].FindControl("txtEmail")).Text.Trim();
            oInfo.CustRole = (NRole)Enum.Parse(typeof(NRole), ((DropDownList)editRow.Cells[2].FindControl("ddlRoles")).SelectedValue);
            oInfo.LastName = ((TextBox)editRow.Cells[3].FindControl("txtLastName")).Text.Trim();
            oInfo.FirstName = ((TextBox)editRow.Cells[4].FindControl("txtFirstName")).Text.Trim();

            oUser.Modify(oInfo);
            SetScreen();
        }

        protected void gvUsers_Sorting(object sender, GridViewSortEventArgs e)
        {
            this.hidSortDirection.Value = (this.hidSortExpression.Value.Equals(e.SortExpression) && this.hidSortDirection.Value.Equals("ASC")) ? "DESC" : "ASC";
            this.hidSortExpression.Value = e.SortExpression;
            this.SetScreen();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.oUser = new Customer();
            this.oHelper = new Helper();
            if (!this.Page.IsPostBack)
            {
                this.hidSortDirection.Value = "ASC"; 
                this.hidSortExpression.Value = "username";
                this.SetScreen();
            }
        }

        private void SetScreen()
        {
            DataSet set = this.oUser.LoadAll();
            DataView view = new DataView(set.Tables[0]);
            view.Sort = this.hidSortExpression.Value + " " + this.hidSortDirection.Value;
            this.gvUsers.DataSource = view;
            this.dtRoles = set.Tables[1];
            this.gvUsers.DataBind();
        }

    }
}
