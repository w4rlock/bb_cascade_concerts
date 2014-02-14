import bb.cascades 1.2
import org.webimageview 1.0

Container {
    layout: DockLayout {}
    //ImageView {
    WebImageView {
        id: img
        preferredWidth: 400
        preferredHeight: 370
       // imageSource: "asset:///jazz_guitar.jpg" //ListItemData.img
        url: ListItemData.img
    }
    Container {
        verticalAlignment: VerticalAlignment.Bottom
        background: Color.Black
        opacity: 0.40;
        preferredHeight: 90
        preferredWidth: img.preferredWidth
        //horizontalAlignment: HorizontalAlignment.Fill
    }
    Label {
        verticalAlignment: VerticalAlignment.Bottom
        text: ListItemData.band
        multiline: true
        textStyle{
            color: Color.White
            fontWeight: FontWeight.Bold
            fontSize: FontSize.XSmall
        }
    }
    /* Label {
     * text: ListItemData.info
     * }*/
}
