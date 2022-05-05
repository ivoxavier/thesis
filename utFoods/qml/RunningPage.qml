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
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import Ubuntu.Components.ListItems 1.3 
import Ubuntu.Components.Popups 1.3
import QtQuick.Controls.Suru 2.2
import QtQuick.LocalStorage 2.12
import Ubuntu.Content 1.3
import "components"
import "../js/SportsTable.js" as SportsTable
import "../js/ThemeColors.js" as ThemeColors

Page{
    id: running_page
    objectName: 'RunningPage'
    header: PageHeader {
        visible: app_settings.is_page_headers_enabled ? true : false
        title: i18n.tr("Running")
        
        StyleHints {
            foregroundColor: "white"
            backgroundColor:  Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_background : ThemeColors.utFoods_dark_theme_background 
        }
    }

    Component{
        id: operation_result
        MessageDialog{msg: i18n.tr("Registed")}
    }

    Rectangle{
        anchors{
            top: app_settings.is_page_headers_enabled ? parent.header.bottom : parent.top
            left : parent.left
            right : parent.right
            bottom : parent.bottom
        }
        color : Suru.theme === 0 ? ThemeColors.utFoods_porcelain_theme_background : ThemeColors.utFoods_dark_theme_background 
    }


    ListView{
        id: slot_shape_view
        
        
        anchors{
            top: app_settings.is_page_headers_enabled ? parent.header.bottom : parent.top
            left: parent.left
            right: parent.right
            bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
        }
        highlightRangeMode: ListView.ApplyRange
        highlightMoveDuration: UbuntuAnimation.SnapDuration

        model:  RunningList{}
     
        delegate: ListItem{  
            divider.visible: false
            ListItemLayout{
                id: slot_layout
                    title.text: name
                    title.font.bold : true
                    subtitle.text: "%1 minutes".arg(duration) 

                    Rectangle{
                        height: units.gu(3.5)
                        width:  height
                        color: "#f1f1f1"
                        radius: height*0.5    
                        Icon{
                            name: "add"
                            anchors.centerIn: parent
                            height: units.gu(2.5)
                        }
                    }

                    UbuntuShape{
                        id: add_meal_image_shape
                        SlotsLayout.position: SlotsLayout.Leading
                        width: units.gu(6)
                        height: width
                        radius: "large"
                        aspect: UbuntuShape.Inset
                        backgroundColor : "#3eb34f"
                        Icon{
                            anchors.centerIn: parent
                            height: units.gu(3.5)
                            color: "white"
                            source: "../assets/running-svgrepo-com.svg"
                        }
                
                    } 
            }
            onClicked: {
                SportsTable.newSport(name,duration)
                root.initDB()
                PopupUtils.open(operation_result)
            }  
        }
    }
    NavigationBar{id: navigation_shape}
}