import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import FluentUI 1.0

Item{
    property var radius:[0,0,0,0]
    property color color : FluTheme.dark ? Qt.rgba(0,0,0,1) : Qt.rgba(1,1,1,1)
    property bool shadow: true
    default property alias contentItem: container.data
    id:control
    onWidthChanged: {
        canvas.requestPaint()
    }
    onHeightChanged: {
        canvas.requestPaint()
    }
    onRadiusChanged: {
        canvas.requestPaint()
    }
    FluShadow{
        anchors.fill: container
        radius: control.radius[0]
        visible: {
            if(control.radius[0] === control.radius[1] && control.radius[0] === control.radius[2] && control.radius[0] === control.radius[3] && control.shadow){
                return true
            }
            return false
        }
    }
    Rectangle{
        id:container
        width: control.width
        height: control.height
        opacity: 0
        color:control.color
    }
    Canvas {
        id: canvas
        anchors.fill: parent
        visible: false
        onPaint: {
            var ctx = getContext("2d")
            var x = 0
            var y = 0
            var w = control.width
            var h = control.height
            ctx.clearRect(0, 0, canvas.width, canvas.height)
            ctx.save()
            ctx.beginPath();
            ctx.moveTo(x + radius[0], y)
            ctx.lineTo(x + w - radius[1], y)
            ctx.arcTo(x + w, y, x + w, y + radius[1], radius[1])
            ctx.lineTo(x + w, y + h - radius[2])
            ctx.arcTo(x + w, y + h, x + w - radius[2], y + h, radius[2])
            ctx.lineTo(x + radius[3], y + h)
            ctx.arcTo(x, y + h, x, y + h - radius[3], radius[3])
            ctx.lineTo(x, y + radius[0])
            ctx.arcTo(x, y, x + radius[0], y, radius[0])
            ctx.closePath()
            ctx.fillStyle = "#000000"
            ctx.fill()
            ctx.restore()
        }
    }
    OpacityMask {
        anchors.fill: container
        source: container
        maskSource: canvas
    }
}
