codeunit 50130 "BCMyCodeunit"
{
    TableNo = Customer;
    trigger OnRun()
    begin
        Rec.FindFirst();
        Message('%1', Rec.Count);
    end;

    procedure Francuska()
    begin
        Message('Pozdrav iz Francuske');
    end;

    procedure SetZemlja(arg: Text[20])
    begin
        zemlja := arg;
    end;

    procedure GetZemlja(): Text[20];
    begin
        exit(zemlja);
    end;

    var
        zemlja: Text[20];
}
