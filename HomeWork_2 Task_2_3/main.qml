import QtQuick 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        id: _rect
        width: 200
        height: 200
        anchors.centerIn: parent
        color: "blue"
        antialiasing: true
        focus:true

    }

    MouseArea{
        id: _mouse
        anchors.fill: _rect
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onClicked:(mouse)=> {
            if(mouse.button === Qt.LeftButton){

                _anim.to = Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                _anim.running = true
            }
            if(mouse.button === Qt.RightButton){

                _anim2.running = true

            }
        }
        onDoubleClicked: {
            if(mouse.button === Qt.LeftButton){

                _anim1.running = true
            }
        }



    }

    ColorAnimation{
        id: _anim
        target: _rect
        property: "color"
        from: _rect.color
        duration: 500
    }
    PropertyAnimation{
        id: _anim1
        target: _rect
        property: "radius"
        from: 0
        to:100
        duration: 1000
    }
    RotationAnimation{
        id:_anim2
        target: _rect
        properties: "rotation"
        from: 0
        to:180
        duration: 2000

    }


}
