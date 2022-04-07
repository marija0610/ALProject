codeunit 50133 "BCCountry/Region Upgrade"
{
    //Subtype = Upgrade;

    trigger OnRun()
    begin
        PerformUpgrade();
    end;

    /*trigger OnUpgradePerCompany()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        if UpgradeTag.HasUpgradeTag(ReasonLbl) then exit;

        PerformUpgrade();

        UpgradeTag.SetUpgradeTag(ReasonLbl);
    end;*/

    local procedure PerformUpgrade()
    var
        BCCountryRegionSetUp: Record "BCCountry/Region SetUp";
        BCCountryRegionInstall: Codeunit "BCCountry/Region Install";
    begin
        //nas kod
        if not BCCountryRegionSetUp.FindFirst() then
            BCCountryRegionInstall.HandleFreshInstall()
        else begin
            case BCCountryRegionSetUp.CountryCode of
                'SI':
                    BCCountryRegionSetUp."CountryName Enum" := BCCountryRegionSetUp."CountryName Enum"::CA;
                'JA':
                    BCCountryRegionSetUp."CountryName Enum" := BCCountryRegionSetUp."CountryName Enum"::JA;
                'RS':
                    BCCountryRegionSetUp."CountryName Enum" := BCCountryRegionSetUp."CountryName Enum"::RS;
                'FR':
                    BCCountryRegionSetUp."CountryName Enum" := BCCountryRegionSetUp."CountryName Enum"::FR;
                else
                    BCCountryRegionSetUp."CountryName Enum" := BCCountryRegionSetUp."CountryName Enum"::FR;
            end;
            BCCountryRegionSetUp.Modify();
        end
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyUpgradeTags(var PerCompanyUpgradeTags: List of [Code[250]]);
    begin
        PerCompanyUpgradeTags.Add(ReasonLbl);
    end;


    var
        ReasonLbl: Label 'BETerna-SetUpEnum-20220406', Locked = true;
}
