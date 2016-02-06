<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <ProductVersion>3.5</ProductVersion>
    <ProjectTypeGuids>{349c5851-65df-11da-9384-00065b846f21};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
    <OutputType>Library</OutputType>
    <RootNamespace>DataSnapdotNetClient</RootNamespace>
    <AssemblyName>DataSnapdotNetClient</AssemblyName>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <TargetFrameworkVersion>v4.0</TargetFrameworkVersion>
    <Name>DataSnapdotNetClient</Name>
    <ProjectGuid>{4397313d-f60f-4048-bf1b-b5d1f38684c5}</ProjectGuid>
    <InternalAssemblyName />
    <StartupClass />
    <DefaultUses />
    <ApplicationIcon />
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <OutputPath>./bin</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <OutputPath>./bin</OutputPath>
    <EnableAsserts>False</EnableAsserts>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="Borland.Data.AdoDbxClient">
      <HintPath>C:\Program Files (x86)\Common Files\CodeGear Shared\Delphi Prism\Shared Assemblies\7.0\Borland.Data.AdoDBXClient.dll</HintPath>
    </Reference>
    <Reference Include="Borland.Data.DbxClientDriver" />
    <Reference Include="Borland.Data.DbxCommonDriver">
      <HintPath>C:\Program Files (x86)\Common Files\CodeGear Shared\Delphi Prism\Shared Assemblies\7.0\Borland.Data.DbxCommonDriver.dll</HintPath>
    </Reference>
    <Reference Include="Borland.Delphi">
      <HintPath>C:\Program Files (x86)\Common Files\CodeGear Shared\Delphi Prism\Shared Assemblies\7.0\Borland.Delphi.dll</HintPath>
    </Reference>
    <Reference Include="Borland.VclDbRtl">
      <HintPath>C:\Program Files (x86)\Common Files\CodeGear Shared\Delphi Prism\Shared Assemblies\7.0\Borland.VclDbRtl.dll</HintPath>
    </Reference>
    <Reference Include="Borland.VclRtl">
      <HintPath>C:\Program Files (x86)\Common Files\CodeGear Shared\Delphi Prism\Shared Assemblies\7.0\Borland.VclRtl.dll</HintPath>
    </Reference>
    <Reference Include="mscorlib">
      <HintPath>mscorlib.dll</HintPath>
    </Reference>
    <Reference Include="System" />
    <Reference Include="System.Configuration" />
    <Reference Include="System.Data" />
    <Reference Include="System.Drawing" />
    <Reference Include="System.EnterpriseServices" />
    <Reference Include="System.Web" />
    <Reference Include="System.Web.Mobile" />
    <Reference Include="System.Web.Services" />
    <Reference Include="System.Xml" />
    <Reference Include="System.Core">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Xml.Linq">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Data.DataSetExtensions">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="ClientProxy.pas" />
    <Compile Include="MainForm.aspx.designer.pas">
      <DependentUpon>MainForm.aspx</DependentUpon>
      <SubType>ASPXCodeBehind</SubType>
      <DesignableClassName>DataSnapdotnetClient.MainForm</DesignableClassName>
    </Compile>
    <Compile Include="MainForm.aspx.pas">
      <SubType>ASPXCodeBehind</SubType>
      <DependentUpon>MainForm.aspx</DependentUpon>
      <DesignableClassName>DataSnapdotnetClient.MainForm</DesignableClassName>
    </Compile>
    <Content Include="Global.asax" />
    <Compile Include="Global.asax.pas">
      <DependentUpon>Global.asax</DependentUpon>
    </Compile>
    <Content Include="Web.config" />
    <Content Include="MainForm.aspx">
      <SubType>Content</SubType>
    </Content>
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Properties\" />
  </ItemGroup>
  <ProjectExtensions>
    <VisualStudio>
      <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}">
        <WebProjectProperties>
          <UseIIS>False</UseIIS>
          <AutoAssignPort>True</AutoAssignPort>
          <DevelopmentServerPort>4718</DevelopmentServerPort>
          <DevelopmentServerVPath>/</DevelopmentServerVPath>
          <IISUrl>
          </IISUrl>
          <NTLMAuthentication>False</NTLMAuthentication>
          <UseCustomServer>False</UseCustomServer>
          <CustomServerUrl>
          </CustomServerUrl>
          <SaveServerSettingsInUserFile>False</SaveServerSettingsInUserFile>
        </WebProjectProperties>
      </FlavorProperties>
      <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}" User="">
        <WebProjectProperties>
          <StartPageUrl>MainForm.aspx</StartPageUrl>
          <StartAction>SpecificPage</StartAction>
          <AspNetDebugging>True</AspNetDebugging>
          <SilverlightDebugging>False</SilverlightDebugging>
          <NativeDebugging>False</NativeDebugging>
          <SQLDebugging>False</SQLDebugging>
          <ExternalProgram>
          </ExternalProgram>
          <StartExternalURL>
          </StartExternalURL>
          <StartCmdLineArguments>
          </StartCmdLineArguments>
          <StartWorkingDirectory>
          </StartWorkingDirectory>
          <EnableENC>False</EnableENC>
          <AlwaysStartWebServerOnDebug>True</AlwaysStartWebServerOnDebug>
        </WebProjectProperties>
      </FlavorProperties>
    </VisualStudio>
  </ProjectExtensions>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.targets" />
  <Import Project="$(MSBuildExtensionsPath)\Microsoft\VisualStudio\v10.0\WebApplications\Microsoft.WebApplication.targets" />
</Project>