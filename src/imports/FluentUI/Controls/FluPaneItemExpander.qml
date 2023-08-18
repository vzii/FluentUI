import QtQuick 2.12
import QtQuick.Controls 2.12
import FluentUI 1.0


FluObject {
    readonly property string key : FluTools.uuid()
    property int _idx
    property string title
    property var icon
    property Component cusIcon
    property bool isExpand: false
    property var parent
}
