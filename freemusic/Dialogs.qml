//Created by litao in 2020 06 10
//the kind of dialogs
import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2

Item { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_53871"; property string __felgo_live_id_element: "FELGO_ID_53871_35";
    property alias fileOpenDialog: fileOpen
    property alias helpOpenDialog: help

    function openFileDialog() {
        fileOpen.open()
    }
    function openHelpDialog() {
        help.open()
    }

    FileDialog { property string __felgo_live_id_element: "FELGO_ID_53871_36";
        id: fileOpen
        title: "Select some Audio files"
        folder: shortcuts.pictures
        nameFilters: ["Audio files(* .mp3)"]

    }

    Dialog { property string __felgo_live_id_element: "FELGO_ID_53871_37";
        id: help
        title: qsTr("Help")

        Label { property string __felgo_live_id_element: "FELGO_ID_53871_38";
            anchors.fill: parent
            text: qsTr("A QML Audio Player\n 单击所要播放的歌曲即可播放， 也可在底部工具栏进行控制\n 单击歌曲播放， 双击暂停！！")
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
