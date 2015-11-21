<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="web-server-control-lable.aspx.cs" Inherits="MicNets.Web.Blog.Topics.web_server_control_lable"  title="Web Server Control: Label" MasterPageFile="~/Blog/Topics/Topic.Master" %>
<%@ MasterType VirtualPath="~/Blog/Topics/Topic.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="topicContent" Runat="Server">
<div class="row">
    <p>
    As what we known, label is one of heavily used control in ASP.NET web application. And you may easily find a label control somewhere of every pages. Therefore, Matering this control is a key to build successfully web application. 
    Although Label control is simple and straightforward to be get involved, I still want to share my own experience how to use it wisely. Hopefully, you will enjoy this topic and find some useful staff. 
    
    </p>
</div>
<div class="row">
    Web Server Control: <span class="highLight">Label</span><br />
    NameSpace: <span class="highLight">System.Web.UI.WebControls</span>
</div>
<div class="row">
    <p>
    <span class="highLight">Tip #1:&nbsp;AssociatedControlID</span>
     is a property by which a Lable can be associated to an input control, like TextBox. And it does provide a way binding two associated controls together. Whenever users click on a label that has an AssociatedControlID, cursor will move to the associated control automatically.
        To explore the behaviour you may expect, you can click on the demo Amount Financed Lable below. 
    </p>
    <p>
        <span style="color:Red">Code Snippet:</span><br />
        &lt;asp:Label ID="lblAmountFinanced" runat="server" Text="Amount Financed" AssociatedControlID="txtAmountFinanced"&gt;&lt;/asp:Label&gt;<br />
        &lt;asp:TextBox ID="txtAmountFinanced" runat="server"&gt;&lt;/asp:TextBox&gt;
        <br /><br />
        <span style="color:Red">Demo:</span><br />
        <div style="padding-left:40px">
        <asp:Label ID="lblAmountFinanced" runat="server" Text="Amount Financed:" AssociatedControlID="txtAmountFinanced"></asp:Label>&nbsp;
        <asp:TextBox ID="txtAmountFinanced" runat="server"></asp:TextBox>
        </div>
    </p>
    <p>
    There is no surprise that most of C#/VB progrmmers don’t pay much attention on this property. However, using AssociatedControlID with Lable control will definitely improve the users' experience. 
     </p>
</div>
<br />
<div class="row">
    <p>
    <span class="highLight">Tip #2:&nbsp;Normally, while using Javascript,</span> we use command document.getElementById(“ControlID”).value to retrieve and assign value to a control. However, this command will not work at Lable control. In order to manipulate Lable value, you have to use command document.getElementById(“lblAmountFinanced”).innerHTML instead of document.getElementById(“lblAmountFinanced”).value. Otherwise, you will get undefined value. To compare the diffrence between two command, you can click on the demo buttons below. 
    </p>
    <p>
      
      <span style="color:Red">Demo:</span><br />
      <div style="padding-left:40px">
       <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
        <input id="btnGetByValue" type="button" value="Show Lable by element's value" onclick="javascript:alert(document.getElementById('ctl00_ctl00_content_topicContent_lblAmountFinanced').value)" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="btnGetByInnerHTML" type="button" value="Show Lable by element's inner HTML" onclick="javascript:alert(document.getElementById('ctl00_ctl00_content_topicContent_lblAmountFinanced').innerHTML)" />
      </div>  
    </p>
</div>
<br />
<div class="row">
    <p>
    <span class="highLight">Tip #3:&nbsp;Literal control </span> is similar to Lable control. In most of cases, we can swap these two controls each other. However, in centain particular situation, only either Lable control or Literal control can be applied. For instance, Literal control does not allow you to apply a style to the displayed text; thus, Lable control has be chosen if style will be applied. On the other hand, Literal control will be only choice when we're dynamically creating &lt;title&gt; tags, or &lt;link type="text/javascript"&gt; tags, or &lt;meta name="keywords"&gt; tags, ets.... 
    </p>
    <p>
        <span style="color:Red">Code Snippet:</span><br />
        &lt;head&gt;<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;title&gt;&lt;asp:Literal id="litTitle" text="Michael Kong's Blog" runat="server" /&gt;&lt;/title&gt;<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;title&gt;&lt;asp:Lable id="lblTitle" text="Michael Kong's Blog" runat="server" /&gt;&lt;/title&gt;<br />
        &lt;/head&gt;
        <br /><br />
        <span style="color:Red">Demo:</span><br />
        <div style="padding-left:40px">
            Literal control will render as: &nbsp;&lt;title&gt;Michael Kong's Blog&lt;/title&gt;<br />
            Lable control will render as (invalid HTML): &nbsp; &lt;title&gt;&lt;span&gt;Michael Kong's Blog&lt;/span&gt;&lt;/title&gt;
        </div>
    </p>
</div>

</asp:Content>


