import QtQuick 2.3
import QtQuick.Window 2.0

Window
{
    visible: true
    id: root
    width: 600
    height: 500
    function blah(parent){
        resize.anchors.fill = parent
        resize.target = parent

    }

    Resize{
        id: resize

    }

    Item{
        id: positionAnchorHook
        width: 0
        height: 0
    }

    Rectangle{
        id: redRect
        height: 150
        width: 150
        color: "red"
        MouseArea{
            anchors.fill: parent
            onPressed: {
                blah(parent)
                console.log("red")
            }
        }
    }

    Rectangle{
        id: yellowRect
        height: 100
        width: 100
        x:200
        color: "yellow"

        MouseArea{
            anchors.fill: parent
            onPressed: {
                blah(parent)
                console.log("yellow")
            }
        }

    }

}

