table 50130 "BCCountry/Region SetUp"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            DataClassification = SystemMetadata;
            Caption = 'PrimaryKey';
        }

        field(2; CountryCode; Code[10])
        {
            DataClassification = SystemMetadata;
            Caption = 'CountryCode';
            TableRelation = "Country/Region";
            //ObsoleteState = Pending;
            //ObsoleteReason = 'In version 2.0 this field will be removed';

            trigger OnValidate()
            begin
                CalcFields(CountryName);
            end;
        }

        field(3; CountryName; Text[50])
        {
            Caption = 'CountryName';
            FieldClass = FlowField;
            CalcFormula = Lookup("Country/Region".Name Where(Code = field(CountryCode)));
            Editable = false;
        }

        field(4; "CountryName Enum"; Enum "BCCountry/Region")
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; PrimaryKey)
        {
            Clustered = true;
        }
    }

    //komentar u tablici
}
