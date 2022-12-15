import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color:"#008b8b"
    //***********************
    //1) Реализуйте несколько форм приложения, отображающих состояние
    //программы: пользователь авторизовался, поиск, найдено.
    //2) Анимация
    //3) Реализуйте пользовательское отображения списка книг из модели
    // **********************


    Rectangle{
        id:_rect
        anchors.centerIn: parent
        visible: true
        width: 300
        height: 300
        radius: 20
        color: "#8fbc8f"
        state: "N"



        ColumnLayout
        {
            anchors.centerIn: parent

            TextField
            {
                id:_login
                placeholderText: "Login"

                background: Rectangle
                {
                    implicitWidth: 200
                    implicitHeight: 25
                    color: "#f0f8ff"
                    radius: 5

                }

            }



            TextField
            {
                id:_password
                placeholderText: "Password"

                background: Rectangle
                {
                    implicitWidth: 200
                    implicitHeight: 25
                    color: "#f0f8ff"
                    radius: 5

                }
            }

            Button
            {
                Layout.leftMargin: 50
                id: _button
                text: "Go"
                background: Rectangle
                {
                    implicitWidth: 100
                    implicitHeight: 25
                    color: "#f0f8ff"
                    radius: 5
                }

                onClicked:
                {

                    if(_login.text === "1" && _password.text === "1")
                    {
                        _rect.state = "StateSucess"
                        _mainRect.state = "stateVisible"

                    }
                    if(_rect.state === "N")
                    {
                        _rect.state = "StateUnSucess"
                    }



                }

                onReleased:
                {
                    _rect.state = "N"
                }

            }
        }


        states:
        [

            State
            {
                name: "StateUnSucess"    
            },

            State
            {
                name: "StateSucess"
                PropertyChanges
                {
                    target: _rect
                    opacity: 0


                }
            }

        ]

        transitions:
        [
            Transition
            {
                to: "StateUnSucess"
                SequentialAnimation
                {
                    ColorAnimation{target: _rect; property: "color"; to: "red"; duration: 1}
                    NumberAnimation { target: _rect; property: "rotation"; to: -5; duration: 100; }
                    NumberAnimation { target: _rect; property: "rotation"; to: 5; duration: 100;}
                    NumberAnimation { target: _rect; property: "rotation"; to: 0; duration: 100; }
                    ColorAnimation{target: _rect; property: "color"; to: "#8fbc8f"; duration: 500;}


                }

            },



            Transition
            {

                to: "StateSucess"
                SequentialAnimation
                {
                    NumberAnimation { target: _rect; property: "opacity"; duration: 700}
                    PropertyAnimation{ target: _rect; property: "visible"; to: false; duration: 100 }
                }

            }


        ]

    }

    Rectangle
    {
        id:_mainRect
        anchors.centerIn: parent
        visible: false
        width: 400
        height: 400
        radius: 20
        opacity: 0
        color: "#8fbc8f"
        state: "void"


        ColumnLayout
        {

            anchors.centerIn: parent

            TextField
            {
                id:_search
                placeholderText: "Search"

                background: Rectangle
                {
                    implicitWidth: 300
                    implicitHeight: 25
                    color: "#f0f8ff"
                    radius: 5

                }



            }

            Button
            {
                Layout.leftMargin: 100
                id: _butSearch
                text: "Search"
                background: Rectangle
                {
                    implicitWidth: 100
                    implicitHeight: 25
                    color: "#f0f8ff"
                    radius: 5
                }

                onClicked:
                {
                    _mainRect.state = "stateBusy"

                    if(_mainRect.state === "stateBusy" )
                    {
                        _indic.running = true
                    }
                    if(_search.text === "1")
                    {
                        _indic.running = false
                        _mainRect.state = "stateFound"
                    }
                }


            }
            BusyIndicator
            {
                Layout.leftMargin: 130
                id:_indic
                running: false



            }
        }

        states:
        [
            State
            {
                name: "stateVisible"
            },
            State
            {
                name: "stateBusy"
            },

            State
            {

                name: "stateFound"
            }
        ]

        transitions:
        [
            Transition
            {
                to: "stateVisible"
                SequentialAnimation
                {
                    PropertyAnimation{ target:_mainRect; property: "visible"; to:true; duration: 100 }
                    PropertyAnimation{ target: _mainRect; property: "opacity"; from: 0; to: 1; duration: 700}
                }
            },

            Transition
            {
                to: "stateFound"
                SequentialAnimation
                {

                    ColorAnimation { target: _mainRect; property: "color"; from:"#8fbc8f"; to: "green"; duration: 400 }
                    ColorAnimation { target: _mainRect; property: "color"; from:"green"; to: "#8fbc8f"; duration: 400 }
                }
            }

        ]

    }


}

