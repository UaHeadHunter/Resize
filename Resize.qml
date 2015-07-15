import QtQuick 2.0

Item
{
    id: mainItem
    x: -50
    y: -50
    //color: "blue"

    MouseArea
    {
        id: dragHandle
        anchors.fill: parent
        width: parent.width
        drag.target: parent
        drag.axis: Drag.XAndYAxis

    }

    MouseArea
    {
        id: topHandle
        width: pointWidth
        height: pointHeight
        x: parent.width / 2 - topHandle.width / 2
        anchors.bottom: parent.top
        drag.target: topHandle
        drag.axis: Drag.YAxis
        property int clickedYInHandle: 0 // used to keep the mouse pointed at the position you clicked

        onPressed:
        {
            // We only set the anchors for a second to put the anchor element on the right position. After that's done we release the hook to this element.
            positionAnchorHook.anchors.bottom = topHandle.parent.bottom
            positionAnchorHook.anchors.left = topHandle.parent.left
            positionAnchorHook.anchors.bottom = undefined
            positionAnchorHook.anchors.left = undefined

            // Now hook our object to the achor element
            topHandle.parent.anchors.bottom = positionAnchorHook.bottom

            clickedYInHandle = mouseY
        }

        onReleased:
        {
            parent.anchors.top = undefined
            parent.anchors.bottom = undefined
        }

        onPositionChanged:
        {
            var mouseToPlaceholder = mapToItem(positionAnchorHook, mouseX, mouseY)
            var newHeight = -mouseToPlaceholder.y + clickedYInHandle



            if(newHeight >= botHandle.height * 2)
                parent.height = newHeight
        }

        Rectangle
        {
            id: topHandleRect
            anchors.fill: parent
            color: "green"

        }
    }
    MouseArea
    {
        id: botHandle
        width: pointWidth
        height: pointHeight
        x: parent.width / 2 - botHandle.width / 2
        anchors.top: parent.bottom
        drag.target: botHandle
        drag.axis: Drag.YAxis
        property int clickedYInHandle: 0 // used to keep the mouse pointed at the position you clicked

        onPressed:
        {
            // We only set the anchors for a second to put the anchor element on the right position. After that's done we release the hook to this element.
            positionAnchorHook.anchors.top = parent.top
            positionAnchorHook.anchors.right = parent.right
            positionAnchorHook.anchors.top = undefined
            positionAnchorHook.anchors.right = undefined

            // Now hook our object to the achor element
            parent.anchors.top = positionAnchorHook.top

            clickedYInHandle = botHandle.height - mouseY
        }

        onReleased:
        {
            parent.anchors.top = undefined
            parent.anchors.bottom = undefined
        }

        onPositionChanged:
        {
            var mouseToPlaceholder = mapToItem(positionAnchorHook, mouseX, mouseY)
            var newHeight = mouseToPlaceholder.y + clickedYInHandle/*botHandle.height / 2*/

            if(newHeight >= botHandle.height * 2)
                parent.height = newHeight
        }

        Rectangle
        {
            id: botHandleRect
            anchors.fill: parent
            color: "green"
            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "red" }
                    GradientStop { position: 0.33; color: "yellow" }
                }
            }
        }
    }
    MouseArea
    {
        id: leftHandle
        width: pointWidth
        height: pointHeight
        y: parent.height / 2 - leftHandle.height / 2
        anchors.right: parent.left
        drag.target: leftHandle
        drag.axis: Drag.XAxis
        property int clickedXInHandle: 0 // used to keep the mouse pointed at the position you clicked

        onPressed:
        {
            // We only set the anchors for a second to put the anchor element on the right position. After that's done we release the hook to this element.
            positionAnchorHook.anchors.bottom = parent.bottom
            positionAnchorHook.anchors.right = parent.right
            positionAnchorHook.anchors.bottom = undefined
            positionAnchorHook.anchors.right = undefined

            // Now hook our object to the achor element
            parent.anchors.right = positionAnchorHook.right

            clickedXInHandle = mouseX
        }

        onReleased:
        {
            parent.anchors.left = undefined
            parent.anchors.right = undefined
        }

        onPositionChanged:
        {
            var mouseToPlaceholder = mapToItem(positionAnchorHook, mouseX, mouseY)
            var newWidth = -mouseToPlaceholder.x + clickedXInHandle



            if(newWidth >= leftHandle.width * 2)
                parent.width = newWidth
        }

        Rectangle
        {
            id: leftHandleRect
            anchors.fill: parent
            color: "green"
            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "red" }
                    GradientStop { position: 0.33; color: "yellow" }
                }
            }
        }
    }
    MouseArea
    {
        id: rightHandle
        width: pointWidth
        height: pointHeight
        y: parent.height / 2 - rightHandle.height / 2
        anchors.left: parent.right
        drag.target: rightHandle
        drag.axis: Drag.XAxis
        property int clickedXInHandle: 0 // used to keep the mouse pointed at the position you clicked

        onPressed:
        {
            // We only set the anchors for a second to put the anchor element on the right position. After that's done we release the hook to this element.
            positionAnchorHook.anchors.bottom = parent.bottom
            positionAnchorHook.anchors.left = parent.left
            positionAnchorHook.anchors.bottom = undefined
            positionAnchorHook.anchors.left = undefined

            // Now hook our object to the achor element
            parent.anchors.left = positionAnchorHook.left

            clickedXInHandle = rightHandle.width - mouseX
        }

        onReleased:
        {
            parent.anchors.left = undefined
            parent.anchors.right = undefined
        }

        onPositionChanged:
        {
            var mouseToPlaceholder = mapToItem(positionAnchorHook, mouseX, mouseY)
            var newWidth = mouseToPlaceholder.x + clickedXInHandle



            if(newWidth >= rightHandle.width * 2)
                parent.width = newWidth
        }

        Rectangle
        {
            id: rightHandleRect
            anchors.fill: parent
            color: "green"
            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "red" }
                    GradientStop { position: 0.33; color: "yellow" }
                }
            }
        }
    }

    function changeParent(parent){
        mainItem.parent = parent
        dragHandle.parent = parent
        topHandle.parent = parent
        leftHandle.parent = parent
        botHandle.parent = parent
        rightHandle.parent = parent

    }
}
