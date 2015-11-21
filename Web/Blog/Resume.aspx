<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resume.aspx.cs" Inherits="MicNets.Web.Blog.Resume" title="ASPNET C# Senior Web Developer Software Engineer Resume" MasterPageFile="~/Blog/Blog.Master" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<table cellpadding=2 cellspacing=2>
    <thead>
        <tr>
            <th><span id="printExclusive"><asp:AdRotator ID="AdProfile" runat="server" AdvertisementFile="~/Blog/ResumeProfile.xml" meta:resourcekey="AdProfileResource1" /></span>
            </th>
            <th style="padding-left:15px">
                <table cellpadding=3 cellspacing=3>
                    <thead>
                        <tr>
                            <th colspan=3 style="text-align:left">
                                <asp:Label ID="Label10" Text="MICHAEL KONG" runat=server Font-Bold="True" Font-Size="14pt" 
                            meta:resourcekey="LabelResource1"></asp:Label>
                                <br />
                                 <asp:Label ID="Label11" Text="Last updated on&nbsp;" runat=server 
                                    meta:resourcekey="LabelResource2"></asp:Label>
                                <asp:Label ID="lblLastUpdated" runat="server" EnableViewState="False" 
                                    meta:resourcekey="lblLastUpdatedResource1"></asp:Label>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                         <tr>
                            <td>
                                <table style="text-align:left" cellpadding=3 cellspacing=3>
                                    <tr>
                                        <td nowrap> <asp:Label ID="Label12" Text="Email:" runat=server meta:resourcekey="LabelResource3"></asp:Label>
                                        </td>
                                        <td><a href="mailto:Michael@MicNets.com?subject=Regarding Your Resume&body=Hi Michael," title="Send me an email">Michael@MicNets.com</a>
                                        </td>
                                    </tr>
                                    <tr>                                    
                                        <td><asp:Label ID="Label13" Text="Blog:" runat=server meta:resourcekey="LabelResource4"></asp:Label>
                                        </td>
                                        <td><a href="Default.aspx" title="Welcome to browser my blog">http://MicNets.com/Blog</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><asp:Label ID="Label14" Text="Address:" runat=server meta:resourcekey="LabelResource5"></asp:Label>
                                        </td>
                                        <td>Sherwood Mills Blvd.
                                        </td>
                                          <td rowspan=5 nowrap>
                                             <a href="google-map.aspx?Key=Sherwood Mills Blvd&City=Mississauga&Pro=Ontario&Con=CA" title="Find out the my location">Google Map</a>                                    </td>
                                          </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>Mississauga, Ontario 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>L5V 2G8 Canada
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width:100%; text-align:right"><a href="http://www.micnets.com/Blog/Certification.aspx"><img src="../Image/mcsd.gif" title="Pursuit MCSD certificate" style="border:0" alt="MCSD certificate Logo" /></a>&nbsp;&nbsp;&nbsp;
                            </td>
                            <td>
                                <a href="http://www.micnets.com/Blog/Certification.aspx"><img src="../Image/mcad.gif" title="Pursuit MCSD certificate" class=noUnderLine style="border:0" alt="MCSD certificate Logo"  /></a>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan=3 style="text-align:left">
                                <span id="printExclusive">
                                 <asp:Button ID="btnDownload" runat="server" Text="Download Resume" 
                                ToolTip="Download resume in Word format" OnClick="btnDownload_Click" 
                                CssClass="button" EnableViewState="False" 
                                meta:resourcekey="btnDownloadResource1" /></span>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
           <td>
                <hr />
           </td>
           <td>
                <hr />
           </td>
        </tr>
         <tr>
           <td style="text-align:center; font-weight:bold">
                <asp:Label ID="Label15" runat=server Text="OBJECTIVE" meta:resourcekey="LabelResource6"></asp:Label>
           </td>
           <td>
                <span style="padding-left:20px"><asp:Label ID="Label16" runat=server 
                Text="To become a Senior Microsoft .NET Solution Developer and Specialist in C#" 
                meta:resourcekey="LabelResource7"></asp:Label></span>
           </td>
        </tr>
           <tr>
           <td>
                <hr />
           </td>
           <td>
                <hr />
           </td>
        </tr>
           <tr>
           <td  style="text-align:center; font-weight:bold">
              <asp:Label ID="Label17" runat=server Text="SUMMARY" meta:resourcekey="LabelResource8"></asp:Label>
           </td>
           <td>
                <ul>
                    <li ><asp:Label ID="Label18" runat=server 
                            Text="Certified C# MCSD/MCAD with 5 years experience in IT field, including 3 years solid experience on .NET Framework, ASP.NET, ADO.NET and C#" 
                            meta:resourcekey="LabelResource9"></asp:Label>
                    </li>
                    <li ><asp:Label ID="Label19" runat=server 
                            Text="Bachelor of Science specialized in Computer Science" 
                            meta:resourcekey="LabelResource10"></asp:Label>
                    </li>
                    <li ><asp:Label ID="Label20" runat=server 
                            Text="A flexible, energetic and diligent team player with strong problem solving and system tuning skill" 
                            meta:resourcekey="LabelResource11"></asp:Label>
                    </li>
                    <li><asp:Label ID="Label21" runat=server 
                            Text="A quick-learner with excellent communication skills" 
                            meta:resourcekey="LabelResource12"></asp:Label>
                    </li>
               </ul>
           </td>
        </tr>
         </tr>
           <tr>
           <td>
                <hr />
           </td>
           <td>
                <hr />
           </td>
        </tr>
         </tr>
           <tr>
           <td  style="text-align:center; font-weight:bold">
               <asp:Label ID="Label22" runat=server Text="WORK EXPERIENCE" 
            meta:resourcekey="LabelResource13"></asp:Label>
           </td>
           <td>
                <span class=yearRA><asp:Label ID="Label23" runat=server Text="2006.12 ~ present" 
                    meta:resourcekey="LabelResource14"></asp:Label></span>
              <span style="padding-left:20px"><strong><asp:Label ID="Label24" runat=server 
                    Text="Senior .NET Software Engineer" meta:resourcekey="LabelResource15"></asp:Label></strong>, <a href="http://www.dealertrack.com" target=_blank title="Visit DealerTrack Home Page">DealerTrack
                                  Canada</a>, Mississauga, ON.</span>
              <ul>
                <li ><asp:Label ID="Label25" runat=server 
                        Text="Adapted the latest ASP.Net 2.0 & ADO.Net 2.0 technologies, such as Master Page, Grid View, Menu, Generic, Batch Update and Object data source, to customize interface for multiple lenders, including Bank of America, Bank of West, KeyBank, Wells Fargo, Medallion, GE Financial and Thor." 
                        meta:resourcekey="LabelResource16"></asp:Label>
                </li>
                <li ><asp:Label ID="Label26" runat=server 
                        Text="Mainly responsible for implementing and maintaining the backend XML communication with both lenders and dealers using HTTPs request. De-serialized incoming XML stream into specified object and serialized acknowledge object into XML response stream." 
                        meta:resourcekey="LabelResource17"></asp:Label>
                </li>
                <li ><asp:Label ID="Label27" runat=server 
                        Text="Mainly responsible for maintaining a consistent n-tier architectural structure across the organization’s web applications. Ensured a consistent look and feel across the company’s web applications, Intranets, and extranets by developing and promoting a uniform branding strategy." 
                        meta:resourcekey="LabelResource18"></asp:Label>
                </li>
                <li ><asp:Label ID="Label28" runat=server 
                        Text="Responsible for implementing a tool to pull consumer credit bureau for credit check by consuming a 3rd party web service." 
                        meta:resourcekey="LabelResource19"></asp:Label>
                </li>
                <li ><asp:Label ID="Label29" runat=server 
                        Text="Responsible for creating e-Commerce application using ASP.NET Responsible for creating user-friendly interface, and choosing web server controls properly to ensure data communication smoothly between users and system." 
                        meta:resourcekey="LabelResource20"></asp:Label>
                </li>
                <li ><asp:Label ID="Label30" runat=server 
                        Text="Followed a full of web development procedures, including planning, user requirement collection, object design and analysis, testing, implementation and maintenance." 
                        meta:resourcekey="LabelResource27"></asp:Label>
                </li>
              </ul><span class=yearRA>2005.3 ~ 2006.12</span>
              <span style="padding-left:20px"><strong><asp:Label ID="Label31" runat=server 
                    Text="ASP.NET Web Developer" meta:resourcekey="LabelResource21"></asp:Label></strong>, <a href="http://www.dgn-marketing.com" target=_blank title="Visit DGN Marketing Service Home Page">DGN Marketing Services</a>, Mississauga, ON.</span>
              <ul>
                <li ><asp:Label ID="Label32" runat=server 
                        Text="Mainly responsible for Designing and Developing online, transaction based e-commerce solutions for B2B and B2C systems, using Microsoft .NET technology. Such as online catalogues, shopping cart, administration, distribution modules and est." 
                        meta:resourcekey="LabelResource22"></asp:Label> 
                </li>
                <li ><asp:Label ID="Label33" runat=server 
                        Text="Mainly responsible for implementing and maintaining multiple projects, including President Choice Finance, Siemens and General Motors, Campbell’s Soup, Pepsi-QTG, WorkBrain, The Source and Kraft." 
                        meta:resourcekey="LabelResource23"></asp:Label> 
                </li>
                <li ><asp:Label ID="Label34" runat=server 
                        Text="Mainly Responsible for database design in SQL 2000 Server, implemented complex stored procedures, queries, views, triggers and constrains, and invoked transaction if applicable." 
                        meta:resourcekey="LabelResource24"></asp:Label>
                </li>
                 <li ><asp:Label ID="Label35" runat=server 
                         Text="Responsible for customizing Form and Windows authentication and authorization module to set up role-base application security and pages security, and building dynamic menus and links accord to the specific user roles or access level." 
                         meta:resourcekey="LabelResource25"></asp:Label>
                </li>
              </ul>
           </td>
        </tr>
        <tr>
           <td>
                <hr />
           </td>
           <td>
                <hr />
           </td>
        </tr>
        <tr>
           <td  style="text-align:center; font-weight:bold">
              <asp:Label ID="Label36" runat=server Text="SKILLS SETS" meta:resourcekey="LabelResource26"></asp:Label>
           </td>
           <td>
              <ul>
                <li ><asp:Label ID="Label1" runat=server 
                        Text="<strong>Tools</strong>: Hands-on Experience in C#, ASP.NET 1.x/2.0, ADO.NET, XML, COM+, Web Service, SOAP, MS Reporting Services, Crystal Reports, MS Visual Studio 2003/2005, MS Source Safe 2000/2005, Source Gear, SQL Server 2000/2005, Core Java, Java Swing Package, Java Applet, CSS" 
                        meta:resourcekey="Label1Resource1"></asp:Label>
                </li>
                <li ><asp:Label ID="Label2" runat=server 
                        Text="<strong>Methodologies</strong>: In-depth understanding of Object-Oriented Analysis and Design Pattern (OOP), Multi-tiers Objects design, Software Development Life-cycle (SDLC), Model-View-Controller Design (MVC)" 
                        meta:resourcekey="Label2Resource1"></asp:Label>
                </li>
                <li ><asp:Label ID="Label3" runat=server 
                        Text="<strong>Platforms</strong>: Proficiency in operating systems of Windows 2000/2003 Server & Advanced Server,  .Net Framework 1.x/2.0, IIS 5.1/6.0, Windows XP, Linux, UNIX, Windows 95/98/NT, DOS and AS/" 
                        meta:resourcekey="Label3Resource1"></asp:Label>
                </li>
                <li ><asp:Label ID="Label4" runat=server 
                        Text="<strong>Networks</strong>: LAN and WAN technology, TCP/IP architecture, OSI architecture, IP Address, DHCP, HTTP protocol, SMTP, Spanning Tree, and data and computer communication" 
                        meta:resourcekey="Label4Resource1"></asp:Label>
                </li>
                <li ><asp:Label ID="Label5" runat=server 
                        Text="<strong>Languages</strong>: C#, Java, C/C++, SQL, XML, Visual Basic, JavaScript, DHTML, HTML, PCL, Eiffel, VBScript, and etc" 
                        meta:resourcekey="Label5Resource1"></asp:Label>
                </li>
                <li ><asp:Label ID="Label6" runat=server 
                        Text="<strong>Database</strong>: MS SQL Server 2000/2005, IBM DB2, MS Access 2000/2003, Jbase, Oracle" 
                        meta:resourcekey="Label6Resource1"></asp:Label>
                </li>
            </ul>
           </td>
        </tr>
         <tr>
           <td>
                <hr />
           </td>
           <td>
                <hr />
           </td>
        </tr>
         <tr>
           <td  style="text-align:center; font-weight:bold">
                <asp:Label ID="Label37" runat=server Text="EDUCATION BACKGROUND" 
            meta:resourcekey="LabelResource28"></asp:Label>
           </td>
           <td>
                 <span class=yearRA>2001 ~ 2004</span>
               <span style="padding-left:20px">
                <asp:Label ID="Label7" runat=server Text="<strong>Bachelor of Science specialized in Computer
                    Science</strong>" meta:resourcekey="Label7Resource1"></asp:Label> <a href="http://www.yorku.ca" target=_blank title="Visit York University Home Page">York University</a>, Toronto, ON.</span>
                <ul>
                    <li><asp:Label ID="Label8" runat=server 
                            Text="<strong>Honors</strong>: Recipient of Canadian Millennium Scholarship" 
                            meta:resourcekey="Label8Resource1"></asp:Label>
                    </li>
                </ul><span class=yearRA>2000 ~ 2001</span>
                <span style="padding-left:20px"><asp:Label ID="Label9" runat=server 
                    Text="<strong>Diploma of Computer Programming</strong>" 
                    meta:resourcekey="Label9Resource1"></asp:Label> <a href="http://www.senecac.on.ca" target=_blank title="Visit Seneca College Home Page">Seneca College</a>, Toronto, ON.</span>
           </td>
        </tr>
        <tr>
           <td>
                <hr />
           </td>
           <td>
                <hr />
           </td>
        </tr>
        <tr>
           <td  style="text-align:center; font-weight:bold">
               <asp:Label ID="Label38" runat=server Text="CERTIFICATE" meta:resourcekey="LabelResource29"></asp:Label>
           </td>
           <td>
                <ul>
                <li><span class=yearRA>2005</span>
                <a href="http://www.microsoft.com/learning/mcp/mcsd/default.mspx"><strong title="Visit offical MCSD web site">MCSD</strong></a> - 
                    <asp:Label ID="Label39" runat=server 
                        Text="Microsoft Certified Solution Developer .NET Certificate in C#" 
                        meta:resourcekey="LabelResource30"></asp:Label> 
                </li>
                <li><span class=yearRA>2004</span>
                <a href="http://www.microsoft.com/learning/mcp/mcad/default.mspx"><strong title="Visit offical MCAD web site">MCAD</strong></a> - 
                    <asp:Label ID="Label40" runat=server 
                        Text="Microsoft Certified Application Developer .NET Certificate in C#" 
                        meta:resourcekey="LabelResource31"></asp:Label>
                </li>
                </ul>
           </td>
        </tr>
             <tr>
           <td>
                <hr />
           </td>
           <td>
                <hr />
           </td>
        </tr>
             <tr>
           <td  style="text-align:center; font-weight:bold">
               <asp:Label ID="Label41" runat=server Text="INTEREST" meta:resourcekey="LabelResource32"></asp:Label>
           </td>
           <td>
            <ul>
            <li ><asp:Label ID="Label42" runat=server 
                    Text="Passionate for most of sports activities, especially basketball, soccer and badminton" 
                    meta:resourcekey="LabelResource33"></asp:Label>
            </li>
            <li><asp:Label ID="Label43" runat=server Text="Enjoy reading, music and movies" 
                    meta:resourcekey="LabelResource34"></asp:Label>
            </li>
        </ul>
           </td>
        </tr>
    </tbody>
</table>    
</asp:Content>

