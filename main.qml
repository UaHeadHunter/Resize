import QtQuick 2.3
import QtQuick.Window 2.0
Window
{
    visible: true
    id: root
    width: 600
    height: 500

    Resize{
        id: resize
        function fill(item){
            resize.target = item
            resize.anchors.fill = item
            resize.z = item.z
        }
    }

    Rectangle{
        id: positionAnchorHook
        width: 10
        height: 10
        z: 10000
        color:"black"
    }
    Item{
        id: rot
        width: 0
        height: 0
    }
    Item{
        id: hiddenRotateCenter
        //anchors.centerIn: parent
    }

    Rectangle{
        id: redRect
        height: 150
        width: 150
        z: parent.z
        color: "red"
        rotation: 2
        MouseArea{
            anchors.fill: parent
            onPressed: {
                resize.fill(parent)
                console.log("red")
            }
        }
    }


    Rectangle{
        id: yellowRect
        height: 100
        width: 100
        x:200
        z: parent.z
        color: "yellow"

        MouseArea{
            anchors.fill: parent
            onPressed: {
                resize.fill(parent)
                console.log("yellow")
            }
        }
    }
    Rectangle{
        id: smth
        height: 100
        width: 100
        x: 350
        y:100

        transform: Rotation {
            id: rotq
            origin.x : 50
            origin.y : 50
        }
        color: "grey"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                rotq.angle += 1
                smth.width += 1
                positionAnchorHook.rotation = rotq.angle
                positionAnchorHook.anchors.fill = parent
            }
        }
    }




}

