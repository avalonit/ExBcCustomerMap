pageextension 70669928 "ALV Customer Map" extends "Customer Card"
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


    var
        firstInit: Boolean;

    trigger OnOpenPage()
    begin
        firstInit := true;
        //Message('OnOpenPage');
    end;

    trigger OnAfterGetRecord()
    begin
        //Message('OnAfterGetRecord');
        //if (firstInit) then
        LoadMapPin();
        firstInit := false;
    end;

    local procedure LoadMapPin()
    var
        MapViewerSetup: Record "ALV Map Setup";
    begin
        CurrPage.ALV_MapViewer.Page.LoadMapPin(MapViewerSetup."Web Viewer URL", "ALV Latitude", "ALV Longitude");
    end;
}