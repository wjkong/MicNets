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
using AjaxControlToolkit;
using MicNets.BizLogic;
using MicNets.Model;
using System.Text;

namespace MicNets.Web.Controls
{
    public partial class ctlAddressBook : BaseControl
    {
        // Fields
        protected Button btnAdd;
        protected Button btnClear;
        protected Button btnReset;
        protected Button btnSearch;
        protected CheckBox chkPhoneChina;
        protected DataGrid dgContact;
        protected HtmlInputHidden hidPopupMeg;
        protected HtmlInputHidden hidSortDirection;
        protected HtmlInputHidden hidSortExpression;
        protected Image Image1;
        protected Image Image2;
        protected Image Image3;
        protected MaskedEditExtender makCell;
        protected MaskedEditExtender makPhone;
        protected MultiView mvwContact;
        private Contact oContact;
        protected PlaceHolder phdAlphaBar;
        protected RadioButtonList radlAction;
        protected RadioButtonList radlSearchBy;
        protected ScriptManager ScriptManager1;
        protected TextBox txtCell;
        protected TextBox txtEmail;
        protected TextBox txtFirstName;
        protected TextBox txtLastName;
        protected TextBox txtNewEmail;
        protected TextBox txtNewFirstName;
        protected TextBox txtNewLastName;
        protected TextBox txtPhone;
        protected RegularExpressionValidator vldeEmail;
        protected RequiredFieldValidator vldrFirstName;
        protected RequiredFieldValidator vldrLastName;
        protected View vwAddNewContact;
        protected View vwMaintainContact;

