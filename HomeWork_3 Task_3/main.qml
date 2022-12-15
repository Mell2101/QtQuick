import QtQuick 2.12
import QtQuick.Controls 2.12
Window
{
    height: 450
    width: 330
    visible: true

    Item {
    anchors.fill: parent
        ListModel
        {
            id: users
            ListElement
            {

                group: "Fantasy"
                name: "bookOne"
                registrationDate: "16.03.2019"
            }
            ListElement
            {
                group: "Science"
                name: "BookTwo"
                registrationDate: "31.03.2021"
            }
            ListElement
            {
                group: "Religion"
                name: "BookThree"
                registrationDate: "1.02.2017"
            }
            ListElement
            {
                group: "book"
                name: "book"

                registrationDate: "12.02.2021"
            }

        }

        ListView
        {
            id: list
            anchors.fill: parent
            model: users
            spacing: 1
        // Хэдер
            header: Rectangle
            {
                width: parent.width
                height: 20
                color: "darkblue"
                Text
                {
                    anchors.centerIn: parent
                    text: "It`s a library"
                    color: "white"
                }
            }
        // Футер
            footer: Rectangle
            {
                width: parent.width
                height: 20
                color: "darkgreen"
                Text
                {
                    anchors.centerIn: parent
                    text: "My name is Tim!"
                    color: "white"
                }
            }
        // Секции по группам пользователей
            section.delegate: Rectangle
            {
                width: parent.width
                height: 20
                color: "lightblue"
                Text
                {
                    anchors.centerIn: parent
                    text: section
                    color: "darkblue"
                    font.weight: Font.Bold
                }
            }
            section.property: "group"
        // Сами элементы
            delegate: Rectangle
            {
                width: list.width
                height: 50
                radius: 3
                border.width: 1
                border.color: "darkgray"
                color: "lightgray"

                MouseArea
                {
                    anchors.fill: parent
                    onDoubleClicked:
                    {
                        list.model.remove(index)
                    }
                }
                Column
                {
                    anchors.fill: parent
                    Row
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text { text: "Book"; font.weight: Font.Bold}
                        Text { text: name }
                        spacing: 20
                    }

                    Row
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text { text: "Date"; font.weight: Font.Bold}
                        Text { text: registrationDate }
                        spacing: 20
                    }
                } // Column
            }// Rectangle
        focus: true
        // Анимация появления элементов модели
        populate: Transition
        {
            NumberAnimation { properties: "x,y"; duration: 1500; easing.type:
            Easing.OutExpo}
        }
        // Анимация добавления элементов
        add: Transition
        {

            NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration:
            400 }
            NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 100
            }
        }
            // Удаление элемента
            remove: Transition
            {
            PropertyAnimation{ property: "opacity"; to: 0; duration: 1000}
            }
            // Вставка дефолтного пользователя при нажатии на пробел
            Keys.onSpacePressed: model.insert(1, { group: "Book",
            name: "SomethingBook", messagesCnt: 0,
            registrationDate: "SomethingDate"})
            }// ListView
    }// Item

}
