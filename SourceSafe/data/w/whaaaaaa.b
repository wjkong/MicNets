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
using System.Text;
using MicNets.BizLogic;
using MicNets.Model;

namespace MicNets.Web.Blog.Member.Admin
{
    public partial class PermissionAdmin : SecurityPage
    {
        // Fields
        protected Button btnUpdate;
        protected readonly string[] comText = new string[] { "spRoleSelectAll" };
        protected DropDownList ddlCata;
        protected DropDownList ddlRole;
        protected DataList dlSubLink;
        protected Label lblRole;
        protected Label lblSubTitle;
        protected RequiredFieldValidator vldrRole;

        // Methods
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                StringBuilder builder = new StringBuilder();
                foreach (DataListItem item in this.dlSubLink.Items)
                {
                    if (((CheckBox)item.FindControl("chkTopLink")).Checked)
                    {
                        builder.Append("," + this.dlSubLink.DataKeys[item.ItemIndex]);
                        foreach (ListItem item2 in ((CheckBoxList)item.FindControl("chklSubLink")).Items)
                        {
                            if (item2.Selected)
                            {
                                builder.Append("," + item2.Value);
                            }
                        }
                        continue;
                    }
                }
                Link link = new Link();
                link.Info.RoleID = Convert.ToInt16(this.ddlRole.SelectedValue);
                link.Info.URL = (builder.Length > 0) ? builder.Remove(0, 1).ToString() : "";
                link.Info.LinkCategory = (NLinkCategory)base.oHelper.GetEnumByName(typeof(NLinkCategory), this.ddlCata.SelectedItem.Text);
                if (link.ModifyALL())
                {
                    base.BuildPopup("Successfully, updated all permision for this role.");
                }
                else
                {
                    base.BuildPopup(MicNets.Model.Utility.NOTICE_INTERNAL_ERROR);
                }
            }
            else
            {
                base.BuildPopup(Utility.NOTICE_INVALID_INPUT);
            }
        }

        protected void chklTopMenu_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void chkTopLink_CheckedChanged(object sender, EventArgs e)
        {
            CheckBoxList list = (CheckBoxList)((CheckBox)sender).Parent.FindControl("chklSubLink");
            list.Enabled = ((CheckBox)sender).Checked;
        }

        private void ClearAllTick()
        {
            foreach (DataListItem item in this.dlSubLink.Items)
            {
                ((CheckBox)item.FindControl("chkTopLink")).Checked = false;
                CheckBoxList list = (CheckBoxList)item.FindControl("chklSubLink");
                foreach (ListItem item2 in list.Items)
                {
                    item2.Selected = false;
                }
            }
        }

        protected void ddlCata_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SetScreen();
        }

        protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ClearAllTick();
            if (this.ddlRole.SelectedItem.Text != Utility.DEFAULT_SELECTION)
            {
                this.SwitchTopLinks(true);
                Link link = new Link();
                link.Info.RoleID = Convert.ToInt16(this.ddlRole.SelectedValue);
                link.Info.LinkCategory = (NLinkCategory)base.oHelper.GetEnumByName(typeof(NLinkCategory), this.ddlCata.SelectedItem.Text);
                link.Info.CurrentTask = NTaskLink.LoadAllByRole;
                Hashtable hashtable = new Hashtable();
                foreach (DataRow row in link.LoadAll().Tables[0].Rows)
                {
                    hashtable.Add(row["linkID"].ToString(), row["linkID"].ToString());
                }
                foreach (DataListItem item in this.dlSubLink.Items)
                {
                    CheckBoxList list = (CheckBoxList)item.FindControl("chklSubLink");
                    if (hashtable.Contains(this.dlSubLink.DataKeys[item.ItemIndex].ToString()))
                    {
                        ((CheckBox)item.FindControl("chkTopLink")).Checked = true;
                        list.Enabled = true;
                        foreach (ListItem item2 in list.Items)
                        {
                            if (hashtable.Contains(item2.Value.ToString()))
                            {
                                item2.Selected = true;
                            }
                        }
                        continue;
                    }
                    list.Enabled = false;
                }
            }
            else
            {
                this.SwitchTopLinks(false);
            }
        }

        protected DataTable GetSubLinks(int parentlinkID)
        {
            Link link = new Link();
            link.Info.ParentLinkID = parentlinkID;
            link.Info.LinkCategory = (NLinkCategory)base.oHelper.GetEnumByName(typeof(NLinkCategory), this.ddlCata.SelectedItem.Text);
            link.Info.CurrentTask = NTaskLink.LoadAllByParent;
            return link.LoadAll().Tables[0];
        }

       

        protected void Page_Load(object sender, EventArgs e)
        {
            base.oHelper = new Helper();
            if (!this.Page.IsPostBack)
            {
                this.SetScreen();
            }
        }

        private void SetScreen()
        {
            WebHelper.LoadData(BizLogicHelper.GetTables(this.comText).Tables["spRoleSelectAll"], this.ddlRole);
            Link link = new Link();
            link.Info.LinkCategory = (NLinkCategory)base.oHelper.GetEnumByName(typeof(NLinkCategory), this.ddlCata.SelectedItem.Text);
            link.Info.CurrentTask = NTaskLink.LoadAllTop;
            this.dlSubLink.DataSource = link.LoadAll().Tables[0];
            this.Page.DataBind();
            this.ddlRole.Items.Insert(0, Utility.DEFAULT_SELECTION);
        }

        private void SwitchTopLinks(bool blnEnable)
        {
            foreach (DataListItem item in this.dlSubLink.Items)
            {
                ((CheckBox)item.FindControl("chkTopLink")).Enabled = blnEnable;
                if (!blnEnable)
                {
                    ((CheckBoxList)item.FindControl("chklSubLink")).Enabled = blnEnable;
                }
            }


        }
    }
}
