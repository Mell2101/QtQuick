import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:_root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property var url

    property string http: "http://api.openweathermap.org/data/2.5/weather?q=Volgograd,ru&APPID=b148de632fcca85203453078e53cc7db"


    function getInfo()
    {
        var info = new XMLHttpRequest()

        info.onreadystatechange = function()
        {
            if(info.readyState == XMLHttpRequest.DONE && info.status == 200)
            {
                console.log("info", info.responseText)
                var result = JSON.parse(info.responseText)


            }
            else
            {
                console.log("HTTP:", info.status, info.statusText)
            }
        }

        info.open("GET",_root.http, true)
        info.send()
    }

    Component.onCompleted:
    {
        getInfo()
    }



}
