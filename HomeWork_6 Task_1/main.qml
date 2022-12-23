import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQml 2.15
import QtQuick.Layouts 1.15

Window{
    id:_root

    width: 500
    height: 640
    visible: true
    color: "#00ffff"

    property url url
    property string http: "https://api.nasa.gov/planetary/apod?date=2000-01-25&concept_tags=true&api_key=L9UQaxh4Xgry3jXTGnUMUGIDutpjB3I8Xp8BDxkT"
    function getInfo()
    {
        var info = new XMLHttpRequest()

        info.onreadystatechange = function()
        {
            if(info.readyState == XMLHttpRequest.DONE && info.status == 200)
            {
                console.log("info", info.responseText)
                var result = JSON.parse(info.responseText)
                _root.url = result.url


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


    ColumnLayout
    {
        anchors.centerIn:parent

        Image {


            id: name
            source: _root.url.toString()
        }

        TextField
        {
            id:_text
            Layout.leftMargin: 185
            placeholderText: "YYYY-MM-dd"
            background: Rectangle
            {
                width: 150
                height:25
                color: "#f0f8ff"
            }

        }

        Button{
            Layout.leftMargin: 185
            text: "New Date"

            background: Rectangle
            {
                width: 100
                height:25


            }
            onClicked: {
                _root.http = "https://api.nasa.gov/planetary/apod?date="+_text.text+"&concept_tags=true&api_key=L9UQaxh4Xgry3jXTGnUMUGIDutpjB3I8Xp8BDxkT"
                getInfo()
            }
        }


    }






}
