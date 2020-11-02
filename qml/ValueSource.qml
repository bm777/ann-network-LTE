import QtQuick 2.0

Item {
    id: valueSource
    property real data: 0;
    property string state_import: "OutMouse"
    property string state_config: "OutMouse"
    property string state_result: "OutMouse"
    property string d1: bridge.data1
    property real d2: bridge.data2
}
