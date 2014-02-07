import bb.cascades 1.2

NavigationPane {
    id: navigation
	Page {
	    titleBar: MyTitleBar {}
	    Container {
	        ListView {
               /* layout: GridListLayout { columnCount: 2
                    headerMode: ListHeaderMode.Standard
                    cellAspectRatio: 1.1
                    spacingAfterHeader: 40
                    verticalCellSpacing: 10
                }*/
                
	            dataModel: XmlDataModel { source: "region_model.xml" }
	            listItemComponents: [
	                ListItemComponent {
	                    type: "item"
	                    StandardListItem {
	                        imageSource: ListItemData.img
	                        title: ListItemData.label
	                    }
	                }
	            ]
	            onTriggered: {
	                var item = dataModel.data(indexPath);
	                page2.title = item.label + " Concerts";
                    navigation.push(page2);
	            }
	        }
	    }
	}
    attachedObjects: [
        Page2 { id: page2 },           
        Page3 { id: page3 },
        PageConcertDetail{ id: pageDetail}
    ]
    /*
    onPopTransitionEnded: {
        console.debug('page destroy');
        page.destroy();
    }
    */ 
}
