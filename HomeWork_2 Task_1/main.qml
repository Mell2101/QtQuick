import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


Window {
    id:_root
    width: 640
    height: 480
    visible: true
    title: qsTr("Registration")
    color: "#e0ffff"




    GridLayout{
        id:_grid
        anchors.fill: parent
        rows:10
        columns:10

        Rectangle{
            Layout.leftMargin: 80
            width: 200
            height: 300
            color: "white"
            Label{
                anchors.fill: parent
                text: "Photo"
            }
        }

        Rectangle{
            Layout.alignment: "Qt::AlignBottom"
            Layout.leftMargin: -50
            width: 100
            height: 25

            Button{
            anchors.fill:parent
                text: "Finish"
                onClicked:{
                    console.log("Name:"+_name.text)
                    console.log("Gender: "+_cb.currentText + " " + "Age: "+_age.text)
                    console.log("Education: "+_educ.text + " "+ "City: "+_city.text)
                    console.log("Hobby: "+_hobby.text)
                    console.log("About me: \n" + _am.text)
                    console.log("I Look For: ")
                    console.log("Gender: "+_yCb.currentText + " " + "Age: "+_yAge.text)
                    console.log("I`m Wating: \n" + _abY.text)
                }
            }
        }

        ColumnLayout{

            Layout.alignment: "Qt::AlignRight"
            Layout.row:0
            Layout.column:1

            RowLayout{


                Text{
                    text: "Name:"
                }

                TextField{
                    id:_name
                    placeholderText: "Barsic"
                    background: Rectangle{
                        implicitWidth: 150
                        implicitHeight: 25

                        radius: 5

                    }
                }
            }

            RowLayout{

                Text{
                    text: "Gender:"
                }

                Rectangle{
                    width: 80
                    height: 25
                    radius: 5


                    ComboBox{
                        id:_cb
                        anchors.fill:parent
                        model: ["Male","Female", "Other", "Undecided"]

                    }

                }

                Text{
                    text: "Age:"
                }

                TextField{
                    id:_age
                    placeholderText: "1.5"
                    background: Rectangle{
                        implicitWidth: 50
                        implicitHeight: 25

                        radius: 5

                    }
                }


           }

            RowLayout{
                Text{
                    text: "Education:"
                }

                TextField{
                    id:_educ
                    background: Rectangle{
                            implicitWidth: 100
                            implicitHeight: 25

                            radius: 5

                    }
                }

                Text{
                    text: "City:"
                }

                TextField{
                    id:_city
                    background: Rectangle{
                            implicitWidth: 100
                            implicitHeight: 25

                            radius: 5

                    }
                }

             }

             RowLayout{
                 Text{
                     text: "Hobby:"
                 }
                 TextField{
                    id: _hobby
                    visible: true
                    background: Rectangle{
                        implicitWidth: 250
                        implicitHeight: 25
                        radius: 5

                     }
                 }



             }

             Text{
                 text: "About Me:"
             }

             RowLayout{

                 TextArea{
                    id:_am
                    visible: true
                    background: Rectangle{
                        implicitWidth: 250
                        implicitHeight: 50
                        radius: 5

                     }
                 }
             }

             Text{
                 text: "I Look For:"
             }

             RowLayout{

                 Text{
                     text: "Gender:"
                 }

                 Rectangle{
                     width: 80
                     height: 25
                     radius: 5


                     ComboBox{
                         id:_yCb
                         anchors.fill:parent
                         model: ["Male","Female", "Other", "Undecided"]

                     }

                 }

                 Text{
                     text: "Age:"
                 }

                 TextField{
                     id:_yAge
                     background: Rectangle{
                         implicitWidth: 50
                         implicitHeight: 25

                         radius: 5

                     }
                 }

            }

             Text{
                 text: "I`m Waiting"
             }

             RowLayout{

                 TextArea{
                    id:_abY
                    visible: true
                    background: Rectangle{
                        implicitWidth: 250
                        implicitHeight: 50
                        radius: 5

                     }
                 }

             }
       }

    }


}
