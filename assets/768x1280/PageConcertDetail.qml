import bb.cascades 1.2
import org.webimageview 1.0

Page {

    property alias band: lblBand.text
    property alias info: infoBand.text
    property alias title : title.setTitle
    default property alias imagen : imagena.imageSource
        
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
        WebImageView {
            id: imagena
        }
        Label {
            id: infoBand
            multiline: true
        }
    }
}
