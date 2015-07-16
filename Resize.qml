import QtQuick 2.3

Item
{

    id: mainItem
    x: -50
    y: -50
    z: target.z
    property int pointWidth: 10
    property int pointHeight: 10
    property int myZ: 100
    property string dotColor: "blue"
    property int clickedXInHandle: 0
    property int clickedYInHandle: 0
    property Item target: mainItem


    Rectangle{
        id: dragHandleRect
        anchors.centerIn: parent
        color: "grey"
        width: parent.width + pointWidth
        height: parent.height + pointHeight
        MouseArea {
            id: dragHandle
            drag.target: target
            drag.axis: Drag.XAndYAxis
            anchors.fill: parent
            drag.threshold: 0
        }
    }
    MouseArea {
        id: topHandle
        width: pointWidth
        height: pointHeight
        x: parent.width / 2 - pointWidth / 2
        anchors.bottom: parent.top
        drag.target: topHandle
        drag.axis: Drag.YAxis

        onPressed:
        {
            positionAnchorHook.anchors.bottom = target.bottom
            target.anchors.bottom = positionAnchorHook.bottom

            clickedYInHandle = pointHeight - mouseY

        }

        onReleased:
        {
            target.anchors.bottom = undefined
            positionAnchorHook.anchors.bottom = undefined
        }

        onPositionChanged:
        {
            var mouseToPlaceholder = mapToItem(positionAnchorHook, mouseX, mouseY)
            var newHeight = -mouseToPlaceholder.y - clickedYInHandle

            if(newHeight >= pointHeight * 2)
                target.height = newHeight
        }

        Rectangle
        {
            id: topHandleRect
            anchors.fill: parent
            color: dotColor
        }
    }
    MouseArea {
        id: botHandle
        width: pointWidth
        height: pointHeight
        x: parent.width / 2 - pointWidth/ 2
        anchors.top: parent.bottom
        drag.target: botHandle
        drag.axis: Drag.YAxis

        onPressed:
        {
            positionAnchorHook.anchors.top = target.top

            target.anchors.top = positionAnchorHook.top

            clickedYInHandle = mouseY
            console.log("inside")
        }

        onReleased:
        {
            target.anchors.top = undefined
            positionAnchorHook.anchors.top = undefined
        }

        onPositionChanged:
        {
            var mouseToPlaceholder = mapToItem(positionAnchorHook, mouseX, mouseY)
            var newHeight = mouseToPlaceholder.y - clickedYInHandle

            if(newHeight >= pointHeight * 2){
                target.height = newHeight

            }
        }

        Rectangle
        {
            id: botHandleRect
            anchors.fill: parent
            color: dotColor
        }
    }
    MouseArea {
        id: leftHandle
        width: pointWidth
        height: pointHeight
        y: parent.height / 2 - pointHeight / 2
        anchors.right: parent.left
        drag.target: leftHandle
        drag.axis: Drag.XAxis

        onPressed:
        {
            positionAnchorHook.anchors.right = target.right
            target.anchors.right = positionAnchorHook.right

            clickedXInHandle = pointWidth - mouseX
        }

        onReleased:
        {
            positionAnchorHook.anchors.right = undefined
            target.anchors.right = undefined
        }

        onPositionChanged:
        {
            var mouseToPlaceholder = mapToItem(positionAnchorHook, mouseX, mouseY)
            var newWidth = -mouseToPlaceholder.x - clickedXInHandle

            if(newWidth >= pointWidth * 2)
                target.width = newWidth
        }

        Rectangle
        {
            id: leftHandleRect
            anchors.fill: parent
            color: dotColor
        }
    }
    MouseArea {
        id: rightHandle
        width: pointWidth
        height: pointHeight
        y: parent.height / 2 - pointHeight/ 2
        anchors.left: parent.right
        drag.target: rightHandle
        drag.axis: Drag.XAxis

        onPressed:
        {
            positionAnchorHook.anchors.left = target.left

            target.anchors.left = positionAnchorHook.left

            clickedXInHandle = mouseX
        }

        onReleased:
        {
            target.anchors.left = undefined
            positionAnchorHook.anchors.left = undefined
        }

        onPositionChanged:
        {
            var mouseToPlaceholder = mapToItem(positionAnchorHook, mouseX, mouseY)
            var newWidth = mouseToPlaceholder.x - clickedXInHandle

            if(newWidth >= pointWidth * 2)
                target.width = newWidth
        }

        Rectangle
        {
            id: rightHandleRect
            anchors.fill: parent
            color: dotColor

        }
    }
    MouseArea {
        id: leftTopHandle
        width: pointWidth
        height: pointHeight
        anchors.right: parent.left
        anchors.bottom: parent.top
        drag.target: topHandle
        drag.axis: Drag.YAxis

        onPressed:
        {
            positionAnchorHook.anchors.bottom = target.bottom
            positionAnchorHook.anchors.right = target.right
            target.anchors.bottom = positionAnchorHook.bottom
            target.anchors.right = positionAnchorHook.right

            clickedXInHandle = pointWidth - mouseX
            clickedYInHandle = pointHeight - mouseY

        }

        onReleased:
        {
            target.anchors.bottom = undefined
            target.anchors.right = undefined
            positionAnchorHook.anchors.bottom = undefined
            positionAnchorHook.anchors.right = undefined
        }

        onPositionChanged:
        {
            var mouseToPlaceholder = mapToItem(positionAnchorHook, mouseX, mouseY)
            var newHeight = -mouseToPlaceholder.y - clickedYInHandle
            var newWidth = -mouseToPlaceholder.x - clickedXInHandle

            if(newHeight >= pointHeight * 2)
            {
                target.height = newHeight
            }
            if(newWidth >= pointWidth * 2)
            {
                target.width = newWidth
            }
        }

        Rectangle
        {
            id: lefttopHandleRect
            anchors.fill: parent
            color: dotColor
        }
    }
    MouseArea {
        id: rightTopHandle
        width: pointWidth
        height: pointHeight
        anchors.left: parent.right
        anchors.bottom: parent.top
        drag.target: topHandle
        drag.axis: Drag.YAxis

        onPressed:
        {
            positionAnchorHook.anchors.bottom = target.bottom
            positionAnchorHook.anchors.left = target.left
            target.anchors.bottom = positionAnchorHook.bottom
            target.anchors.left = positionAnchorHook.left

            clickedXInHandle = pointWidth - mouseX
            clickedYInHandle = pointHeight - mouseY

        }

        onReleased:
        {
            target.anchors.bottom = undefined
            target.anchors.left = undefined
            positionAnchorHook.anchors.bottom = undefined
            positionAnchorHook.anchors.left = undefined
        }

        onPositionChanged:
        {
            var mouseToPlaceholder = mapToItem(positionAnchorHook, mouseX, mouseY)
            var newHeight = -mouseToPlaceholder.y - clickedYInHandle
            var newWidth = mouseToPlaceholder.x - clickedXInHandle

            if(newHeight >= pointHeight * 2)
            {
                target.height = newHeight
            }
            if(newWidth >= pointWidth * 2)
            {
                target.width = newWidth
            }
        }

        Rectangle
        {
            id: rightTopHandleRect
            anchors.fill: parent
            color: dotColor
        }
    }
    MouseArea {
        id: leftBotHandle
        width: pointWidth
        height: pointHeight
        anchors.right: parent.left
        anchors.top: parent.bottom
        drag.target: topHandle
        drag.axis: Drag.YAxis

        onPressed:
        {
            positionAnchorHook.anchors.top = target.top
            positionAnchorHook.anchors.right = target.right
            target.anchors.top = positionAnchorHook.top
            target.anchors.right = positionAnchorHook.right

            clickedXInHandle = pointWidth - mouseX
            clickedYInHandle = pointHeight - mouseY

        }

        onReleased:
        {
            target.anchors.top = undefined
            target.anchors.right = undefined
            positionAnchorHook.anchors.top = undefined
            positionAnchorHook.anchors.right = undefined
        }

        onPositionChanged:
        {
            var mouseToPlaceholder = mapToItem(positionAnchorHook, mouseX, mouseY)
            var newHeight = mouseToPlaceholder.y - clickedYInHandle
            var newWidth = -mouseToPlaceholder.x - clickedXInHandle

            if(newHeight >= pointHeight * 2)
            {
                target.height = newHeight
            }
            if(newWidth >= pointWidth * 2)
            {
                target.width = newWidth
            }
        }

        Rectangle
        {
            id: leftBotHandleRect
            anchors.fill: parent
            color: dotColor
        }
    }
    MouseArea {
        id: rightBotHandle
        width: pointWidth
        height: pointHeight
        anchors.left: parent.right
        anchors.top: parent.bottom
        drag.target: topHandle
        drag.axis: Drag.YAxis

        onPressed:
        {
            positionAnchorHook.anchors.top = target.top
            positionAnchorHook.anchors.left = target.left
            target.anchors.top = positionAnchorHook.top
            target.anchors.left = positionAnchorHook.left

            clickedXInHandle = pointWidth - mouseX
            clickedYInHandle = pointHeight - mouseY

        }

        onReleased:
        {
            target.anchors.top = undefined
            target.anchors.left = undefined
            positionAnchorHook.anchors.top = undefined
            positionAnchorHook.anchors.left = undefined
        }

        onPositionChanged:
        {
            var mouseToPlaceholder = mapToItem(positionAnchorHook, mouseX, mouseY)
            var newHeight = mouseToPlaceholder.y - clickedYInHandle
            var newWidth = mouseToPlaceholder.x - clickedXInHandle

            if(newHeight >= pointHeight * 2)
            {
                target.height = newHeight
            }
            if(newWidth >= pointWidth * 2)
            {
                target.width = newWidth
            }
        }

        Rectangle
        {
            id: rightBotHandleRect
            anchors.fill: parent
            color: dotColor
        }
    }


}
