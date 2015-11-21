<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="MicNets.Web.Blog.SearchResult" title="Google Search programming articles or Tips in My Blog"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
   <script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=cse-search-box&amp;lang=en"></script>
     <div class="row" id="cse-search-results">
     </div>
    <script type="text/javascript">
      var googleSearchIframeName = "cse-search-results";
      var googleSearchFormName = "cse-search-box";
      var googleSearchFrameWidth = 840;
      var googleSearchDomain = "www.google.ca";
      var googleSearchPath = "/cse";
    </script>
    <script type="text/javascript" src="http://www.google.com/afsonline/show_afs_search.js"></script>
</asp:Content>

