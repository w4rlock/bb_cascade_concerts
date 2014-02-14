import bb.cascades 1.2

 TitleBar {
  // property  alias setTitle : lbl.text
    property  string setTitle
    kind: TitleBarKind.FreeForm
    kindProperties: FreeFormTitleBarKindProperties {
        Container {
            background: Color.Black
            layout: DockLayout {}
            /*Label {
                id: lbl
                text: "Concerts"
                textStyle{
                    color: Color.White
                    fontWeight: FontWeight.Bold
                    fontSize: FontSize.XLarge
                
                }
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.fontStyle: FontStyle.Italic
            }*/
            ImageView {
                id: titlee
                imageSource: "asset:///title.png"
                horizontalAlignment: HorizontalAlignment.Center
            }
        }
    }
} 
