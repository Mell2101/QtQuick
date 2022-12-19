import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "Draw.js" as Draw

Window {
    id:_root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Canvas {
        id: _star
        anchors.fill: parent


        onPaint: {
            var star = getContext("2d");

            if(_box.currentText == "star"){

                Draw.point(0,star)
            }
            else
            {
                star.clearRect(0, 0, width, height);
            }


        }

    }

    Canvas {
        id: _ring
        anchors.fill: parent


        onPaint: {
            var ring = getContext("2d");
            var ring2 = getContext("2d");

            if(_box.currentText == "ring")
            {

                Draw.point(1,ring)


            }
            else
            {
               ring.clearRect(0, 0, width, height)

            }



        }

    }

    Canvas {
        id: _ring2
        anchors.fill: parent


        onPaint: {
            var ring = getContext("2d");


            if(_box.currentText == "ring")
            {

                Draw.point(2,ring)


            }
            else
            {
               ring.clearRect(0, 0, width, height)

            }



        }

    }

    Canvas {
        id: _house
        anchors.fill: parent


        onPaint: {
            var house = getContext("2d");

            if(_box.currentText == "house")
            {

                Draw.point(3,house)

            }
            else
            {
               house.clearRect(0, 0, width, height)

            }



        }

    }

    Canvas {
        id: _sandClock
        anchors.fill: parent


        onPaint: {


            var sandClock = getContext("2d");

            if(_box.currentText == "sandClock")
            {

                Draw.point(4,sandClock)

            }
            else
            {
               sandClock.clearRect(0, 0, width, height)

            }



        }

    }


    ComboBox{
        id:_box
        model: ["star", "ring","house","sandClock" ]

        onActivated: {

            _ring.requestPaint()
            _ring2.requestPaint()
            _house.requestPaint()
            _star.requestPaint()
            _sandClock.requestPaint()



        }


    }
}
