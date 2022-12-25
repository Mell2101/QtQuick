import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.LocalStorage 2.15
import Qt.labs.qmlmodels 1.0
import QtQml 2.15
//import Qt.labs.platform 1.1
import QtQuick.Controls 2.15
import "FunctionBaseData.js" as FBD

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")




    TableModel
    {
        id: tableModel

        TableModelColumn{display: "id"}
        TableModelColumn{display: "columnOne"}
        TableModelColumn{display: "columnTwo"}
        TableModelColumn{display: "columnThree"}
        TableModelColumn{display: "columnFour"}
        rows:[]

    }

    TableView
    {
        id: table
        anchors.fill: parent

        model: tableModel
        delegate: Rectangle
        {

            implicitWidth: Math.max(100, /*left*/ 10 + _text.width + /*right*/
            10)

            implicitHeight: 50
            border.width:1
            Text {
                id: _text
                text: display
                anchors.centerIn: parent

            }
        }
    }

    Dialog
    {
        id: dialogCreate
        title: "Creat Table"
        anchors.centerIn: parent
        standardButtons: Dialog.Ok | Dialog.Cancel
        width:200
        height:200

        Column
        {
            anchors.fill: parent
            spacing: 5
            TextField
            {

                id:_nameTable
                placeholderText: "Name Table"
                background: Rectangle{
                    height: 25
                    width: 180

                }
            }


        }
        onAccepted:
        {
            creat(_nameTable.text)
        }


    }

    Dialog
    {
        id: dialogAdd
        title: "Add Infom"
        anchors.centerIn: parent
        standardButtons: Dialog.Cancel
        width:200
        height:280

        Column
        {
            anchors.fill: parent
            spacing: 5
            TextField
            {

                id:_nameTableinfo
                placeholderText: "Name Table"
                background: Rectangle{
                    height: 25
                    width: 100

                }
            }

            TextField
            {

                id:_id
                placeholderText: "id"
                background: Rectangle{
                    height: 25
                    width: 100

                }
            }

            TextField
            {
                id: _nameColumnInfoOne
                placeholderText: "Column"
                background: Rectangle{
                    height: 25
                    width: 100
                }
            }

            TextField
            {
                id: _nameColumnInfoTwo
                placeholderText: "Column"
                background: Rectangle{
                    height: 25
                    width: 100
                }
            }

            TextField
            {
                id: _nameColumnInfoThree
                placeholderText: "Column"
                background: Rectangle{
                    height: 25
                    width: 100
                }
            }

            TextField
            {
                id: _nameColumnInfoFour
                placeholderText: "Column"
                background: Rectangle{
                    height: 25
                    width: 100
                }
            }

            Button{

                width:100
                height: 25
                text: "Add Info"
                onClicked: {
                    table.model.clear()
                    addData(_nameTableinfo.text,_id.text,_nameColumnInfoOne.text, _nameColumnInfoTwo.text, _nameColumnInfoThree.text,_nameColumnInfoFour.text)
                    read(_nameTableinfo.text)
                }


            }
        }






    }
    RowLayout
    {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        height: 50

        Button{
            id:buttonCreate
            text: "Create Table"

            onClicked: dialogCreate.open()
        }

        Button{
            id: buttonAdd
            text: "Add Info"

            onClicked: dialogAdd.open()

        }

        Button{
            id: buttonLoad
            text: "Load Table"

            onClicked:{

                table.model.clear()

                read(search.currentText)



            }
        }



        ComboBox
        {
            id: search

            model: ["TableOne", "TableTwo","TableThree"]


        }


    }




    function read(nameTable)
    {
        var dataArray = ListModel
        var db = LocalStorage.openDatabaseSync("BaseData", "1.0","", 1000)
        try
        {
            db.transaction((tx)=>{ FBD.readTable(tx, nameTable, table.model)})
        }
        catch(err)
        {
            console.log(err)
        }
    }

    function creat(name)
    {
        var db = LocalStorage.openDatabaseSync("BaseData", "1.0","", 1000)
        try
        {
            //db.transaction(FBD.createTable(tx, name, columnOne, columnTwo, columnThree,columnFour));
            db.transaction((tx)=>
                           {
                               FBD.createTable(tx, name)
                           })
        }
        catch(error)
        {
            console.log( error)
        }
    }
    function addData( name, id,argOne, argTwo, argThree, argFour)
    {
        var db = LocalStorage.openDatabaseSync("BaseData", "1.0","", 1000)
        db.transaction((tx)=>
                       {
                           FBD.addDataTable(tx,name, id, argOne, argTwo, argThree, argFour)
                       })
    }

}
