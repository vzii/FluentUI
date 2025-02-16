import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import FluentUI 1.0
import "qrc:///example/qml/component"
import "../component"

FluScrollablePage{

    title:"Carousel"

    ListModel{
        id:data_model
        ListElement{
            url:"qrc:/example/res/image/banner_1.jpg"
        }
        ListElement{
            url:"qrc:/example/res/image/banner_2.jpg"
        }
        ListElement{
            url:"qrc:/example/res/image/banner_3.jpg"
        }
    }

    FluArea{
        Layout.fillWidth: true
        height: 370
        paddings: 10
        Layout.topMargin: 20
        Column{
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left:parent.left
            }
            FluText{
                text:"轮播图，支持无限轮播，无限滑动，用ListView实现的组件"
            }
            Item{
                width: 400
                height: 300
                FluShadow{
                    radius: 8
                }
                FluCarousel{
                    anchors.fill: parent
                    radius:[8,8,8,8]
                    delegate: Component{
                        Image {
                            anchors.fill: parent
                            source: model.url
                            asynchronous: true
                            fillMode:Image.PreserveAspectCrop
                        }
                    }
                    Layout.topMargin: 20
                    Layout.leftMargin: 5
                    Component.onCompleted: {
                        model = [{url:"qrc:/example/res/image/banner_1.jpg"},{url:"qrc:/example/res/image/banner_2.jpg"},{url:"qrc:/example/res/image/banner_3.jpg"}]
                    }
                }
            }
        }
    }

    FluArea{
        Layout.fillWidth: true
        height: 340
        paddings: 10
        Layout.topMargin: 10
        Column{
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left:parent.left
            }
            Item{
                width: 400
                height: 300
                FluShadow{
                    radius: 8
                }
                FluCarousel{
                    anchors.fill: parent
                    radius:[8,8,8,8]
                    loopTime:1500
                    indicatorGravity: Qt.AlignHCenter | Qt.AlignTop
                    indicatorMarginTop:15
                    delegate: Component{
                        Item{
                            anchors.fill: parent
                            Image {
                                anchors.fill: parent
                                source: model.url
                                asynchronous: true
                                fillMode:Image.PreserveAspectCrop
                            }
                            Rectangle{
                                height: 40
                                width: parent.width
                                anchors.bottom: parent.bottom
                                color: "#33000000"
                                FluText{
                                    anchors.fill: parent
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                    text:model.title
                                    color: FluColors.Grey10
                                    font.pixelSize: 15
                                }
                            }
                        }
                    }
                    Layout.topMargin: 20
                    Layout.leftMargin: 5
                    Component.onCompleted: {
                        var arr = []
                        arr.push({url:"qrc:/example/res/image/banner_1.jpg",title:"共同应对全球性问题"})
                        arr.push({url:"qrc:/example/res/image/banner_2.jpg",title:"三小只全程没互动"})
                        arr.push({url:"qrc:/example/res/image/banner_3.jpg",title:"有效投资扩大 激发增长动能"})
                        model = arr
                    }
                }
            }

        }
    }

    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -1
        code:'FluCarousel{
    id:carousel
    width: 400
    height: 300
    delegate: Component{
        Image {
            anchors.fill: parent
            source: model.url
            asynchronous: true
            fillMode:Image.PreserveAspectCrop
        }
    }
    Component.onCompleted: {
        carousel.model = [{url:"qrc:/example/res/image/banner_1.jpg"},{url:"qrc:/example/res/image/banner_2.jpg"},{url:"qrc:/example/res/image/banner_3.jpg"}]
    }
}'
    }
}
