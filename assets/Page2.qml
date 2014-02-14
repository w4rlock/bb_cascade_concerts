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
import bb.system 1.2
import org.webimageview 1.0

    Page {
        id: page22
        property  alias title : title.setTitle
        property string evento
        titleBar: MyTitleBar {
            id: title
        }
        Container {
           layout: StackLayout { }
            /*
            WebImageView {
                preferredHeight: 190
                preferredWidth: 150
                url: "http://image.dhgate.com/albu_298795602_00-1.0x0/best-selling-newest-335-classic-jazz-guitar.jpg"
            }
            */
          /*  ListView {
                dataModel: XmlDataModel { source: "music_genre.xml" }
                attachedObjects: [
                    SystemToast {
                        id: myQmlToast
                        body: "Cargando..."
                        onFinished: {
                            var frm2 = secondPageDefinition.createObject()
                            navigationPane.push(frm2);
                           // Application.quit();
                        }
                    }
                ]
                onTriggered: {
                    myQmlToast.show();
                }
            }
*/        
            ListView {
                dataModel: XmlDataModel { source: "music_model.xml" }
               	listItemComponents: [
                    ListItemComponent {
                        type: "item"
                        StandardListItem {
                            imageSource: ListItemData.img
                            title: ListItemData.label
                           //description: qsTr("mi descripcion")
                        }
                    }
                
                ]
                onTriggered: {
                    myQmlToast.show();
                    
                    var item = dataModel.data(indexPath);
                    page22.evento = "http://floating-wave-1462.herokuapp.com/concerto/" + item.val;
                    var page = page3.createObject();
                    page.title = item.label + " Concerts";
                    navigation.push(page);
                }
            }
        } 
        attachedObjects: [
        	ComponentDefinition {
        	    id: page3
            	source: 'Page3.qml' 
            },
        	SystemToast {
                id: myQmlToast
                body: "Cargando..."
                onFinished: {
                }
            }
        ]
    }
