codeunit 50131 "BCMySubscribers"
{
    [EventSubscriber(ObjectType::Page, Page::"Customer List", 'OnCallPublisher', '', true, true)]
    local procedure MessageOnCallPublisher(var Customer: Record Customer)
    var
        TextMsg: Label '%1', Comment = 'Objasnjenje za %1';
    begin
        Message(TextMsg, Customer.Name);
    end;

    //alt shift E
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", 'OnAfterSalesPost', '', false, false)]
    local procedure OnAfterSalesPost(var WarehouseShipmentLine: Record "Warehouse Shipment Line"; SalesHeader: Record "Sales Header"; Invoice: Boolean);
    begin
    end;

}
