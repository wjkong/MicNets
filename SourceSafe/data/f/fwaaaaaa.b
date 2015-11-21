<?xml version="1.0"?>
<configuration>
  <configSections>
    <sectionGroup name="system.web.extensions" type="System.Web.Configuration.SystemWebExtensionsSectionGroup, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35">
      <sectionGroup name="scripting" type="System.Web.Configuration.ScriptingSectionGroup, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35">
        <section name="scriptResourceHandler" type="System.Web.Configuration.ScriptingScriptResourceHandlerSection, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" requirePermission="false" allowDefinition="MachineToApplication"/>
        <sectionGroup name="webServices" type="System.Web.Configuration.ScriptingWebServicesSectionGroup, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35">
          <section name="jsonSerialization" type="System.Web.Configuration.ScriptingJsonSerializationSection, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" requirePermission="false" allowDefinition="Everywhere"/>
          <section name="profileService" type="System.Web.Configuration.ScriptingProfileServiceSection, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" requirePermission="false" allowDefinition="MachineToApplication"/>
          <section name="authenticationService" type="System.Web.Configuration.ScriptingAuthenticationServiceSection, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" requirePermission="false" allowDefinition="MachineToApplication"/>
          <section name="roleService" type="System.Web.Configuration.ScriptingRoleServiceSection, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" requirePermission="false" allowDefinition="MachineToApplication"/>
        </sectionGroup>
      </sectionGroup>
    </sectionGroup>
  </configSections>
  <appSettings>
    <add key="SMTPServer" value="MailA58" />
    <add key="ThumbnailWidth" value="208" />
    <add key="PhotoWidth" value="980" />
    <add key="DefaultEmail" value="Michael@micnets.com" />
    <add key="AnonymousEmail" value="webmaster@micnets.com" />
    <add key="IsErrorEmailLog" value="N" />
    <add key="Domain" value="http://www.micnets.com" />
    <add key="ServicePassword" value="KFC" />
    <add key="URL_EmailServer" value="http://www.micnets.com/WebService/EmailServer.asmx" />
    <add key="applicationPath" value="~/" />
    <add key="GoogleAPIKey" value="ABQIAAAA8E_mOCTXYj3Y8rLfO8axtBTLOM9vYFSJ_Zc5KvLr7fzoPHumkhTBsi29ZcJEIXn7nq-mosxMR-7U1w" />
    <add key="GoogleSearchKey" value="016305046753552859283:cknwzjqfiw0" />
    <add key="Enviorment" value="DEV" />

  </appSettings>

  <connectionStrings>
    	<add name="MicnetsCon" connectionString="Data Source=(local);Initial Catalog=MicNets;Integrated Security=True"/>
    <!--<add name="MicnetsCon" connectionString="Data Source=SQLB9.webcontrolcenter.com;Initial Catalog=micnets;password=730615;user id=sa_user"/>-->
  </connectionStrings>

  <system.web>
    <globalization culture="auto" enableBestFitResponseEncoding="false" enableClientBasedCulture="false" fileEncoding="utf-8" requestEncoding="utf-8" responseEncoding="utf-8" responseHeaderEncoding="utf-8" uiCulture="auto"/>

    <!--<healthMonitoring>
      <providers>
        <add name="CriticalMailEventProvider" type="System.Web.Management.SimpleMailWebProvider,lll" />
      </providers>
      <rules>
        <add name="All Errors by Email" eventName="All Errors" provider="CriticalMailEventProvider"/>
      </rules>
      
    </healthMonitoring>-->
    <sessionState mode="InProc" cookieless="UseCookies" timeout="20"/>
    <pages>
      <controls>
        <add tagPrefix="asp" namespace="System.Web.UI" assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"/>
        <add namespace="AjaxControlToolkit" assembly="AjaxControlToolkit" tagPrefix="ajaxToolkit"/>
        <add tagPrefix="asp" namespace="System.Web.UI.WebControls" assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"/>
      </controls>
    </pages>
    <authentication mode="Forms">
      <forms loginUrl="~/Blog/Login.aspx" timeout="20"/>
    </authentication>
    <customErrors mode="Off"/>
    <compilation debug="true">
      <assemblies>
        <add assembly="System.Design, Version=2.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A"/>
        <add assembly="System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=B77A5C561934E089"/>
        <add assembly="System.DirectoryServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A"/>
        <add assembly="System.Core, Version=3.5.0.0, Culture=neutral, PublicKeyToken=B77A5C561934E089"/>
        <add assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"/>
        <add assembly="System.Xml.Linq, Version=3.5.0.0, Culture=neutral, PublicKeyToken=B77A5C561934E089"/>
        <add assembly="System.Data.DataSetExtensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=B77A5C561934E089"/>
        <add assembly="System.Web.Extensions.Design, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"/>
        <add assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"/>
        <add assembly="System.Web.Extensions.Design, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"/>
      </assemblies>
      <buildProviders>
        <add extension=".rdlc" type="Microsoft.Reporting.RdlBuildProvider, Microsoft.ReportViewer.Common, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"/>
      </buildProviders>
    </compilation>
    <httpHandlers>
      <remove path="*.asmx" verb="*"/>
      <add path="*.asmx" verb="*" type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" validate="false"/>
      <add path="*_AppService.axd" verb="*" type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" validate="false"/>
      <add path="ScriptResource.axd" verb="GET,HEAD" type="System.Web.Handlers.ScriptResourceHandler, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" validate="false"/>
    </httpHandlers>
    <httpModules>
      <add name="ScriptModule" type="System.Web.Handlers.ScriptModule, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"/>
    </httpModules>
    <webServices>
      <protocols>
        <add name="HttpGet"/>
        <add name="HttpPost"/>
      </protocols>
    </webServices>
    <urlMappings>
      <add url="~/Index.aspx" mappedUrl="~/Default.aspx"/>
      <add url="~/Index.html" mappedUrl="~/Default.aspx"/>
    </urlMappings>
  </system.web>
  <system.webServer>
    <validation validateIntegratedModeConfiguration="false"/>
    <modules>
      <remove name="ScriptModule"/>
      <add name="ScriptModule" preCondition="managedHandler" type="System.Web.Handlers.ScriptModule, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"/>
    </modules>
    <handlers>
      <remove name="ScriptHandlerFactory"/>
      <remove name="ScriptHandlerFactoryAppServices"/>
      <remove name="ScriptResource"/>
      <remove name="WebServiceHandlerFactory-Integrated"/>
      <add name="ScriptHandlerFactory" verb="*" path="*.asmx" preCondition="integratedMode" type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"/>
      <add name="ScriptHandlerFactoryAppServices" verb="*" path="*_AppService.axd" preCondition="integratedMode" type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"/>
      <add name="ScriptResource" preCondition="integratedMode" verb="GET,HEAD" path="ScriptResource.axd" type="System.Web.Handlers.ScriptResourceHandler, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"/>
    </handlers>
  </system.webServer>
  <system.codedom>
    <compilers>
      <compiler language="c#;cs;csharp" extension=".cs" type="Microsoft.CSharp.CSharpCodeProvider,System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" warningLevel="4">
        <providerOption name="CompilerVersion" value="v3.5"/>
        <providerOption name="WarnAsError" value="false"/>
      </compiler>
      <compiler language="vb;vbs;visualbasic;vbscript" extension=".vb" type="Microsoft.VisualBasic.VBCodeProvider, System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" warningLevel="4">
        <providerOption name="CompilerVersion" value="v3.5"/>
        <providerOption name="OptionInfer" value="true"/>
        <providerOption name="WarnAsError" value="false"/>
      </compiler>
    </compilers>
  </system.codedom>
  <runtime>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <dependentAssembly>
        <assemblyIdentity name="System.Web.Extensions" publicKeyToken="31bf3856ad364e35"/>
        <bindingRedirect oldVersion="1.0.0.0-1.1.0.0" newVersion="3.5.0.0"/>
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="System.Web.Extensions.Design" publicKeyToken="31bf3856ad364e35"/>
        <bindingRedirect oldVersion="1.0.0.0-1.1.0.0" newVersion="3.5.0.0"/>
      </dependentAssembly>
    </assemblyBinding>
  </runtime>
  <system.net>
    <mailSettings>
      <smtp>
        <network host="mail.micnets.com" port="8889"/>
      </smtp>
    </mailSettings>
  </system.net>

</configuration>