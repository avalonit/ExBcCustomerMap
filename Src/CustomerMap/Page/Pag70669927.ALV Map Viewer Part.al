page 70669927 "ALV Map Viewer Part"
{
    PageType = CardPart;
    Caption = 'Map Viewer';

    layout
    {
        area(Content)
        {
            usercontrol(ALVMapViewer; "ALVMapViewerControlAddIn")
            {
                ApplicationArea = All;
                trigger OnControlAddInReady()
                begin
                    InitializeMapViewer();
                end;

                trigger OnMapViewerReady()
                begin
                    ControlIsReady := true;
                    //ShowData(0, 0);
                end;
            }
        }
    }

    var
        ControlIsReady: Boolean;

    local procedure InitializeMapViewer()
    var
        MapViewerSetup: Record "ALV Map Setup";
    begin
        MapViewerSetup.GetRecord();
        CurrPage.ALVMapViewer.InitializeMapViewControl(MapViewerSetup."Web Viewer URL");
    end;

    local procedure LoadMapPin(Lat: Decimal; Lon: Decimal)
    var
        tmp: Text;
    begin
        CurrPage.ALVMapViewer.LoadMapPin(Lat, Lon);
    end;

    procedure LoadMapPin(Url: Text; Lat: Decimal; Lon: Decimal)
    begin
        LoadMapPin(Lat, Lon);
    end;

    local procedure ClientShowMessage(message: Text)
    var
        tmp: Text;
    begin
        CurrPage.ALVMapViewer.ShowMessage(message);
    end;

}