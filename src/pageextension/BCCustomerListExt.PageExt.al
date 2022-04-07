// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50130 "BCCustomerListExt" extends "Customer List"
{
    actions
    {
        addlast("&Customer")
        {
            action(BCMojaAkcija)
            {
                ApplicationArea = All;
                ToolTip = 'Moja lepa akcija';
                Image = Absence;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    CustomerSelection: Record Customer;
                    BCMyCodeunit: Codeunit BCMyCodeunit;
                begin
                    //Message('Porukaaa');
                    CurrPage.SetSelectionFilter(CustomerSelection);
                    BCMyCodeunit.Run(CustomerSelection);
                end;
            }

            action(BCCallPublisher)
            {
                ApplicationArea = All;
                ToolTip = 'Pozivamo pablisera';
                Image = "8ball";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //Message('Nesto kao radi');
                    OnCallPublisher(Rec);
                end;
            }
        }
    }

    /*
    trigger OnOpenPage();
    var
        BCMyCodeunit: Codeunit BCMyCodeunit;
    begin
        //BCMyCodeunit.Run();
        BCMyCodeunit.Francuska();
        BCMyCodeunit.SetZemlja('Japan');
        Message('Bojana je iz %1a', BCMyCodeunit.GetZemlja());
    end;
    */

    [IntegrationEvent(false, false)]
    local procedure OnCallPublisher(var Customer: Record Customer)
    begin
    end;
}