        // Methods
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                this.oContact.LastName = this.txtNewLastName.Text.Trim();
                this.oContact.FirstName = this.txtNewFirstName.Text.Trim();
                this.oContact.Email = this.txtNewEmail.Text.Trim();
                this.oContact.Phone = this.txtPhone.Text.Trim();
                this.oContact.CellPhone = this.txtCell.Text.Trim();
                this.oContact.IsFromChina = this.chkPhoneChina.Checked;
                if (this.oContact.AddOne())
                {
                    this.hidPopupMeg.Value = "Successfully, added a new contact info.";
                    this.CleanUp();
                }
                else
                {
                    this.hidPopupMeg.Value = MicNets.Model.Utility.NOTICE_INTERNAL_ERROR;
                }
            }
        }

        protected void btnAlpha_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            string text = button.Text;
            this.txtLastName.Text = string.Empty;
            this.txtFirstName.Text = string.Empty;
            if (!button.Text.Equals("All"))
            {
                if (this.radlSearchBy.SelectedValue.Equals("LASTNAME"))
                {
                    this.txtLastName.Text = button.Text;
                    this.hidSortExpression.Value = "lastName";
                    this.hidSortDirection.Value = NSortDirection.ASC.ToString();
                }
                else
                {
                    this.txtFirstName.Text = button.Text;
                    this.hidSortExpression.Value = "firstName";
                    this.hidSortDirection.Value = NSortDirection.ASC.ToString();
                }
            }
            this.dgContact.CurrentPageIndex = 0;
            this.SetScreen();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            this.CleanUp();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            this.txtEmail.Text = string.Empty;
            this.txtFirstName.Text = string.Empty;
            this.txtLastName.Text = string.Empty;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.SetScreen();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int rowIndex = ((DataGridItem)((Control)sender).Parent.Parent).ItemIndex;
            this.oContact.ContactID = Convert.ToInt32(this.dgContact.DataKeys[rowIndex]);
            if (this.oContact.Remove())
            {
                 base.BuildPopup("Successfully, deleted a contact from list.");
            }
            else
            {
                base.BuildPopup(MicNets.Model.Utility.NOTICE_INTERNAL_ERROR);
            }
            this.SetScreen();
        }

        private void BuildAlphaBar()
        {
            LinkButton child = new LinkButton();
            child.Text = "All";
            child.CssClass = "noUnderLine";
            child.Font.Bold = true;
            child.Click += new EventHandler(this.btnAlpha_Click);
            this.phdAlphaBar.Controls.Add(child);
            char ch = 'A';
            for (int i = 0; i < 0x1a; i++)
            {
                Label label = new Label();
                label.Text = " | ";
                this.phdAlphaBar.Controls.Add(label);
                LinkButton button2 = new LinkButton();
                button2.Text = Convert.ToChar((int)(ch + i)).ToString();
                button2.CssClass = "noUnderLine";
                button2.Font.Bold = true;
                button2.Click += new EventHandler(this.btnAlpha_Click);
                this.phdAlphaBar.Controls.Add(button2);
            }
        }

        private string BuildFilterString()
        {
            StringBuilder builder = new StringBuilder();
            if (!base.oHelper.IsNullOrEmpty(this.txtFirstName.Text))
            {
                builder.Append("AND FirstName LIKE '" + this.txtFirstName.Text.Trim() + "%' ");
            }
            if (!base.oHelper.IsNullOrEmpty(this.txtLastName.Text))
            {
                builder.Append("AND LastName LIKE '" + this.txtLastName.Text.Trim() + "%' ");
            }
            if (!base.oHelper.IsNullOrEmpty(this.txtEmail.Text))
            {
                builder.Append("AND Email LIKE '%" + this.txtEmail.Text.Trim() + "%' ");
            }
            if (builder.Length > 0)
            {
                return builder.ToString().Substring(3);
            }
            return string.Empty;
        }

        private string Capitalize(string str)
        {
            if ((str != null) && (str.Trim().Length > 0))
            {
                str = str.Trim();
                return (str.Substring(0, 1).ToUpper() + str.Substring(1));
            }
            return string.Empty;
        }

        protected void chkPhoneChina_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chkPhoneChina.Checked)
            {
                this.makPhone.MaskType = MaskedEditType.None;
                this.makPhone.Mask = @"\(9999999\)9999\-9999";
                this.txtPhone.Text = "(0118620";
                this.makCell.Mask = @"\(99999999\)9999\-9999";
                this.txtCell.Text = "(0118613";
            }
            else
            {
                this.makPhone.Mask = @"\(999\)999\-9999";
                this.makCell.Mask = @"\(999\)999\-9999";
                this.txtPhone.Text = string.Empty;
                this.txtCell.Text = string.Empty;
            }
        }

        private void CleanUp()
        {
            this.txtCell.Text = string.Empty;
            this.txtPhone.Text = string.Empty;
            this.txtNewEmail.Text = string.Empty;
            this.txtNewFirstName.Text = string.Empty;
            this.txtNewLastName.Text = string.Empty;
            this.chkPhoneChina.Checked = false;
        }

        protected void dgContact_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            int deleteColIndex = this.GetDeleteColIndex(this.dgContact);
            if (deleteColIndex != 0x7fffffff)
            {
                this.dgContact.Columns[deleteColIndex].Visible = true;
            }
            this.dgContact.EditItemIndex = -1;
            this.SetScreen();
        }

        protected void dgContact_EditCommand(object source, DataGridCommandEventArgs e)
        {
            int deleteColIndex = this.GetDeleteColIndex(this.dgContact);
            if (deleteColIndex != 0x7fffffff)
            {
                this.dgContact.Columns[deleteColIndex].Visible = false;
            }
            this.dgContact.EditItemIndex = e.Item.ItemIndex;
            this.SetScreen();
            MaskedEditExtender extender = (MaskedEditExtender)this.dgContact.Items[e.Item.ItemIndex].FindControl("makPhone");
            MaskedEditExtender extender2 = (MaskedEditExtender)this.dgContact.Items[e.Item.ItemIndex].FindControl("makCellPhone");
            CheckBox box = (CheckBox)this.dgContact.Items[e.Item.ItemIndex].FindControl("chkChina");
            if (box.Checked)
            {
                extender.Mask = @"\(9999999\)9999\-9999";
                extender2.Mask = @"\(99999999\)9999\-9999";
            }
            else
            {
                extender2.Mask = @"\(999\)999\-9999";
                extender.Mask = @"\(999\)999\-9999";
            }
        }

        protected void dgContact_ItemCreated(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Pager)
            {
                TableCell cell = (TableCell)e.Item.Controls[0];
                for (int i = 0; i < cell.Controls.Count; i += 2)
                {
                    object obj2 = cell.Controls[i];
                    if (obj2 is LinkButton)
                    {
                        LinkButton button = (LinkButton)obj2;
                        button.Text = "[ " + button.Text + " ]";
                        button.CssClass = "noUnderLine";
                    }
                    else
                    {
                        Label label = (Label)obj2;
                        label.Text = "Page " + label.Text;
                    }
                }
            }
            else if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

            }
        }

        protected void dgContact_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                foreach (TableCell cell in e.Item.Cells)
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
        }

        protected void dgContact_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            this.dgContact.CurrentPageIndex = e.NewPageIndex;
            this.SetScreen();
        }

        protected void dgContact_SortCommand(object source, DataGridSortCommandEventArgs e)
        {
            if (this.hidSortExpression.Value.ToUpper().Equals(e.SortExpression.ToUpper()))
            {
                if (this.hidSortDirection.Value.Equals(NSortDirection.ASC.ToString()))
                {
                    this.hidSortDirection.Value = NSortDirection.DESC.ToString();
                }
                else
                {
                    this.hidSortDirection.Value = NSortDirection.ASC.ToString();
                }
            }
            else
            {
                this.hidSortExpression.Value = e.SortExpression;
                this.hidSortDirection.Value = NSortDirection.ASC.ToString();
            }
            this.SetScreen();
        }

        protected void dgContact_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
            if (this.Page.IsValid)
            {
                TextBox box = (TextBox)e.Item.FindControl("txtLastName");
                TextBox box2 = (TextBox)e.Item.FindControl("txtFirstName");
                TextBox box3 = (TextBox)e.Item.FindControl("txtPhone");
                TextBox box4 = (TextBox)e.Item.FindControl("txtCellPhone");
                TextBox box5 = (TextBox)e.Item.FindControl("txtEmail");
                CheckBox box6 = (CheckBox)e.Item.FindControl("chkChina");
                this.oContact.ContactID = Convert.ToInt32(this.dgContact.DataKeys[e.Item.ItemIndex]);
                this.oContact.LastName = this.Capitalize(box.Text);
                this.oContact.FirstName = this.Capitalize(box2.Text);
                this.oContact.Phone = box3.Text.Trim();
                this.oContact.CellPhone = box4.Text.Trim();
                this.oContact.Email = box5.Text.Trim();
                this.oContact.IsFromChina = box6.Checked;
                if (this.oContact.Modify())
                {
                    base.BuildPopup("Successfully, updated contact's information.");
                }
                else
                {
                    base.BuildPopup(MicNets.Model.Utility.NOTICE_INTERNAL_ERROR);
                }
            }
            int deleteColIndex = this.GetDeleteColIndex(this.dgContact);
            if (deleteColIndex != 0x7fffffff)
            {
                this.dgContact.Columns[deleteColIndex].Visible = true;
            }
            this.dgContact.EditItemIndex = -1;
            this.SetScreen();
        }

        private int GetDeleteColIndex(DataGrid dg)
        {
            for (int i = 0; i < dg.Columns.Count; i++)
            {
                if (dg.Columns[i].SortExpression.Equals("DELETE"))
                {
                    return i;
                }
            }
            return 0x7fffffff;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.oContact = new Contact();
            this.hidPopupMeg.Value = string.Empty;
            if (!this.Page.IsPostBack)
            {
                this.mvwContact.SetActiveView(this.vwMaintainContact);
                this.hidSortExpression.Value = "firstName";
                this.hidSortDirection.Value = NSortDirection.ASC.ToString();
                this.SetScreen();
            }
            if (this.radlAction.SelectedValue.Equals("LIST"))
            {
                this.BuildAlphaBar();
            }
        }

        protected void radlAction_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.radlAction.SelectedValue.Equals("LIST"))
            {
                this.mvwContact.SetActiveView(this.vwMaintainContact);
                this.Page.SetFocus(this.txtFirstName.ClientID);
            }
            else
            {
                this.mvwContact.SetActiveView(this.vwAddNewContact);
                this.Page.SetFocus(this.txtNewFirstName.ClientID);
            }
        }

        private void SetScreen()
        {
            this.Page.SetFocus(this.txtFirstName.ClientID);
            DataView view = new DataView(this.oContact.LoadAll());
            view.RowFilter = this.BuildFilterString();
            view.Sort = this.hidSortExpression.Value + " " + this.hidSortDirection.Value;
            if (this.hidSortExpression.Value.Equals("firstName"))
            {
                view.Sort = view.Sort + ", lastName ASC";
            }
            else if (this.hidSortExpression.Value.Equals("lastName"))
            {
                view.Sort = view.Sort + ", firstName ASC";
            }
            this.dgContact.DataSource = view;
            this.dgContact.DataBind();
        }
    }
}