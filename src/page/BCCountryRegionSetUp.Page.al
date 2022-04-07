page 50130 "BCCountry/Region SetUp"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BCCountry/Region SetUp";
    Caption = 'Country/Region Setup';
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(CountryCode; Rec.CountryCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CountryCode field.';
                    Visible = false;
                }

                field(Name; Rec.CountryName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CountryName field.';
                    Visible = false;
                }

                field("CountryName Enum"; Rec."CountryName Enum")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CountryName Enum field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Setup)
            {
                action(UpgradeScript)
                {
                    ApplicationArea = All;
                    ToolTip = 'Run upgrade script';
                    Image = Action;

                    trigger OnAction()
                    var
                        BCCountryRegionUpgrade: Codeunit "BCCountry/Region Upgrade";
                    begin
                        BCCountryRegionUpgrade.Run();
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.FindFirst() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
