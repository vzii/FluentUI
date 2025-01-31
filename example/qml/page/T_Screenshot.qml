import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0
import "qrc:///example/qml/component"
import "../component"

FluScrollablePage{

    title:"Screenshot"

    FluArea{
        Layout.fillWidth: true
        height: 100
        paddings: 10
        Layout.topMargin: 20

        FluFilledButton{
            anchors.verticalCenter: parent.verticalCenter
            text:"Open Screenshot"
            onClicked: {
                screenshot.open()
            }
        }
    }

    Rectangle{
        Layout.preferredHeight: 400
        Layout.preferredWidth: 400
        Layout.topMargin: 10
        Layout.leftMargin: 4
        Layout.bottomMargin: 4
        radius: 4
        color: FluTheme.dark ? FluColors.Black : FluColors.White
        FluShadow{
            radius: 4
            color: FluTheme.primaryColor.dark
        }
        Image{
            id:image
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            asynchronous: true
        }
    }

    FluScreenshot{
        id:screenshot
        captrueMode: FluScreenshotType.File
        saveFolder: FluTools.getApplicationDirPath()+"/screenshot"
        onCaptrueCompleted:
            (captrue)=>{
                image.source = captrue
            }
    }
}
