import QtQuick 2.3
import QtQuick.Window 2.0

Window
{
    visible: true
    id: root
    width: 600
    height: 500

    Item
    {
        id: positionAnchorHook
        width: 0
        height: 0
    }

    property int pointWidth: 10
    property int pointHeight: 10


    Resize{
        id: resize
    }

    Rectangle{

        height: 100
        width: 100
        color: "red"
        MouseArea{
            anchors.fill: parent
            onPressed: {
                resize.changeParent(parent)
            }
        }
    }
    Rectangle{

        height: 100
        width: 100
        color: "yellow"
        MouseArea{
            anchors.fill: parent
            onPressed: {
                resize.changeParent(parent)
            }
        }
    }

}

