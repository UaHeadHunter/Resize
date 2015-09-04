import QtQuick 2.0

Rectangle{
    height: 100
    width: 50
    color: "blue"

    MouseArea{
        anchors.fill: parent
        onPressed: {
            resize.fill(parent)
            console.log("yellow")
        }
    }
}
