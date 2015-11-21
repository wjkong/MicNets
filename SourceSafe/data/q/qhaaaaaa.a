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
using MicNets.BizLogic;
using MicNets.Model;

namespace MicNets.Web.Blog.Member.Admin
{
    public partial class LinkAdmin : SecurityPage
    {
        // Fields
        protected Button btnAdd;
        protected ImageButton btnBottom;
        protected ImageButton btnDown;
        protected Button btnSave;
        protected ImageButton btnTop;
        protected ImageButton btnUp;
        protected CheckBox chkExternalLink;
        protected DropDownList ddlCata;
        protected DropDownList ddlCatalogue;
        protected GridView dgLink;
        protected Label lblCatalogue;
        protected Label lblSubTitle;
        protected ListBox lstLink;
        protected MultiView mvwLink;
        protected Panel Panel1;
        protected RadioButtonList radlAction;
        protected TextBox txtText;
        protected TextBox txtTextCh;
        protected TextBox txtURL;
        protected RequiredFieldValidator vldrText;
        protected RequiredFieldValidator vldrURL;
        protected View vwAddLink;
        protected View vwAdjustLink;
        protected View vwEditLink;

        // Methods
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                Link link = new Link();
                link.Info.Text = this.txtText.Text.Trim();
                link.Info.URL = this.txtURL.Text.Trim();
                link.Info.ParentLinkID = Convert.ToInt32(this.ddlCatalogue.SelectedValue);
                link.Info.IsExternal = this.chkExternalLink.Checked;
                link.Info.LinkCategory = (NLinkCategory)base.oHelper.GetEnumByName(typeof(NLinkCategory), this.ddlCata.SelectedItem.Text);
                if (link.Add())
                {
                    this.txtText.Text = string.Empty;
                    this.txtTextCh.Text = string.Empty;
                    this.txtURL.Text = string.Empty;
                    base.BuildPopup("Successfully added a new link.");
                }
                else
                {
                    base.BuildPopup(MicNets.Model.Utility.NOTICE_INTERNAL_ERROR);
                }
            }
            else
            {
                base.BuildPopup(MicNets.Model.Utility.NOTICE_INTERNAL_ERROR);
            }
        }

        protected void btnBottom_Click(object sender, EventArgs e)
        {
            this.MasageData(this.lstLink.Items.Count - 1);
        }

        protected void btnDown_Click(object sender, EventArgs e)
        {
            if (this.lstLink.SelectedIndex < (this.lstLink.Items.Count - 1))
            {
                this.MasageData(this.lstLink.SelectedIndex + 1);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            bool flag = true;
            Link link = new Link();
            for (int i = 0; i < this.lstLink.Items.Count; i++)
            {
                link.Info.Sequence = i;
                link.Info.LinkID = Convert.ToInt32(this.lstLink.Items[i].Value);
                link.Info.CurrentTask = NTaskLink.UpdateOneSequence;
                if (!link.Modify())
                {
                    flag = false;
                }
            }
            if (flag)
            {
                base.BuildPopup("Successfully, adjusted the sequence of the links.");
            }
            else
            {
                base.BuildPopup(MicNets.Model.Utility.NOTICE_INTERNAL_ERROR);
            }
        }

        protected void btnTop_Click(object sender, EventArgs e)
        {
            this.MasageData(0);
        }

        protected void btnUp_Click(object sender, EventArgs e)
        {
            if (this.lstLink.SelectedIndex > 0)
            {
                this.MasageData(this.lstLink.SelectedIndex - 1);
            }
        }

        protected void chkExternalLink_CheckedChanged(object sender, EventArgs e)
        {
            this.SetScreen();
        }

        protected void ddlCata_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SetScreen();
        }

        protected void ddlCatalogue_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.radlAction.Visible = this.ddlCatalogue.SelectedItem.Text != Utility.DEFAULT_SELECTION;
            this.mvwLink.Visible = this.radlAction.Visible;
            if (this.mvwLink.Visible)
            {
                this.radlAction.SelectedIndex = 0;
                this.mvwLink.ActiveViewIndex = 0;
                this.RefreshGrid();
            }
        }

        protected void dgLink_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.dgLink.EditIndex = -1;
            this.RefreshGrid();
        }

        protected void dgLink_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Link oLink = new Link();
            oLink.Info.LinkID = Convert.ToInt32(dgLink.DataKeys[e.RowIndex].Value); 
            
            if (oLink.Remove())
            {
                base.BuildPopup("Successfully, deleted a link from the list.");
            }
            else
            {
                base.BuildPopup(MicNets.Model.Utility.NOTICE_INTERNAL_ERROR);
            }
            this.RefreshGrid();
        }

        protected void dgLink_RowEditing(object sender, GridViewEditEventArgs e)
        {
            this.dgLink.EditIndex = e.NewEditIndex;
            this.RefreshGrid();
        }

        protected void dgLink_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Link oLink = new Link();
            oLink.Info.LinkID = Convert.ToInt32(dgLink.DataKeys[e.RowIndex].Value);
            oLink.Info.Text = ((TextBox)dgLink.Rows[e.RowIndex].FindControl("txtText")).Text.Trim();
            oLink.Info.URL = ((TextBox)dgLink.Rows[e.RowIndex].FindControl("txtURL")).Text.Trim();

            if (oLink.Modify())
            {
                base.BuildPopup("Successfully, updated the link information.");
            }
            else
            {
                base.BuildPopup(MicNets.Model.Utility.NOTICE_INTERNAL_ERROR);
            }
            this.dgLink.EditIndex = -1;
            this.RefreshGrid();
        }

        private void MasageData(int insertIndex)
        {
            if (this.lstLink.SelectedIndex == -1)
            {
                base.BuildPopup("Please, select a link.");
            }
            else
            {
                DataTable table = (DataTable)base.Cache["dtLink"];
                DataRow row = table.NewRow();
                row["linkID"] = this.lstLink.SelectedValue;
                row["text"] = this.lstLink.SelectedItem.Text;
                table.Rows.RemoveAt(this.lstLink.SelectedIndex);
                table.Rows.InsertAt(row, insertIndex);
                this.lstLink.DataSource = table;
                this.lstLink.DataBind();
                this.lstLink.SelectedIndex = insertIndex;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            base.oHelper = new Helper();
            if (!this.Page.IsPostBack)
            {
                this.SetScreen();
            }
        }

        protected void radlAction_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.mvwLink.ActiveViewIndex = Convert.ToInt32(this.radlAction.SelectedValue);
            if (this.radlAction.SelectedItem.Text == "Edit Existing Link")
            {
                this.RefreshGrid();
            }
            else if (this.radlAction.SelectedItem.Text == "Adjust Link Sequence")
            {
                this.RefreshList();
            }
        }

        private void RefreshGrid()
        {
            base.oHelper = new Helper();
            Link link = new Link();
            link.Info.ParentLinkID = Convert.ToInt32(this.ddlCatalogue.SelectedValue);
            link.Info.IsExternal = this.chkExternalLink.Checked;
            link.Info.LinkCategory = (NLinkCategory)base.oHelper.GetEnumByName(typeof(NLinkCategory), this.ddlCata.SelectedItem.Text);
            link.Info.CurrentTask = NTaskLink.LoadAllByParent;
            this.dgLink.DataSource = link.LoadAll().Tables[0];
            this.dgLink.DataBind();
        }

        private void RefreshList()
        {
            Link link = new Link();
            link.Info.IsExternal = this.chkExternalLink.Checked;
            link.Info.ParentLinkID = Convert.ToInt32(this.ddlCatalogue.SelectedValue);
            link.Info.CurrentTask = NTaskLink.LoadAllByParent;
            link.Info.LinkCategory = (NLinkCategory)base.oHelper.GetEnumByName(typeof(NLinkCategory), this.ddlCata.SelectedItem.Text);
            DataTable table = link.LoadAll().Tables[0];
            this.lstLink.DataSource = table;
            this.lstLink.DataTextField = "text";
            this.lstLink.DataValueField = "linkID";
            this.lstLink.Rows = link.LoadAll().Tables[0].Rows.Count;
            this.lstLink.DataBind();
            base.Cache["dtLink"] = table;
        }

        private void SetScreen()
        {
            ListItem item;
            Link link = new Link();
            link.Info.IsExternal = this.chkExternalLink.Checked;
            link.Info.LinkCategory = (NLinkCategory)base.oHelper.GetEnumByName(typeof(NLinkCategory), this.ddlCata.SelectedItem.Text);
            link.Info.CurrentTask = NTaskLink.LoadAllTop;
            WebHelper.LoadData(link.LoadAll().Tables[0], this.ddlCatalogue);
            this.ddlCatalogue.DataBind();
            switch (link.Info.LinkCategory)
            {
                case NLinkCategory.Admin:
                    item = new ListItem("Top Menu", "1000");
                    break;

                case NLinkCategory.Blog:
                    item = new ListItem("Top Menu", "1855");
                    break;

                default:
                    item = new ListItem(string.Empty, string.Empty);
                    break;
            }
            this.ddlCatalogue.Items.Insert(0, item);
            this.radlAction.SelectedIndex = 0;
            this.mvwLink.ActiveViewIndex = 0;
            this.RefreshGrid();
        }
    }
}
