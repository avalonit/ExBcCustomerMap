pageextension 70659928 "ALV Customer Map" extends "Customer Card"
{
    Caption = 'ALV Customer Map';

    layout
    {

        addlast(General)
        {
            field("ALV Latitude"; "ALV Latitude")
            {
                ApplicationArea = All;
                Caption = 'Latitude';
            }

            field("ALV Longitude"; "ALV Longitude")
            {
                ApplicationArea = All;
                Caption = 'Longitude';
            }
        }
        addfirst(FactBoxes)
        {
            part(ALV_MapViewer; "ALV Map Viewer Part")
            {
                Caption = 'Map Viewer';
                ApplicationArea = All;
            }
        }
    }


    trigger OnAfterGetRecord()
    begin
        ShowMapInViewer();
    end;

    local procedure ShowMapInViewer()
    var
        MapViewerSetup: Record "ALV Map Setup";
    begin
        CurrPage.ALV_MapViewer.Page.ClientLoadUrl(MapViewerSetup."Web Viewer URL", "ALV Latitude", "ALV Longitude");
    end;
}