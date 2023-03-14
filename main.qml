import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtMultimedia

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Video Player")

    MediaPlayer {
        id: mediaPlayer
        videoOutput: videoOutput

    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
    }

    FileDialog {
        id: fileDialog
        title: qsTr("Select Video File")
        nameFilters: ["Video Files (*.avi *.mp4 *.mkv)"]

        onAccepted: {
            mediaPlayer.source = fileDialog.selectedFile
            mediaPlayer.play()
        }
    }

    Button {
        width: 124
        height: 18
        text: qsTr("Select Video File")
        anchors.verticalCenterOffset: 204
        anchors.horizontalCenterOffset: 134
        anchors.centerIn: parent
        onClicked: fileDialog.open()
    }

    Slider {

        id: mySlider
        x: 210
        y: 435
        from: 0
        to: mediaPlayer.duration
        stepSize: 5
        value: mediaPlayer.position
        onMoved: mediaPlayer.setPosition(mediaPlayer.position = mySlider.value)
    }

    Button {
        x: 0
        y: 430
        width: 80
                    height: 28
                    text: "foward 5s"
                    onClicked: {mediaPlayer.setPosition(mediaPlayer.position + 5000)}
                }
    Button {
        x: 86
        y: 430
        width: 80
        height: 28
                    text: "rewind 5s"
                    onClicked: {mediaPlayer.setPosition(mediaPlayer.position - 5000)}
                }


}
