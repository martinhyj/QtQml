
/*Created by litao in 2020 0610
  Freemusic is a simple music player
  */
import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtMultimedia 5.13

ApplicationWindow { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_24778"; property string __felgo_live_id_element: "FELGO_ID_24778_15";
    title: "Mp3 Player"
    visible: true
    id: appWindow
    width: 640
    height: 480


    //menuBar
    menuBar: MenuBar { property string __felgo_live_id_element: "FELGO_ID_24778_16";
        id: appMenuBar

        Menu { property string __felgo_live_id_element: "FELGO_ID_24778_17";
            title: qsTr("&File")
            MenuItem { property string __felgo_live_id_element: "FELGO_ID_24778_18";
                action: actions.addAction
            }
        }
        Menu { property string __felgo_live_id_element: "FELGO_ID_24778_19";

            title: qsTr(("&Help"))
            MenuItem { property string __felgo_live_id_element: "FELGO_ID_24778_20";
                action: actions.helpAction
            }
        }
    }
    //ToolBar
    header: ToolBar { property string __felgo_live_id_element: "FELGO_ID_24778_21";
        id: appToolBar
        RowLayout { property string __felgo_live_id_element: "FELGO_ID_24778_22";
            ToolButton { property string __felgo_live_id_element: "FELGO_ID_24778_23";
                action: actions.addAction
            }
        }
    }
    footer: ToolBar{ property string __felgo_live_id_element: "FELGO_ID_24778_24";
        id:footBar
        RowLayout{ property string __felgo_live_id_element: "FELGO_ID_24778_25";

            MyButton{ property string __felgo_live_id_element: "FELGO_ID_24778_26";
                id:control
                text: "||"
                MouseArea{ property string __felgo_live_id_element: "FELGO_ID_24778_27";
                    anchors.fill: parent
                    onPressed: {
                        control.text=content.playcontrol()

                }
            }
            }

            MyButton{ property string __felgo_live_id_element: "FELGO_ID_24778_28";
                text: "Previous"
                MouseArea{ property string __felgo_live_id_element: "FELGO_ID_24778_29";
                    anchors.fill: parent
                    onPressed: {
                        content.previousmusic()
                    }
                }
            }
            MyButton{ property string __felgo_live_id_element: "FELGO_ID_24778_30";
                text: "Next"
                MouseArea{ property string __felgo_live_id_element: "FELGO_ID_24778_31";
                    anchors.fill: parent
                    onPressed: {
                        content.nextmusic()
                    }
                }
            }

    }
    }

    //Actions
    Actions { property string __felgo_live_id_element: "FELGO_ID_24778_32";
        id: actions
        addAction.onTriggered: dialogs.openFileDialog()
        helpAction.onTriggered: dialogs.openHelpDialog()

    }
    //The Dialog need
    Dialogs { property string __felgo_live_id_element: "FELGO_ID_24778_33";
        id: dialogs
        fileOpenDialog.selectMultiple: true
        fileOpenDialog.onAccepted:
            content.setFilesModel(fileOpenDialog.fileUrls)
    }

    //Main Content
    Content{ property string __felgo_live_id_element: "FELGO_ID_24778_34";
        id:content
        anchors.fill:parent
        visible: true
    }

}
