﻿<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="3.5" DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <ProductVersion>9.0.30729</ProductVersion>
    <SchemaVersion>2.0</SchemaVersion>
    <ProjectGuid>{6AAC128F-2E01-42D6-B515-93CD9FE2D417}</ProjectGuid>
    <OutputType>Library</OutputType>
    <AppDesignerFolder>Properties</AppDesignerFolder>
    <RootNamespace>MicNets.BizLogic</RootNamespace>
    <AssemblyName>MicNets.BizLogic</AssemblyName>
    <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
    <FileAlignment>512</FileAlignment>
    <SccProjectName>SAK</SccProjectName>
    <SccLocalPath>SAK</SccLocalPath>
    <SccAuxPath>SAK</SccAuxPath>
    <SccProvider>SAK</SccProvider>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    <DebugSymbols>true</DebugSymbols>
    <DebugType>full</DebugType>
    <Optimize>false</Optimize>
    <OutputPath>bin\Debug\</OutputPath>
    <DefineConstants>DEBUG;TRACE</DefineConstants>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
    <DebugType>pdbonly</DebugType>
    <Optimize>true</Optimize>
    <OutputPath>bin\Release\</OutputPath>
    <DefineConstants>TRACE</DefineConstants>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="System" />
    <Reference Include="System.configuration" />
    <Reference Include="System.Core">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Drawing" />
    <Reference Include="System.EnterpriseServices" />
    <Reference Include="System.Runtime.Serialization">
      <RequiredTargetFramework>3.0</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.ServiceModel">
      <RequiredTargetFramework>3.0</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Web" />
    <Reference Include="System.Web.Services" />
    <Reference Include="System.Windows.Forms" />
    <Reference Include="System.Xml.Linq">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Data.DataSetExtensions">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Data" />
    <Reference Include="System.Xml" />
  </ItemGroup>
  <ItemGroup>
    <Compile Include="Accounts\Account.cs" />
    <Compile Include="Accounts\BankAccount.BizRule.cs" />
    <Compile Include="Accounts\BankAccount.Calculation.cs" />
    <Compile Include="Accounts\BankAccount.cs" />
    <Compile Include="Accounts\BankAccount.Validation.cs" />
    <Compile Include="Accounts\CableAccount.cs" />
    <Compile Include="Accounts\CheckingAccount.cs" />
    <Compile Include="Accounts\IBankAccount.cs" />
    <Compile Include="Accounts\SavingAccount.cs" />
    <Compile Include="BizLogicHelper.cs" />
    <Compile Include="Email.cs" />
    <Compile Include="Comment.cs" />
    <Compile Include="Contact.cs" />
    <Compile Include="Customer.cs" />
    <Compile Include="ErrorLog.cs" />
    <Compile Include="Item.cs" />
    <Compile Include="Keyword.cs" />
    <Compile Include="Link.cs" />
    <Compile Include="Location.cs" />
    <Compile Include="Photo.cs" />
    <Compile Include="Properties\AssemblyInfo.cs" />
    <Compile Include="Properties\Settings.Designer.cs">
      <AutoGen>True</AutoGen>
      <DesignTimeSharedInput>True</DesignTimeSharedInput>
      <DependentUpon>Settings.settings</DependentUpon>
    </Compile>
    <Compile Include="Property.cs" />
    <Compile Include="SecurityGuard.cs" />
    <Compile Include="Topic.cs" />
    <Compile Include="Video.cs" />
    <Compile Include="Web References\EmailWS\Reference.cs">
      <AutoGen>True</AutoGen>
      <DesignTime>True</DesignTime>
      <DependentUpon>Reference.map</DependentUpon>
    </Compile>
    <Compile Include="Worksheet.cs" />
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\DAL\DAL.csproj">
      <Project>{01AAD2AA-307F-4430-96FA-E97BE0D31ADB}</Project>
      <Name>DAL</Name>
    </ProjectReference>
    <ProjectReference Include="..\Model\Model.csproj">
      <Project>{B89AD6D2-E18D-450A-908D-001BA4C81BE3}</Project>
      <Name>Model</Name>
    </ProjectReference>
  </ItemGroup>
  <ItemGroup>
    <WCFMetadata Include="Service References\" />
  </ItemGroup>
  <ItemGroup>
    <None Include="app.config" />
    <None Include="Web References\EmailWS\EmailServer.wsdl" />
  </ItemGroup>
  <ItemGroup>
    <WebReferences Include="Web References\" />
  </ItemGroup>
  <ItemGroup>
    <WebReferenceUrl Include="http://www.micnets.com/WebService/EmailServer.asmx%3fop=SendEmail">
      <UrlBehavior>Dynamic</UrlBehavior>
      <RelPath>Web References\EmailWS\</RelPath>
      <UpdateFromURL>http://www.micnets.com/WebService/EmailServer.asmx%3fop=SendEmail</UpdateFromURL>
      <ServiceLocationURL>
      </ServiceLocationURL>
      <CachedDynamicPropName>
      </CachedDynamicPropName>
      <CachedAppSettingsObjectName>Settings</CachedAppSettingsObjectName>
      <CachedSettingsPropName>MicNets_BizLogic_EmailWS_EmailServer</CachedSettingsPropName>
    </WebReferenceUrl>
  </ItemGroup>
  <ItemGroup>
    <None Include="Properties\Settings.settings">
      <Generator>SettingsSingleFileGenerator</Generator>
      <LastGenOutput>Settings.Designer.cs</LastGenOutput>
    </None>
    <None Include="Web References\EmailWS\EmailServer.disco" />
    <None Include="Web References\EmailWS\Reference.map">
      <Generator>MSDiscoCodeGenerator</Generator>
      <LastGenOutput>Reference.cs</LastGenOutput>
    </None>
  </ItemGroup>
  <Import Project="$(MSBuildToolsPath)\Microsoft.CSharp.targets" />
  <!-- To modify your build process, add your task inside one of the targets below and uncomment it. 
       Other similar extension points exist, see Microsoft.Common.targets.
  <Target Name="BeforeBuild">
  </Target>
  <Target Name="AfterBuild">
  </Target>
  -->
</Project>