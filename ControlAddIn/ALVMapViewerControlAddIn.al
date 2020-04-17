controladdin "ALVMapViewerControlAddIn"
{
    StartupScript = 'Js/alv_mapstartup.js';
    Scripts = 'Js/alv_mapscript.js';

    HorizontalStretch = true;
    HorizontalShrink = true;
    MinimumWidth = 250;

    event OnControlAddInReady();
    event OnMapViewerReady();
    procedure InitializeMapViewControl(url: Text);
    procedure LoadPin(Lat: Decimal; Lon: Decimal);
    procedure ShowMessage(message: Text);
}