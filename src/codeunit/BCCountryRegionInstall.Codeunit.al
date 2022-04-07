codeunit 50132 "BCCountry/Region Install"
{
    Subtype = Install;

    //trigger OnInstallAppPerDatabase();
    trigger OnInstallAppPerCompany();
    var
        UpgradeTag: Codeunit "Upgrade Tag";
        myAppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo);

        if myAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then
            HandleFreshInstall()
        else
            HandleReinstall();

        UpgradeTag.SetAllUpgradeTags();
    end;

    procedure HandleFreshInstall();
    var
        BCCountryRegionSetUp: Record "BCCountry/Region SetUp";
    begin
        BCCountryRegionSetUp.Init();
        BCCountryRegionSetUp.CountryCode := 'DE';
        BCCountryRegionSetUp."CountryName Enum" := BCCountryRegionSetUp."CountryName Enum"::FR;
        if not BCCountryRegionSetUp.Insert() then;
    end;

    procedure HandleReinstall();
    var
        BCCountryRegionSetUp: Record "BCCountry/Region SetUp"; //vfull za imenovanje promenljivih
    begin
        BCCountryRegionSetUp.Init();
        BCCountryRegionSetUp.CountryCode := 'DE';
        BCCountryRegionSetUp."CountryName Enum" := BCCountryRegionSetUp."CountryName Enum"::FR;
        if not BCCountryRegionSetUp.Insert() then;
    end;
}
