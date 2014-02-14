import bb.cascades 1.2
import org.webimageview 1.0

Page {

    property alias band: lblBand.text
    property alias info: infoBand.text
    property alias title : title.setTitle
        
    titleBar: MyTitleBar {
        id: title
    }
    Container {
        topPadding: 25
        Container {
            horizontalAlignment: HorizontalAlignment.Center
            layout: DockLayout {}
            WebImageView {
                id: imagena
                preferredHeight: 450
                preferredWidth: 550
                url: page3.imgurl
                horizontalAlignment: HorizontalAlignment.Center
            }
            Container {
                opacity: .5
                preferredHeight: 60
                preferredWidth: imagena.preferredWidth
                background: Color.Black
            }
            Label {
                id: lblBand
                textStyle.color: Color.White
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.fontWeight: FontWeight.Bold
            }
        }
       
        
        Container {
            leftPadding: 30
            Label {
                id: infoBand
                multiline: true
            }
        }
    }
}
