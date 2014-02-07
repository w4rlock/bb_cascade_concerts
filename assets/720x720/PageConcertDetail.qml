import bb.cascades 1.2

Page {
    property alias title : title.setTitle
    property alias band: lblBand.text
    property alias img: imgBand.imageSource
    property alias info: infoBand.text
    
    titleBar: MyTitleBar {
        id: title
    }
    Container {
        layout: StackLayout {
            orientation: orientation.TopToBottom
        }
        Label {
            id: lblBand
        }
        ImageView {
            id: imgBand
        }
        Label {
            id: infoBand
            multiline: true
        }
    }
}
