/*
 * 2022  Ivo Fernandes <pg27165@alunos.uminho.pt>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * utFoods is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.9
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2 as QQC2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import Ubuntu.Components.ListItems 1.3 
import Ubuntu.Components.Popups 1.3
import QtQuick.Controls.Suru 2.2
import QtQuick.LocalStorage 2.12
import io.thp.pyotherside 1.5
import "components"



Page{
    id: manage_data_page
    objectName: 'ManageDataPage'
    header: PageHeader {
                visible: app_settings.is_page_headers_enabled ? true : false
                title: i18n.tr("Manage Data")
            }

    //to differentiate from deletion type
    property int delete_type

    Component{
        id: delete_dialog
        RemoveRecordsDialog{msg: delete_type == 0 ? "today" : "all"}
    }

    Component{
        id: delete_month_year_dialog
        DeleteByMonthPop{}
    }

    Component{
        id: delete_all_water
        DeleteAllWaterDialog{}
    }

    Component{
        id: delete_all_sports
        DeleteAllSportsDialog{}
    }

    Component{
        id: delete_all_weight_tracker
        DeleteAllWeightTrackerDialog{}
    }

    Component{
        id: delete_cache
        DeleteCacheDialog{}
    }

   /* Component{
        id: delete_all_notes_dialog
        DeleteAllNotesDialog{}
    }*/

    Component{
        id: operation_result_popover
        OperationResultPopOver{}
    }

    Python{
        id: py
        Component.onCompleted:{
            addImportPath(Qt.resolvedUrl('../py/'))
            importModule('clean_cache', function() {})
        }
        onError: {
            console.log('Python error: ' + traceback);
        }

    }


    Flickable {

        anchors{
            top: app_settings.is_page_headers_enabled ? parent.header.bottom : parent.top
            left: parent.left
            right: parent.right
            bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
        }

        contentWidth: parent.width
        contentHeight: main_column.height  
        
        ColumnLayout{
            id: main_column
            width: root.width

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Manage Data")
                font.pixelSize: units.gu(4)
                font.bold: false
                visible: app_settings.is_page_headers_enabled ? false : true
            }

            ListItem {
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Ingestions")
                }  
            }       

         
            ListItem {
                divider.visible: false
                ListItemLayout{
                    title.text: i18n.tr("Auto Delete Ingestions")
                    subtitle.text: i18n.tr("Deletes All Previous Year Ingestions")

                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        name : "smartwatch-symbolic" 
                        height : units.gu(3.5)
                    }

                    Switch{
                        checked: app_settings.is_auto_cleaning
                        onClicked:  app_settings.is_auto_cleaning = !app_settings.is_auto_cleaning
                    }
                }  
            }

            ListItem {
                divider.visible : false
                ListItemLayout{
                    title.text: i18n.tr("From a Month & Year To Delete")
                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        name : "calendar-app-symbolic"
                        height : units.gu(3.5)
                    }
                    ProgressionSlot{}
                }
                onClicked: {
                    PopupUtils.open(delete_month_year_dialog)
                }
            }

            ListItem {
                divider.visible : false
                ListItemLayout{
                    title.text: i18n.tr("Specific Today's Ingestion")

                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        name : "view-list-symbolic"
                        height : units.gu(3.5)
                    }

                    ProgressionSlot{}
                }
                onClicked: {
                    page_stack.push(delete_today_ingestion_page)
                  
                }
            }

            ListItem {
                divider.visible : false
                ListItemLayout{
                    title.text: i18n.tr("Only Today's Ingestions")


                
                    Button{
                        text: i18n.tr("Delete")
                        color: UbuntuColors.red
                        onClicked:{
                            delete_type = 0
                            PopupUtils.open(delete_dialog)
                        }
                    }   
                }
            }

            ListItem {
                divider.visible : false
                ListItemLayout{
                    title.text: i18n.tr("All Ingestions")

                    Button{
                        text:i18n.tr("Delete")
                        color:UbuntuColors.red
                        onClicked:{
                            delete_type = 1
                            PopupUtils.open(delete_dialog)
                        }   
                    }
                }
            }

            ListItem {
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("User Foods List")
                }  
            } 

            ListItem{
                divider.visible: false
                ListItemLayout{
                        title.text : i18n.tr("User Created Foods List")
                        Icon{
                            SlotsLayout.position: SlotsLayout.Leading
                            name : "x-office-document-symbolic"
                            height : units.gu(3.5)
                        }
                        ProgressionSlot{}
                }

                onClicked: page_stack.push(manager_user_foods_list_page)
            }

            ListItem {
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Water")
                }  
            } 

            
            ListItem {
                divider.visible : false
                ListItemLayout{
                    title.text: i18n.tr("All Water Records")


                    Button{
                        text:i18n.tr("Delete")
                        color:UbuntuColors.red
                        onClicked:{
                            PopupUtils.open(delete_all_water)
                        }   
                    }
                }
            }


            ListItem {
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Notes")
                }  
            } 

            ListItem {
                divider.visible : false
                ListItemLayout{
                    title.text: i18n.tr("Delete All Notes")

                    Button{
                        text:i18n.tr("Delete")
                        color:UbuntuColors.red
                        onClicked:{
                            PopupUtils.open(delete_all_notes_dialog)
                        }   
                    }
                }
            }


            ListItem {
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Weight Tracker")
                }  
            } 

            ListItem {
                divider.visible : false
                ListItemLayout{
                    title.text: i18n.tr("All Records")

                    Button{
                        text:i18n.tr("Delete")
                        color:UbuntuColors.red
                        onClicked:{
                            PopupUtils.open(delete_all_weight_tracker)
                        }   
                    }
                }
            }
            
            ListItem {
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Activity")
                }  
            } 

            ListItem {
                divider.visible : false
                ListItemLayout{
                    title.text: i18n.tr("All Records")

                    Button{
                        text:i18n.tr("Delete")
                        color:UbuntuColors.red
                        onClicked:{
                            PopupUtils.open(delete_all_sports)
                        }   
                    }
                }
            }

            ListItem {
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("System")
                }  
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                        title.text : i18n.tr("Delete App Cache")
                        subtitle.text: i18n.tr("BE CAREFULL WITH THIS!")
                        Icon{
                            SlotsLayout.position: SlotsLayout.Leading
                            name : "application-x-archive-symbolic"
                            height : units.gu(3.5)
                        }
                        Button{
                        text:i18n.tr("Delete")
                        color:UbuntuColors.red
                        onClicked:{
                            PopupUtils.open(delete_cache)
                        }   
                    }
                }
            } 
        }  
    }
    NavigationBar{id:navigation_shape}   
}