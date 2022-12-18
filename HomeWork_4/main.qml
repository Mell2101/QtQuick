import QtQuick 2.15
import QtQuick.Window 2.15
import QtCharts 2.15
import QtQuick.Controls 2.15

Window{

    visible:  true
    width: 500
    height: 500
    property bool sourceLoaded: false


    Item {
        anchors.fill: parent


        ListView {
            id: root
            focus: true
            anchors.fill: parent
            snapMode: ListView.SnapOneItem
            highlightRangeMode: ListView.StrictlyEnforceRange
            highlightMoveDuration: 250
            orientation: ListView.Horizontal
            boundsBehavior: Flickable.StopAtBounds

            onCurrentIndexChanged: {



                if (infoText.opacity > 0.0) {
                    if (sourceLoaded)
                        infoText.opacity = 0.0;
                    else if (currentIndex != 0)
                        currentIndex = 0;
                }

            }

            model: ListModel {
                ListElement {component:"SinX.qml"}
                ListElement {component:"XYGraf.qml"}
                ListElement {component:"XYabs.qml"}
                ListElement {component:"YXX.qml"}
                ListElement {component:"YlogX.qml"}

            }

            delegate: Loader {
                width: root.width
                height: root.height

                source: component
                asynchronous: true
                onLoaded: sourceLoaded = true
            }
        }

        Rectangle {
            id: infoText
            anchors.centerIn: parent
            width: parent.width
            height: 40
            color: "black"
            Text {
                color: "white"
                anchors.centerIn: parent
                text: "You can navigate between views using swipe or arrow keys"
            }

            Behavior on opacity {
                NumberAnimation { duration: 400 }
            }

        }





    }


}
