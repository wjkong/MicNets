﻿<Project ToolsVersion="3.5" DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <ProductVersion>9.0.30729</ProductVersion>
    <SchemaVersion>2.0</SchemaVersion>
    <ProjectGuid>{B8594075-61CB-46D0-89BD-66C04432AA90}</ProjectGuid>
    <ProjectTypeGuids>{349c5851-65df-11da-9384-00065b846f21};{fae04ec0-301f-11d3-bf4b-00c04f79efbc}</ProjectTypeGuids>
    <OutputType>Library</OutputType>
    <AppDesignerFolder>Properties</AppDesignerFolder>
    <RootNamespace>MicNets.Web</RootNamespace>
    <AssemblyName>MicNets.Web</AssemblyName>
    <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
    <SccProjectName>SAK</SccProjectName>
    <SccLocalPath>SAK</SccLocalPath>
    <SccAuxPath>SAK</SccAuxPath>
    <SccProvider>SAK</SccProvider>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    <DebugSymbols>true</DebugSymbols>
    <DebugType>full</DebugType>
    <Optimize>false</Optimize>
    <OutputPath>bin\</OutputPath>
    <DefineConstants>DEBUG;TRACE</DefineConstants>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
    <DebugType>pdbonly</DebugType>
    <Optimize>true</Optimize>
    <OutputPath>obj\Release\</OutputPath>
    <DefineConstants>TRACE</DefineConstants>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="AjaxControlToolkit, Version=1.0.10920.32880, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e, processorArchitecture=MSIL">
      <SpecificVersion>False</SpecificVersion>
      <HintPath>bin\AjaxControlToolkit.dll</HintPath>
    </Reference>
    <Reference Include="GMaps, Version=2.9.0.0, Culture=neutral, processorArchitecture=MSIL">
      <SpecificVersion>False</SpecificVersion>
      <HintPath>bin\GMaps.dll</HintPath>
    </Reference>
    <Reference Include="itextsharp, Version=4.1.6.0, Culture=neutral, PublicKeyToken=8354ae6d2174ddca" />
    <Reference Include="MicNets.HTMLTextEditor, Version=1.0.0.705, Culture=neutral, processorArchitecture=MSIL">
      <SpecificVersion>False</SpecificVersion>
      <HintPath>bin\MicNets.HTMLTextEditor.dll</HintPath>
    </Reference>
    <Reference Include="MicNets.TextArea, Version=1.0.0.38287, Culture=neutral, processorArchitecture=MSIL">
      <SpecificVersion>False</SpecificVersion>
      <HintPath>bin\MicNets.TextArea.dll</HintPath>
    </Reference>
    <Reference Include="System" />
    <Reference Include="System.Data" />
    <Reference Include="System.Core">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Data.DataSetExtensions">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Web.Extensions">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Xml.Linq">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Drawing" />
    <Reference Include="System.Web" />
    <Reference Include="System.Xml" />
    <Reference Include="System.Configuration" />
    <Reference Include="System.Web.Services" />
    <Reference Include="System.EnterpriseServices" />
    <Reference Include="System.Web.Mobile" />
  </ItemGroup>
  <ItemGroup>
    <Compile Include="BasePage.cs">
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Album.aspx.cs">
      <DependentUpon>Album.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Album.aspx.designer.cs">
      <DependentUpon>Album.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\aspnet-book-recommend.aspx.cs">
      <DependentUpon>aspnet-book-recommend.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\aspnet-book-recommend.aspx.designer.cs">
      <DependentUpon>aspnet-book-recommend.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Blog.Master.cs">
      <DependentUpon>Blog.Master</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Blog.Master.designer.cs">
      <DependentUpon>Blog.Master</DependentUpon>
    </Compile>
    <Compile Include="Blog\Certification.aspx.cs">
      <DependentUpon>Certification.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Certification.aspx.designer.cs">
      <DependentUpon>Certification.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\ContactMe.aspx.cs">
      <DependentUpon>ContactMe.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\ContactMe.aspx.designer.cs">
      <DependentUpon>ContactMe.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\currency-convertor.aspx.cs">
      <DependentUpon>currency-convertor.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\currency-convertor.aspx.designer.cs">
      <DependentUpon>currency-convertor.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Default.aspx.cs">
      <DependentUpon>Default.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Default.aspx.designer.cs">
      <DependentUpon>Default.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\DetectScreen.aspx.cs">
      <DependentUpon>DetectScreen.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\DetectScreen.aspx.designer.cs">
      <DependentUpon>DetectScreen.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\ErrorHandler.aspx.cs">
      <DependentUpon>ErrorHandler.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\ErrorHandler.aspx.designer.cs">
      <DependentUpon>ErrorHandler.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Gallery.aspx.cs">
      <DependentUpon>Gallery.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Gallery.aspx.designer.cs">
      <DependentUpon>Gallery.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\google-map.aspx.cs">
      <DependentUpon>google-map.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\google-map.aspx.designer.cs">
      <DependentUpon>google-map.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Links.aspx.cs">
      <DependentUpon>Links.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Links.aspx.designer.cs">
      <DependentUpon>Links.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\live-tv.aspx.cs">
      <DependentUpon>live-tv.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\live-tv.aspx.designer.cs">
      <DependentUpon>live-tv.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Login.aspx.cs">
      <DependentUpon>Login.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Login.aspx.designer.cs">
      <DependentUpon>Login.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Member\Admin\LinkAdmin.aspx.cs">
      <DependentUpon>LinkAdmin.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Member\Admin\LinkAdmin.aspx.designer.cs">
      <DependentUpon>LinkAdmin.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Member\Admin\MediaAdmin.aspx.cs">
      <DependentUpon>MediaAdmin.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Member\Admin\MediaAdmin.aspx.designer.cs">
      <DependentUpon>MediaAdmin.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Member\Admin\PermissionAdmin.aspx.cs">
      <DependentUpon>PermissionAdmin.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Member\Admin\PermissionAdmin.aspx.designer.cs">
      <DependentUpon>PermissionAdmin.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Member\Admin\PropertyAdmin.aspx.cs">
      <DependentUpon>PropertyAdmin.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Member\Admin\PropertyAdmin.aspx.designer.cs">
      <DependentUpon>PropertyAdmin.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Member\Admin\UserAdmin.aspx.cs">
      <DependentUpon>UserAdmin.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Member\Admin\UserAdmin.aspx.designer.cs">
      <DependentUpon>UserAdmin.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Member\MyAccount.aspx.cs">
      <DependentUpon>MyAccount.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Member\MyAccount.aspx.designer.cs">
      <DependentUpon>MyAccount.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Member\MyAddressBook.aspx.cs">
      <DependentUpon>MyAddressBook.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Member\MyAddressBook.aspx.designer.cs">
      <DependentUpon>MyAddressBook.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Member\SecurityPage.cs">
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\mortgage-calculator.aspx.cs">
      <DependentUpon>mortgage-calculator.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\mortgage-calculator.aspx.designer.cs">
      <DependentUpon>mortgage-calculator.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\MyTube.aspx.cs">
      <DependentUpon>MyTube.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\MyTube.aspx.designer.cs">
      <DependentUpon>MyTube.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\net-zone.aspx.cs">
      <DependentUpon>net-zone.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\net-zone.aspx.designer.cs">
      <DependentUpon>net-zone.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\recover-password.aspx.cs">
      <DependentUpon>recover-password.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\recover-password.aspx.designer.cs">
      <DependentUpon>recover-password.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Register.aspx.cs">
      <DependentUpon>Register.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Register.aspx.designer.cs">
      <DependentUpon>Register.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Resume.aspx.cs">
      <DependentUpon>Resume.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Resume.aspx.designer.cs">
      <DependentUpon>Resume.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\SearchResult.aspx.cs">
      <DependentUpon>SearchResult.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\SearchResult.aspx.designer.cs">
      <DependentUpon>SearchResult.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\SignOut.aspx.cs">
      <DependentUpon>SignOut.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\SignOut.aspx.designer.cs">
      <DependentUpon>SignOut.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\SiteMap.aspx.cs">
      <DependentUpon>SiteMap.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\SiteMap.aspx.designer.cs">
      <DependentUpon>SiteMap.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Tips.aspx.cs">
      <DependentUpon>Tips.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Tips.aspx.designer.cs">
      <DependentUpon>Tips.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Tools.aspx.cs">
      <DependentUpon>Tools.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Tools.aspx.designer.cs">
      <DependentUpon>Tools.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Topics\naming-convention-design-guideline.aspx.cs">
      <DependentUpon>naming-convention-design-guideline.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Topics\naming-convention-design-guideline.aspx.designer.cs">
      <DependentUpon>naming-convention-design-guideline.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Topics\Topic.Master.cs">
      <DependentUpon>Topic.Master</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Topics\Topic.Master.designer.cs">
      <DependentUpon>Topic.Master</DependentUpon>
    </Compile>
    <Compile Include="Blog\Topics\web-server-control-lable.aspx.cs">
      <DependentUpon>web-server-control-lable.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Topics\web-server-control-lable.aspx.designer.cs">
      <DependentUpon>web-server-control-lable.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Topics\web-server-control-regular-Expression-Validator.aspx.cs">
      <DependentUpon>web-server-control-regular-Expression-Validator.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Topics\web-server-control-regular-Expression-Validator.aspx.designer.cs">
      <DependentUpon>web-server-control-regular-Expression-Validator.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\Translator.aspx.cs">
      <DependentUpon>Translator.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\Translator.aspx.designer.cs">
      <DependentUpon>Translator.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\universal-metric-convertor.aspx.cs">
      <DependentUpon>universal-metric-convertor.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\universal-metric-convertor.aspx.designer.cs">
      <DependentUpon>universal-metric-convertor.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\weather-forecast.aspx.cs">
      <DependentUpon>weather-forecast.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\weather-forecast.aspx.designer.cs">
      <DependentUpon>weather-forecast.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\WebForm1.aspx.cs">
      <DependentUpon>WebForm1.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\WebForm1.aspx.designer.cs">
      <DependentUpon>WebForm1.aspx</DependentUpon>
    </Compile>
    <Compile Include="Blog\YouTube.aspx.cs">
      <DependentUpon>YouTube.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Blog\YouTube.aspx.designer.cs">
      <DependentUpon>YouTube.aspx</DependentUpon>
    </Compile>
    <Compile Include="Controls\BaseControl.cs">
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlAddressBook.ascx.cs">
      <DependentUpon>ctlAddressBook.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlAddressBook.ascx.designer.cs">
      <DependentUpon>ctlAddressBook.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlAlbum.ascx.cs">
      <DependentUpon>ctlAlbum.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlAlbum.ascx.designer.cs">
      <DependentUpon>ctlAlbum.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlAlphaBar.ascx.cs">
      <DependentUpon>ctlAlphaBar.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlAlphaBar.ascx.designer.cs">
      <DependentUpon>ctlAlphaBar.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlComment.ascx.cs">
      <DependentUpon>ctlComment.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlComment.ascx.designer.cs">
      <DependentUpon>ctlComment.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlCurrencyConvertor.ascx.cs">
      <DependentUpon>ctlCurrencyConvertor.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlCurrencyConvertor.ascx.designer.cs">
      <DependentUpon>ctlCurrencyConvertor.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlEmailer.ascx.cs">
      <DependentUpon>ctlEmailer.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlEmailer.ascx.designer.cs">
      <DependentUpon>ctlEmailer.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlGallery.ascx.cs">
      <DependentUpon>ctlGallery.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlGallery.ascx.designer.cs">
      <DependentUpon>ctlGallery.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlLink.ascx.cs">
      <DependentUpon>ctlLink.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlLink.ascx.designer.cs">
      <DependentUpon>ctlLink.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlLogin.ascx.cs">
      <DependentUpon>ctlLogin.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlLogin.ascx.designer.cs">
      <DependentUpon>ctlLogin.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlMediaUpload.ascx.cs">
      <DependentUpon>ctlMediaUpload.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlMediaUpload.ascx.designer.cs">
      <DependentUpon>ctlMediaUpload.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlMortgageCalculator.ascx.cs">
      <DependentUpon>ctlMortgageCalculator.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlMortgageCalculator.ascx.designer.cs">
      <DependentUpon>ctlMortgageCalculator.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlMyAccount.ascx.cs">
      <DependentUpon>ctlMyAccount.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlMyAccount.ascx.designer.cs">
      <DependentUpon>ctlMyAccount.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlRecoverPassword.ascx.cs">
      <DependentUpon>ctlRecoverPassword.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlRecoverPassword.ascx.designer.cs">
      <DependentUpon>ctlRecoverPassword.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlRegister.ascx.cs">
      <DependentUpon>ctlRegister.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlRegister.ascx.designer.cs">
      <DependentUpon>ctlRegister.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlSiteMap.ascx.cs">
      <DependentUpon>ctlSiteMap.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlSiteMap.ascx.designer.cs">
      <DependentUpon>ctlSiteMap.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlToolBar.ascx.cs">
      <DependentUpon>ctlToolBar.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlToolBar.ascx.designer.cs">
      <DependentUpon>ctlToolBar.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlTopicHeader.ascx.cs">
      <DependentUpon>ctlTopicHeader.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlTopicHeader.ascx.designer.cs">
      <DependentUpon>ctlTopicHeader.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlTranslator.ascx.cs">
      <DependentUpon>ctlTranslator.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlTranslator.ascx.designer.cs">
      <DependentUpon>ctlTranslator.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlVideoClips.ascx.cs">
      <DependentUpon>ctlVideoClips.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlVideoClips.ascx.designer.cs">
      <DependentUpon>ctlVideoClips.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\ctlVideoViewer.ascx.cs">
      <DependentUpon>ctlVideoViewer.ascx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Controls\ctlVideoViewer.ascx.designer.cs">
      <DependentUpon>ctlVideoViewer.ascx</DependentUpon>
    </Compile>
    <Compile Include="Controls\Handlers\GetImage.ashx.cs">
      <DependentUpon>GetImage.ashx</DependentUpon>
    </Compile>
    <Compile Include="CougarBasketball\Photos.aspx.cs">
      <DependentUpon>Photos.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="CougarBasketball\Photos.aspx.designer.cs">
      <DependentUpon>Photos.aspx</DependentUpon>
    </Compile>
    <Compile Include="Default.aspx.cs">
      <DependentUpon>Default.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="Default.aspx.designer.cs">
      <DependentUpon>Default.aspx</DependentUpon>
    </Compile>
    <Compile Include="EStore\Default.aspx.cs">
      <DependentUpon>Default.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="EStore\Default.aspx.designer.cs">
      <DependentUpon>Default.aspx</DependentUpon>
    </Compile>
    <Compile Include="EStore\EStore.Master.cs">
      <DependentUpon>EStore.Master</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="EStore\EStore.Master.designer.cs">
      <DependentUpon>EStore.Master</DependentUpon>
    </Compile>
    <Compile Include="Global.asax.cs">
      <DependentUpon>Global.asax</DependentUpon>
    </Compile>
    <Compile Include="Initi.cs" />
    <Compile Include="Properties\AssemblyInfo.cs" />
    <Compile Include="Resources\Common.Designer.cs">
      <AutoGen>True</AutoGen>
      <DesignTime>True</DesignTime>
      <DependentUpon>Common.resx</DependentUpon>
    </Compile>
    <Compile Include="Resources\Common.zh-CN.Designer.cs">
      <DependentUpon>Common.zh-CN.resx</DependentUpon>
      <AutoGen>True</AutoGen>
      <DesignTime>True</DesignTime>
    </Compile>
    <Compile Include="Resources\Common.fr-CA.Designer.cs">
      <DependentUpon>Common.fr-CA.resx</DependentUpon>
      <AutoGen>True</AutoGen>
      <DesignTime>True</DesignTime>
    </Compile>
    <Compile Include="WebForm1.aspx.cs">
      <DependentUpon>WebForm1.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="WebForm1.aspx.designer.cs">
      <DependentUpon>WebForm1.aspx</DependentUpon>
    </Compile>
    <Compile Include="WebForm2.aspx.cs">
      <DependentUpon>WebForm2.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
    </Compile>
    <Compile Include="WebForm2.aspx.designer.cs">
      <DependentUpon>WebForm2.aspx</DependentUpon>
    </Compile>
    <Compile Include="WebHelper.cs" />
    <Compile Include="WebService\AjaxWS.asmx.cs">
      <DependentUpon>AjaxWS.asmx</DependentUpon>
      <SubType>Component</SubType>
    </Compile>
    <Compile Include="WebService\ContactRouteWS.asmx.cs">
      <DependentUpon>ContactRouteWS.asmx</DependentUpon>
      <SubType>Component</SubType>
    </Compile>
    <Compile Include="WebService\EmailServer.asmx.cs">
      <DependentUpon>EmailServer.asmx</DependentUpon>
      <SubType>Component</SubType>
    </Compile>
    <Compile Include="WebService\RegularJob.asmx.cs">
      <DependentUpon>RegularJob.asmx</DependentUpon>
      <SubType>Component</SubType>
    </Compile>
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\Biz\BizLogic.csproj">
      <Project>{6AAC128F-2E01-42D6-B515-93CD9FE2D417}</Project>
      <Name>BizLogic</Name>
    </ProjectReference>
    <ProjectReference Include="..\Model\Model.csproj">
      <Project>{B89AD6D2-E18D-450A-908D-001BA4C81BE3}</Project>
      <Name>Model</Name>
    </ProjectReference>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Scripts\MicNets.js" />
    <Content Include="SiteMap.ashx" />
    <Content Include="WebService\EmailServer.asmx" />
    <Content Include="WebService\RegularJob.asmx" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="App_Themes\Blog\Blog.css" />
    <Content Include="App_Themes\Blog\Blog.skin" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\Album.aspx" />
    <Content Include="Blog\aspnet-book-recommend.aspx" />
    <Content Include="Blog\Blog.Master" />
    <Content Include="Blog\Certification.aspx" />
    <Content Include="Blog\ContactMe.aspx" />
    <Content Include="Blog\currency-convertor.aspx" />
    <Content Include="Blog\Default.aspx" />
    <Content Include="Blog\DetectScreen.aspx" />
    <Content Include="Blog\ErrorHandler.aspx" />
    <Content Include="Blog\Gallery.aspx" />
    <Content Include="Blog\google-map.aspx" />
    <Content Include="Blog\Links.aspx" />
    <Content Include="Blog\live-tv.aspx" />
    <Content Include="Blog\Login.aspx" />
    <Content Include="Blog\Member\Admin\LinkAdmin.aspx" />
    <Content Include="Blog\Member\Admin\MediaAdmin.aspx" />
    <Content Include="Blog\Member\Admin\PermissionAdmin.aspx" />
    <Content Include="Blog\Member\Admin\PropertyAdmin.aspx" />
    <Content Include="Blog\Member\Admin\UserAdmin.aspx" />
    <Content Include="Blog\Member\MyAccount.aspx" />
    <Content Include="Blog\Member\MyAddressBook.aspx" />
    <Content Include="Blog\mortgage-calculator.aspx" />
    <Content Include="Blog\MyTube.aspx" />
    <Content Include="Blog\net-zone.aspx" />
    <Content Include="Blog\recover-password.aspx" />
    <Content Include="Blog\Register.aspx" />
    <Content Include="Blog\Resume.aspx" />
    <Content Include="Blog\SearchResult.aspx" />
    <Content Include="Blog\SignOut.aspx" />
    <Content Include="Blog\SiteMap.aspx" />
    <Content Include="Blog\Tips.aspx" />
    <Content Include="Blog\Tools.aspx" />
    <Content Include="Blog\Translator.aspx" />
    <Content Include="Blog\universal-metric-convertor.aspx" />
    <Content Include="Blog\weather-forecast.aspx" />
    <Content Include="Controls\ctlAddressBook.ascx" />
    <Content Include="Controls\ctlComment.ascx" />
    <Content Include="Controls\ctlCurrencyConvertor.ascx" />
    <Content Include="Controls\ctlEmailer.ascx" />
    <Content Include="Controls\ctlGallery.ascx" />
    <Content Include="Controls\ctlLink.ascx" />
    <Content Include="Controls\ctlLogin.ascx" />
    <Content Include="Controls\ctlMediaUpload.ascx" />
    <Content Include="Controls\ctlMortgageCalculator.ascx" />
    <Content Include="Controls\ctlMyAccount.ascx" />
    <Content Include="Controls\ctlRecoverPassword.ascx" />
    <Content Include="Controls\ctlRegister.ascx" />
    <Content Include="Controls\ctlSiteMap.ascx" />
    <Content Include="Controls\ctlToolBar.ascx" />
    <Content Include="Controls\ctlTranslator.ascx" />
    <Content Include="Controls\ctlVideoClips.ascx" />
    <Content Include="Controls\ctlVideoViewer.ascx" />
    <Content Include="Image\listItem.jpg" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\Topics\naming-convention-design-guideline.aspx" />
    <Content Include="Blog\Topics\Topic.Master" />
    <Content Include="Blog\Topics\web-server-control-lable.aspx" />
    <Content Include="Blog\Topics\web-server-control-regular-Expression-Validator.aspx" />
    <Content Include="Controls\ctlTopicHeader.ascx" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\Web.config" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\ResumeProfile.xml" />
    <Content Include="Controls\Handlers\RSS_Links.ashx" />
    <Content Include="Controls\Handlers\RSS_SiteMap.ashx" />
    <Content Include="Blog\YouTube.aspx" />
    <Content Include="Controls\ctlAlbum.ascx" />
    <Content Include="Default.aspx" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Configuration\appSettings.config" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Configuration\connectionStrings.config" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Configuration\customErrors.config" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\Handlers\GetThumbnail.ashx" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\Handlers\GetImage.ashx" />
    <Content Include="WebService\ContactRouteWS.asmx" />
  </ItemGroup>
  <ItemGroup>
    <WCFMetadata Include="Service References\" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="FileUploaded\Web.config" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\Topics\Web.config" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="EStore\Web.config" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\ctlAlphaBar.ascx" />
    <Content Include="EStore\Default.aspx" />
    <Content Include="EStore\EStore.Master" />
    <Content Include="Scripts\jquery-1.3.2-vsdoc2.js" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlLogin.ascx.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlLogin.ascx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\Blog.Master.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Blog.Master.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Blog.Master.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Login.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Login.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Login.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Default.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Default.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Default.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Resume.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Resume.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlRegister.ascx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlRegister.ascx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Register.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Register.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Register.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlEmailer.ascx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlEmailer.ascx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlEmailer.ascx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlRecoverPassword.ascx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlRecoverPassword.ascx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlLogin.ascx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlRecoverPassword.ascx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlRegister.ascx.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlMortgageCalculator.ascx.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlMortgageCalculator.ascx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlMortgageCalculator.ascx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlTranslator.ascx.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlTranslator.ascx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlTranslator.ascx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlToolBar.ascx.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlToolBar.ascx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlToolBar.ascx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="WebService\AjaxWS.asmx" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\Translator.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\Translator.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\Translator.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\google-map.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\google-map.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\google-map.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\currency-convertor.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\currency-convertor.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\currency-convertor.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\Album.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\Album.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\Album.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlAlbum.ascx.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlAlbum.ascx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlAlbum.ascx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlGallery.ascx.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Controls\App_LocalResources\ctlGallery.ascx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="App_Themes\BlogChinese\BlogChinese.css" />
    <Content Include="Controls\App_LocalResources\ctlGallery.ascx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="App_Themes\BlogChinese\BlogChinese.skin" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\Gallery.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\Gallery.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\Gallery.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Blog\App_LocalResources\live-tv.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\live-tv.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\live-tv.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\MyTube.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\MyTube.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\MyTube.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\YouTube.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\YouTube.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\YouTube.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\net-zone.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\net-zone.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\net-zone.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Certification.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Certification.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Certification.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\aspnet-book-recommend.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\aspnet-book-recommend.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\aspnet-book-recommend.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Tools.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Tools.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\Tools.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\universal-metric-convertor.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\universal-metric-convertor.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\universal-metric-convertor.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\weather-forecast.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\weather-forecast.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\weather-forecast.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlSiteMap.ascx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlSiteMap.ascx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlSiteMap.ascx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\recover-password.aspx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\recover-password.aspx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Blog\App_LocalResources\recover-password.aspx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlLink.ascx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlLink.ascx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlLink.ascx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlTopicHeader.ascx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlTopicHeader.ascx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlTopicHeader.ascx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlComment.ascx.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlComment.ascx.zh-CN.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="Controls\App_LocalResources\ctlComment.ascx.fr-CA.resx">
      <SubType>Designer</SubType>
    </Content>
    <Content Include="CougarBasketball\Photos.aspx" />
    <Content Include="Image\NavigationBar\m_bottom.gif" />
    <Content Include="Image\NavigationBar\m_dwon.gif" />
    <Content Include="Image\NavigationBar\m_first.gif" />
    <Content Include="Image\NavigationBar\m_index.gif" />
    <Content Include="Image\NavigationBar\m_last.gif" />
    <Content Include="Image\NavigationBar\m_next.gif" />
    <Content Include="Image\NavigationBar\m_prev.gif" />
    <Content Include="Image\NavigationBar\m_top.gif" />
    <Content Include="Image\NavigationBar\m_up.gif" />
    <EmbeddedResource Include="Resources\Common.resx">
      <Generator>ResXFileCodeGenerator</Generator>
      <LastGenOutput>Common.Designer.cs</LastGenOutput>
      <SubType>Designer</SubType>
    </EmbeddedResource>
    <EmbeddedResource Include="Resources\Common.zh-CN.resx">
      <Generator>ResXFileCodeGenerator</Generator>
      <LastGenOutput>Common.zh-CN.Designer.cs</LastGenOutput>
      <SubType>Designer</SubType>
    </EmbeddedResource>
    <EmbeddedResource Include="Resources\Common.fr-CA.resx">
      <Generator>ResXFileCodeGenerator</Generator>
      <LastGenOutput>Common.fr-CA.Designer.cs</LastGenOutput>
      <SubType>Designer</SubType>
    </EmbeddedResource>
  </ItemGroup>
  <ItemGroup>
    <Service Include="{967B4E0D-AD0C-4609-AB67-0FA40C0206D8}" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="bin\AjaxControlToolkit.dll" />
    <Content Include="bin\fr-CA\MicNets.Web.resources.dll" />
    <Content Include="bin\GMaps.dll" />
    <Content Include="bin\itextsharp.dll" />
    <Content Include="bin\MicNets.BizLogic.dll" />
    <Content Include="bin\MicNets.BizLogic.pdb" />
    <Content Include="bin\MicNets.DAL.dll" />
    <Content Include="bin\MicNets.DAL.pdb" />
    <Content Include="bin\MicNets.HTMLTextEditor.dll" />
    <Content Include="bin\MicNets.Model.dll" />
    <Content Include="bin\MicNets.Model.pdb" />
    <Content Include="bin\MicNets.TextArea.dll" />
    <Content Include="bin\MicNets.Web.dll" />
    <Content Include="bin\MicNets.Web.pdb" />
    <Content Include="bin\zh-CN\MicNets.Web.resources.dll" />
    <Content Include="Blog\WebForm1.aspx" />
    <Content Include="Global.asax" />
    <Content Include="Web.config" />
    <Content Include="WebForm1.aspx" />
    <Content Include="WebForm2.aspx" />
  </ItemGroup>
  <ItemGroup>
    <None Include="bin\ar\WS_FTP.LOG" />
    <None Include="bin\cs\WS_FTP.LOG" />
    <None Include="bin\de\WS_FTP.LOG" />
    <None Include="bin\es\WS_FTP.LOG" />
    <None Include="bin\fr\WS_FTP.LOG" />
    <None Include="bin\he\WS_FTP.LOG" />
    <None Include="bin\hi\WS_FTP.LOG" />
    <None Include="bin\it\WS_FTP.LOG" />
    <None Include="bin\ja\WS_FTP.LOG" />
    <None Include="bin\ko\WS_FTP.LOG" />
    <None Include="bin\nl\WS_FTP.LOG" />
    <None Include="bin\pt\WS_FTP.LOG" />
    <None Include="bin\ru\WS_FTP.LOG" />
    <None Include="bin\tr-TR\WS_FTP.LOG" />
    <None Include="bin\WS_FTP.LOG" />
    <None Include="bin\zh-CHS\WS_FTP.LOG" />
    <None Include="bin\zh-CHT\WS_FTP.LOG" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="App_Data\" />
    <Folder Include="bin\bin\zh-CN\" />
    <Folder Include="Image\PremiumMemberZone\Thumbnail\" />
    <Folder Include="Image\Verification\" />
    <Folder Include="Image\Weather\" />
  </ItemGroup>
  <Import Project="$(MSBuildBinPath)\Microsoft.CSharp.targets" />
  <Import Project="$(MSBuildExtensionsPath)\Microsoft\VisualStudio\v9.0\WebApplications\Microsoft.WebApplication.targets" />
  <!-- To modify your build process, add your task inside one of the targets below and uncomment it. 
       Other similar extension points exist, see Microsoft.Common.targets.
  <Target Name="BeforeBuild">
  </Target>
  <Target Name="AfterBuild">
  </Target>
  -->
  <ProjectExtensions>
    <VisualStudio>
      <FlavorProperties GUID="{349c5851-65df-11da-9384-00065b846f21}">
        <WebProjectProperties>
          <UseIIS>True</UseIIS>
          <AutoAssignPort>True</AutoAssignPort>
          <DevelopmentServerPort>2153</DevelopmentServerPort>
          <DevelopmentServerVPath>/</DevelopmentServerVPath>
          <IISUrl>http://localhost/Web</IISUrl>
          <NTLMAuthentication>False</NTLMAuthentication>
          <UseCustomServer>False</UseCustomServer>
          <CustomServerUrl>
          </CustomServerUrl>
          <SaveServerSettingsInUserFile>False</SaveServerSettingsInUserFile>
        </WebProjectProperties>
      </FlavorProperties>
    </VisualStudio>
  </ProjectExtensions>
</Project>