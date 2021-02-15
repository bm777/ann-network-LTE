import QtQuick 2.15 // 2
import QtQuick.Window 2.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import Qt3D.Core 2.0
import QtMultimedia 5.3
import QtGraphicalEffects 1.12

Window {
    id: root
    width: 1280
    height: 840
    visible: true
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width
    //color: "#e0ffff"
    // ===== [0] ======

    ValueSource {
        id: valueSource
    }
    // ====================================login========================================
    Login {
        id: login
        visible: !system.visible
    }

    Gry {
        id: gry
        visible: login.visible
    }
    // ==================================================================================

    // ================================== dahboard ======================================
    System {
        id: system
        visible: {
            if(login.username_data == "admin" && login.password_data == "1234"){
                return true
            }
            else {
                return false
            }
        }
    }


    // ==================================================================================


}
