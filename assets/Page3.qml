/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2
import bb.data 1.0

Page {
    property alias title : titleBar.setTitle;
    titleBar: MyTitleBar {
        id: titleBar
    }
    Container {
        background: Color.Black
        leftPadding: 10
        topPadding: 30
        rightPadding: 10
        ListView {
            layout: GridListLayout {
                columnCount: 2
                verticalCellSpacing: 30
                horizontalCellSpacing: 30
            }
            id: listViewDemo
            dataModel: GroupDataModel {
                grouping: ItemGrouping.None
            }
            listItemComponents: [
                ListItemComponent {
                    type: "item"
                    ConcertListItem{
                        
                    }
                 /* StandardListItem {
                       //title: ListItemData.okezone.headline.news["title"]
                        //title: ListItemData.displayName
                        title: ListItemData.band
                    }*/
                }
            ]
            onTriggered: {
                var item = dataModel.data(indexPath);
                pageDetail.title = "Detalle"
                pageDetail.band = item.band
                pageDetail.imagen = item.img.toString()
                pageDetail.info = item.info
                navigation.push(pageDetail);
            }
            
           /* function itemType(data, indexPath) {
                return "listItem";
            }*/
        }
   }
    
    attachedObjects: [
        DataSource {
            id: serviceDataSource
            //source: "http://www.ticketmaster.de/browseQueryHandler.php?language=de-de&type=EventQuery&cat=10001&g=Hard%20%26%20Heavy&location=coun_all&rdc_select=ALL"
            //source: "http://api.songkick.com/api/3.0/events.json?apikey=iA8WsWkCgmAUHnl6&location=sk:32911"
            //source: "http://localhost/concert/public/index.php/region/bs_as"
            source: "http://node-w4rlock.rhcloud.com/concert"
            type: DataSourceType.Json
            onDataLoaded: {
                listViewDemo.dataModel.clear();
                listViewDemo.dataModel.insertList(data.conciertos)
            }
            onError: {
                console.log(errorMessage.toString())
            }
        }
    ]
    
    onCreationCompleted: {
        serviceDataSource.load();
    }
}
