import bb.cascades 1.2

TabbedPane {
    showTabsOnActionBar: true
    Tab {
        title: "Home"
        Page{
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
            /*onTriggered: {
                var item = dataModel.data(indexPath);
                pageMain.evento = 'http://floating-wave-1462.herokuapp.com/concerto/' + item.link;
                var page = page3.createObject();
                navigation.push(page);}*/
              }
        }
    }
    Tab {
        title: "Options"
        Page {
            id: page2
            actions: [
                ActionItem {
                    title: "Edit"
                },
                ActionItem {
                    title: "Save"
                }
            ]
        }
    }
    Tab {
        title: "Help"
        Page {
            id: page3
            actions: [
                ActionItem {
                    title: "Search"
                },
                ActionItem {
                    title: "Browse"
                }
            ]
        }
    }
    attachedObjects: [
        DataSource {
            id: dsStylesService2
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
        }]
    onCreationCompleted: {
        dsStylesService2.load();
    }
}
