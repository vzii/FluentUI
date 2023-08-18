import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import FluentUI 1.0
import "qrc:///example/qml/global/"
import "../component"

FluScrollablePage{

    title:"Settings"

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 136
        paddings: 10

        ColumnLayout{
            spacing: 10
            anchors{
                top: parent.top
                left: parent.left
            }
            FluText{
                text:lang.dark_mode
                font: FluTextStyle.BodyStrong
                Layout.bottomMargin: 4
            }
            Repeater{
                model: [{title:"System",mode:FluDarkMode.System},{title:"Light",mode:FluDarkMode.Light},{title:"Dark",mode:FluDarkMode.Dark}]
                delegate:  FluRadioButton{
                    selected : FluTheme.darkMode === modelData.mode
                    text:modelData.title
                    onClicked:{
                        FluTheme.darkMode = modelData.mode
                    }
                }
            }


        }

    }

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 168
        paddings: 10

        ColumnLayout{
            spacing: 10
            anchors{
                top: parent.top
                left: parent.left
            }

            FluText{
                text:lang.navigation_view_display_mode
                font: FluTextStyle.BodyStrong
                Layout.bottomMargin: 4
            }
            Repeater{
                model: [{title:"Open",mode:FluNavigationViewType.Open},{title:"Compact",mode:FluNavigationViewType.Compact},{title:"Minimal",mode:FluNavigationViewType.Minimal},{title:"Auto",mode:FluNavigationViewType.Auto}]
                delegate:  FluRadioButton{
                    selected : MainEvent.displayMode===modelData.mode
                    text:modelData.title
                    onClicked:{
                        MainEvent.displayMode = modelData.mode
                    }
                }
            }
        }
    }

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 80
        paddings: 10

        ColumnLayout{
            spacing: 10
            anchors{
                top: parent.top
                left: parent.left
            }

            FluText{
                text:lang.locale
                font: FluTextStyle.BodyStrong
                Layout.bottomMargin: 4
            }

            Flow{
                spacing: 5
                Repeater{
                    model: ["Zh","En"]
                    delegate:  FluRadioButton{
                        selected : appInfo.lang.objectName === modelData
                        text:modelData
                        onClicked:{
                            appInfo.changeLang(modelData)
                        }
                    }
                }
            }
        }
    }

}
