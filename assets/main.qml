import bb.cascades 1.2
import bb.data 1.0
import bb.system 1.2

NavigationPane {
    id: navigation
	Page {
	    id: pageMain
	    property string evento
	    titleBar: MyTitleBar {}
	    
	    Container {
	        ListView {
                id: listMusicStyles
               /* layout: GridListLayout { columnCount: 2
                    headerMode: ListHeaderMode.Standard
                    cellAspectRatio: 1.1
                    spacingAfterHeader: 40
                    verticalCellSpacing: 10
                }*/
                dataModel: GroupDataModel {
                    grouping: ItemGrouping.None
                }
	            //dataModel: XmlDataModel { source: "region_model.xml" }
	            listItemComponents: [
	                ListItemComponent {
	                    type: "item"
	                    StandardListItem {
	                       // imageSource: ListItemData.img
	                        title: ListItemData.label
	                    }
	                }
	            ]
	            onTriggered: {
	                var item = dataModel.data(indexPath);
                    pageMain.evento = 'http://floating-wave-1462.herokuapp.com/concerto/' + item.link;
                    var page = page3.createObject();
                    navigation.push(page);
	            }
	        }
	    }
	}
    attachedObjects: [
        DataSource {
            id: dsStylesService
            source: "http://floating-wave-1462.herokuapp.com/styles"
            type: DataSourceType.Json
            onDataLoaded: {
                console.log('callback')
                listMusicStyles.dataModel.clear();
                listMusicStyles.dataModel.insertList(data)
            }
            onError: {
                console.log(errorMessage.toString())
            }
        },
        ComponentDefinition {
            id: page3
            source: 'Page3.qml' 
        },
        SystemToast {
            id: toastMainPage
            body: "Cargando..."
            onFinished: {
            }
        }
    ]
    onCreationCompleted: {
        toastMainPage.show();
        dsStylesService.load();
    }
    /*
    onPopTransitionEnded: {
        console.debug('page destroy');
        page.destroy();
    }
    */ 
}
