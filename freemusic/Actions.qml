//Created by litao in 2020 06 10
// the actions

import QtQuick 2.0
import QtQuick.Controls 2.5

Item { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_51709"; property string __felgo_live_id_element: "FELGO_ID_51709_10";
    property alias addAction: add
    property alias helpAction: help

    Action { property string __felgo_live_id_element: "FELGO_ID_51709_11";
        id: add
        text: qsTr("addsongs")
    }

    Action { property string __felgo_live_id_element: "FELGO_ID_51709_12";
        id: help
        text: qsTr("&Help")
    }

}
