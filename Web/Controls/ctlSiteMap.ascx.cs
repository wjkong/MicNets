﻿using System;
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

namespace MicNets.Web.Controls
{
    public partial class ctlSiteMap : UserControl
    {
        // Fields
        protected Controls.ctlToolBar CtlToolBar1;
        protected DataList dlSiteMap;
        private DataRow[] drsLink;
        private DataTable dtLink;
        protected HtmlGenericControl FunctionBar;
        protected string textColumn;

        // Methods
        private void BuildGrandChildNode(DataRow[] drs, TreeNode childNode)
        {
            foreach (DataRow row in drs)
            {
                TreeNode node = new TreeNode();
                node.NavigateUrl = "../" + row["url"];
                node.Text = row[this.textColumn].ToString();
                childNode.ChildNodes.Add(node);
            }
        }

        protected void dlSiteMap_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                TreeView view = (TreeView)e.Item.FindControl("tvLink");
                TreeNode childNode = new TreeNode();
                childNode.Text = this.drsLink[e.Item.ItemIndex]["text"].ToString().ToUpper();
                childNode.NavigateUrl = "../" + this.drsLink[e.Item.ItemIndex]["url"];
                view.Nodes.Add(childNode);
                this.BuildGrandChildNode(this.dtLink.Select("parentLinkID = " + this.drsLink[e.Item.ItemIndex]["linkID"], "sequence ASC"), childNode);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.SetScreen();
            }
        }

        private void SetScreen()
        {
            string str;
            this.textColumn = "text";
            Link link = new Link();
            link.Info.RoleID = base.Request.IsAuthenticated ? ((short)0) : ((short)40);
            
            if (Session["CurrentCulture"] != null)
                link.Info.Culture = Session["CurrentCulture"].ToString();

            if (((str = ConfigurationManager.AppSettings["LinkCategory"]) != null) && (str == "BLOG"))
            {
                link.Info.LinkCategory = NLinkCategory.Blog;
            }
            link.Info.CurrentTask = NTaskLink.LoadAllByRole;
            this.dtLink = link.LoadAll().Tables[0];
            DataRow row = this.dtLink.Select("parentLinkID IS NULL")[0];
            string filterExpression = "parentLinkID = " + row["linkID"] + " AND text <> 'log out'";
            this.drsLink = this.dtLink.Select(filterExpression, "sequence ASC");
            this.dlSiteMap.DataSource = new DataView(this.dtLink, filterExpression, "sequence ASC", DataViewRowState.CurrentRows);
            this.dlSiteMap.DataBind();


        }
    }
}