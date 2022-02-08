import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    color: "#00000000"
    title: qsTr("Clock")

    flags: Qt.Window | Qt.FramelessWindowHint

    Rectangle {
        id: rectangle
        color: "#ff1145"
        radius: 10
        anchors.fill: parent
        clip: true

        Label {
            id: labelMessage
            x: 194
            height: 33
            color: "#ffffff"
            text: qsTr("Label")
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Thin
            font.family: "Courier"
            anchors.topMargin: 124
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.verticalCenterOffset: -99
            font.capitalization: Font.AllUppercase
            font.pointSize: 30
        }

        Label {
            id: labeltime
            x: 110
            height: 111
            color: "#ffffff"
            text: qsTr("Show Time")
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: labelMessage.bottom
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 25
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            font.styleName: "Regular"
            font.family: "Tahoma"
            font.pointSize: 54
        }

        Label {
            id: labelDate
            color: "#ffffff"
            text: qsTr("Label")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: labeltime.bottom
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 146
            anchors.topMargin: 5
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            font.family: "Courier"
            font.pointSize: 18
        }

        Button {
            id: button
            width: 14
            height: 14
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 5
            anchors.topMargin: 5
            background: Rectangle {
                color: "#ffffff"
                radius: 8
            }
            Text {
                id: btnText
                color: "#ff1145"
                text: qsTr("x")
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -1
                font.styleName: "Bold"
                font.family: "Tahoma"
                font.pointSize: 8
                anchors.horizontalCenter: parent.horizontalCenter
            }
            onClicked: mainWindow.close()
        }

        Rectangle {
            id: rectangle1
            height: 20
            color: "#00000000"
            anchors.left: button.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            DragHandler {
                onActiveChanged: if (active) {
                                     mainWindow.startSystemMove()
                                 }
            }

            Label {
                id: label
                color: "#ffffff"
                text: qsTr("Clock")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
    Connections {
        target: backend

        function onTime(time) {
            labeltime.text = time
        }
        function onDate(time) {
            labelDate.text = time
        }
        function onPrintGreeting(time) {
            labelMessage.text = time
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.5}D{i:2}D{i:3}D{i:4}D{i:7}D{i:5}D{i:9}D{i:10}D{i:8}D{i:1}D{i:11}
}
##^##*/

