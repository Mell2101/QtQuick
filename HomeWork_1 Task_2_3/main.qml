import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Formul 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    color: "steelblue"
    Formul{
        id:_formul
    }

    GridLayout{
        rows: 10
        columns: 10

        RowLayout{
            Layout.row:0
            Layout.column: 0

            Text{

                text: "S="
            }

            TextField{
                id: _txtA



                placeholderText: "p(p - A)"

                background: Rectangle {
                    implicitWidth: 60
                    implicitHeight: 25

                    radius: 5

                }
            }

            TextField{
                id: _txtB



                placeholderText: "p(p - B)"

                background: Rectangle {
                    implicitWidth: 60
                    implicitHeight: 25

                    radius: 5

                }
            }

            TextField{
                id: _txtC



                placeholderText: "p(p - C)"

                background: Rectangle {
                    implicitWidth: 60
                    implicitHeight: 25

                    radius: 5

                }
            }

            Text{

                text: "="
            }

            TextField{
                id: _txtS

                //readOnly: true

                background: Rectangle {
                    implicitWidth: 60
                    implicitHeight: 25

                    radius: 5

                }
            }

            Button{
                Layout.row:0
                Layout.column: 6
                text: "result"
                onClicked: {
                    _formul.setA(_txtA.text)
                    _formul.setB(_txtB.text)
                    _formul.setC(_txtC.text)
                    _txtS.text = _formul.solution();
                }
            }
        }

        RowLayout{
            Layout.row:1
            Layout.column: 0

            Text{

                text: "S=1/2(x2-x1)(y3-y1)-(x3-x1)(y2-y1)="
            }


            TextField{
                id: _result

                background: Rectangle {
                    implicitWidth: 40
                    implicitHeight: 25

                    radius: 5

                }
            }

            Button{
                Layout.row:0
                Layout.column: 6
                text: "result"
                onClicked: {
                    _formul.setX1(_x1.text)
                    _formul.setX2(_x2.text)
                    _formul.setX3(_x3.text)
                    _formul.setY1(_y1.text)
                    _formul.setY2(_y2.text)
                    _formul.setY3(_y3.text)
                    _result.text = _formul.solution2();
                }
            }

        }

        RowLayout{
            Layout.row:2
            Layout.column: 0

            TextField{

                id:_x1
                placeholderText: "X1"

                background: Rectangle {
                    implicitWidth: 45
                    implicitHeight: 25

                    radius: 5

                }
            }


            TextField{
                id:_x2
                placeholderText: "X2"

                background: Rectangle {
                    implicitWidth: 40
                    implicitHeight: 25

                    radius: 5

                }
            }

            TextField{
                id:_x3
                placeholderText: "X3"

                background: Rectangle {
                    implicitWidth: 40
                    implicitHeight: 25

                    radius: 5

                }
            }



            TextField{
                id:_y1
                placeholderText: "Y1"

                background: Rectangle {
                    implicitWidth: 40
                    implicitHeight: 25

                    radius: 5

                }
            }


            TextField{
                id:_y2
                placeholderText: "Y2"

                background: Rectangle {
                    implicitWidth: 40
                    implicitHeight: 25

                    radius: 5

                }
            }


            TextField{
                id: _y3
                placeholderText: "Y3"

                background: Rectangle {
                    implicitWidth: 40
                    implicitHeight: 25

                    radius: 5

                }
            }
        }
    }



}
