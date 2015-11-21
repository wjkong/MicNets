<!-- 
  Microsoft Visual Studio 2008 Web Deployment Project 
  http://go.microsoft.com/fwlink/?LinkID=104956

-->
<Project ToolsVersion="3.5" DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <ProductVersion>9.0.21022</ProductVersion>
    <SchemaVersion>2.0</SchemaVersion>
    <ProjectGuid>{219D82C8-640C-468B-B9D4-D81597360CA8}</ProjectGuid>
    <SourceWebPhysicalPath>..\Web</SourceWebPhysicalPath>
    <SourceWebProject>{B8594075-61CB-46D0-89BD-66C04432AA90}|Web\Web.csproj</SourceWebProject>
    <SourceWebVirtualPath>/Web.csproj</SourceWebVirtualPath>
    <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
    <SccProjectName>"%24/MicNets2008/MicNets2008", CAAAAAAA</SccProjectName>
    <SccLocalPath>..</SccLocalPath>
    <SccAuxPath>
    </SccAuxPath>
    <SccProvider>MSSCCI:Microsoft Visual SourceSafe</SccProvider>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    <DebugSymbols>true</DebugSymbols>
    <OutputPath>.\Debug</OutputPath>
    <EnableUpdateable>true</EnableUpdateable>
    <UseMerge>true</UseMerge>
    <SingleAssemblyName>MicNetDeployment</SingleAssemblyName>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
    <DebugSymbols>false</DebugSymbols>
    <OutputPath>.\Release</OutputPath>
    <EnableUpdateable>true</EnableUpdateable>
    <UseMerge>true</UseMerge>
    <SingleAssemblyName>MicNets.Web</SingleAssemblyName>
    <DeleteAppCodeCompiledFiles>true</DeleteAppCodeCompiledFiles>
    <UseWebConfigReplacement>true</UseWebConfigReplacement>
    <ValidateWebConfigReplacement>true</ValidateWebConfigReplacement>
    <UseExernalWebConfigReplacementFile>true</UseExernalWebConfigReplacementFile>
  </PropertyGroup>
  <ItemGroup>
  </ItemGroup>
  <ItemGroup Condition="'$(Configuration)|$(Platform)' == 'Release|AnyCPU'">
    <AssemblyAttributes Include="AssemblyFileVersion">
      <Value>3.0.0.0</Value>
    </AssemblyAttributes>
    <AssemblyAttributes Include="AssemblyVersion">
      <Value>3.0.0.0</Value>
    </AssemblyAttributes>
    <WebConfigReplacementFiles Include="Configuration\appsettings.config">
      <Section>appSettings</Section>
    </WebConfigReplacementFiles>
    <WebConfigReplacementFiles Include="Configuration\connectionStrings.config">
      <Section>connectionStrings</Section>
    </WebConfigReplacementFiles>
    <WebConfigReplacementFiles Include="Configuration\customErrors.config">
      <Section>system.web/customErrors</Section>
    </WebConfigReplacementFiles>
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\Microsoft\WebDeployment\v9.0\Microsoft.WebDeployment.targets" />
  <!-- To modify your build process, add your task inside one of the targets below and uncomment it. 
       Other similar extension points exist, see Microsoft.WebDeployment.targets.
  <Target Name="BeforeBuild">
  </Target>
  <Target Name="BeforeMerge">
  </Target>
  <Target Name="AfterMerge">
  </Target>
  <Target Name="AfterBuild">
  </Target>
  -->
</Project>