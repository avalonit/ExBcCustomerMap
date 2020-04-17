var __ViewerFrame;
var __ViewerOrigin;

function InitializeMapViewControl(url) {
    __ViewerOrigin = getViewerOrigin(url);
    //window.addEventListener("message", onMessage, false);
    var controlAddIn = document.getElementById('controlAddIn');
    controlAddIn.innerHTML = '<iframe id="viewer" style="border-style: none; margin: 0px; padding: 0px; height: 100%; width: 100%" allowFullScreen></iframe>'
    __ViewerFrame = document.getElementById('viewer');
    __ViewerFrame.src = url;
}

function getViewerOrigin(url) {
    if (isIE()) {
        var l = document.createElement("a");
        l.href = url;
        return (l.protocol + "//" + l.hostname);
    } else {
        return (new URL(url)).origin;
    }
}

function isIE() {
    ua = navigator.userAgent;
    /* MSIE used to detect old browsers and Trident used to newer ones*/
    var is_ie = ua.indexOf("MSIE ") > -1 || ua.indexOf("Trident/") > -1;
    
    return is_ie; 
  }

/*
function onMessage(event) {
    if (event.origin !== __ViewerOrigin) {
        console.log('Blocked invalid cross-domain call');
        return;
    }

    var data = event.data;

    if (typeof(window[data.func]) == "function") {
        window[data.func].call(null, data.message);
    }
}
*/

function mapViewerReady(message) {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnMapViewerReady', null);
}


function LoadPin(lat, lng) {

    try {
        __ViewerFrame.contentWindow.postMessage({
            'func': 'centerMap',
            'lat': lat,
            'lng': lng,
        }, __ViewerOrigin);
      }
      catch(err) {
        alert(err);
    } 

}


function ShowMessage(message) {
    alert(message);
}
