//Created by litao in 2020 06 10
import QtQuick 2.13
import QtMultimedia 5.13


Item{ property string __felgo_live_id_component: "FELGO_COMPONENT_ID_8863"; property string __felgo_live_id_element: "FELGO_ID_8863_1";

    function setFilesModel(){
        play1.clear() //clear the ListModel: play1
        for(var i = 0; i < arguments[0].length; i++){
            var data = arguments[0][i]; //get the path from the OpenfileDialog.FileUrls
            play1.addItem(data) //only have the property source, add
        }
        play1.currentIndex = 0; //currentIndex equals to -1 default,so it must be set to  0
    }

    //The button's function
    function playcontrol(){
        if(player.playbackState == Audio.PlayingState)
           {

            player.pause()
            return ">"
        }
        else {
            player.play()
            return "||"
        }
    }

    function nextmusic(){
        play1.currentIndex++
        if(play1.currentIndex < play1.itemCount) {
            player.source=play1.currentItemSource
            player.play()
            console.log("正在播放"+player.source )
        } else{
            play1.currentIndex=0
            player.source=play1.currentItemSource
            player.play()
            console.log("正在播放"+player.source )
        }

    }

    function previousmusic(){
        play1.currentIndex--
        if(play1.currentIndex >= 0) {
            player.source=play1.currentItemSource
            player.play()
            console.log("正在播放"+player.source )
        }
        else{
            console.log("这是第一首")
        }

    }

    //split the filename from their path
    function getfilename(){
        var files=new String(arguments[0])
        var filenames=files.split('/')
        return filenames[filenames.length-1]
    }


    Audio{ property string __felgo_live_id_element: "FELGO_ID_8863_2";
        id:player
        playlist: Playlist{ property string __felgo_live_id_element: "FELGO_ID_8863_3";
            id:play1
        }
    }
    Image { property string __felgo_live_id_element: "FELGO_ID_8863_4";
        source: "./09.jpg"
    }

    ListView{ property string __felgo_live_id_element: "FELGO_ID_8863_5";
        id:listview
        anchors.fill: parent
        spacing: 10
        model: play1
        delegate: listDelegate

        }
    Component{
            id: listDelegate
            Rectangle{ property string __felgo_live_id_element: "FELGO_ID_8863_6";
                property int fromIndex: 0
                property int toIndex: 0

                id: listItem
                width: parent.width
                height: 30

                Text { property string __felgo_live_id_element: "FELGO_ID_8863_7";
                    id: label
                    font.family: "microsoft yahei"
                    font.pointSize: 12
                    height: parent.height
                    width: parent.width
                    text:" "+ getfilename(source)
                    color: "#148014"
                    verticalAlignment: Text.AlignVCenter
                }
                Rectangle{ property string __felgo_live_id_element: "FELGO_ID_8863_8";
                    id:rec1
                    color: "#AAAAAA"
                    height: 1
                    width: parent.width
                    anchors.bottom: parent.bottom
                    visible: true
                }
                MouseArea { property string __felgo_live_id_element: "FELGO_ID_8863_9";
                    id: mousearea
                    anchors.fill: parent
                    onPressed: {
                        listview.currentIndex = index;
                        listItem.fromIndex = index;
                        label.color = "#4040FF"
                        label.height= label.height-2


                    }
                    onReleased: {
                        label.color = "#148014"
                        console.debug("fromIndex: ", listItem.fromIndex, "toIndex: ", listItem.toIndex);
                    }
                    onMouseYChanged: {
                        var lastIndex = listview.indexAt(mousearea.mouseX + listItem.x,
                                                         mousearea.mouseY + listItem.y);
                        if ((lastIndex < 0) || (lastIndex > play1.rowCount()))
                            return;
                        if (index !== lastIndex){
                            play1.move(index, lastIndex, 1);
                        }
                        listItem.toIndex = lastIndex;
                    }
                    onClicked: {
                        player.source=source
                        player.play()
                        console.log("正在播放:  "+source)
                    }
                    onDoubleClicked: {
                        player.pause()
                        console.log("暂停："+ source)
                    }
                }
            }
        }
}


