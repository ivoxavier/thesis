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
import QtQuick.LocalStorage 2.12
import "components"



Page{
    id: sports_page
    objectName: 'SportsPage'
    header: PageHeader {
        visible: app_settings.is_page_headers_enabled ? true : false
        title: i18n.tr("Sports")
        }
    
    Flickable {

        anchors{
            top: app_settings.is_page_headers_enabled ? parent.header.bottom : parent.top
            left: parent.left
            right: parent.right
            bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
        }

        contentWidth: parent.width
        contentHeight: (sports_grid.height - navigation_shape.height)
        
            Item{
                id: container 
                anchors.fill: parent

                property int number_columns: root.height > root.width ? 2 : 5;
                property int number_rows: root.height > root.width ? 5 : 2;

                property int slot_size: Math.min (root.width / number_columns, root.height / number_rows) * 0.8;
                property int slot_x_spacing: (root.width - slot_size * number_columns) / (number_columns + 1);
                property int slot_y_spacing: (root.height - slot_size * number_rows) / (number_rows + 1);


            GridLayout{
                id: sports_grid
                x: container.slot_x_spacing;
                y: container.slot_y_spacing;
                columns: container.number_columns;
                rows: container.number_rows;
                columnSpacing: container.slot_x_spacing;
                rowSpacing: container.slot_y_spacing;
            
                SlotSportType{
                    id: running_slot
                    Layout.topMargin: units.gu(1)
                    Layout.preferredWidth: container.slot_size;
                    Layout.preferredHeight: container.slot_size;
                    //color:
                    sport_description: i18n.tr("Running")
                    img_path: "../assets/running-svgrepo-com.svg"
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            running_slot.scale = 0.8
                        }
                        onReleased:{
                            running_slot.scale = 1
                            progression : true
                            page_stack.push(running_page)
                        }
                    }

                }                   

                SlotSportType{
                    id: cycling_slot
                    Layout.topMargin: units.gu(1)
                    Layout.preferredWidth: container.slot_size;
                    Layout.preferredHeight: container.slot_size;
                    //color:
                    sport_description: i18n.tr("Cycling")
                    img_path: "../assets/cycling-svgrepo-com.svg"
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            cycling_slot.scale = 0.8
                            
                        }
                        onReleased:{
                            cycling_slot.scale = 1
                            progression : true
                            page_stack.push(cycling_page)

                        }
                    }
                }

                SlotSportType{
                    id: walking_slot
                    Layout.topMargin: units.gu(1)
                    Layout.preferredWidth: container.slot_size;
                    Layout.preferredHeight: container.slot_size;
                    //color:
                    sport_description: i18n.tr("Walking")
                    img_path: "../assets/walking-svgrepo-com.svg"
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            walking_slot.scale = 0.8
                        }
                        onReleased:{
                            walking_slot.scale = 1
                            progression : true
                            page_stack.push(walking_page)
                        }
                    }
                }

                SlotSportType{
                    id: gym_slot
                    Layout.topMargin: units.gu(1)
                    Layout.preferredWidth: container.slot_size;
                    Layout.preferredHeight: container.slot_size;
                    //color:
                    sport_description: i18n.tr("Gym")
                    img_path: "../assets/gym-svgrepo-com.svg"
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            gym_slot.scale = 0.8
                        }
                        onReleased:{
                            gym_slot.scale = 1
                            progression : true
                            page_stack.push(gym_page)
                        }
                    }
                }

                SlotSportType{
                    id: group_sports_slot
                    Layout.topMargin: units.gu(1)
                    Layout.preferredWidth: container.slot_size;
                    Layout.preferredHeight: container.slot_size;
                    //color:
                    sport_description: i18n.tr("Group")
                    img_path: "../assets/people-svgrepo-com.svg"
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            group_sports_slot.scale = 0.8
                        }
                        onReleased:{
                            group_sports_slot.scale = 1
                            progression : true
                            page_stack.push(group_sports_page)
                        }
                    }
                }

                SlotSportType{
                    id: swimming_slot
                    Layout.topMargin: units.gu(1)
                    Layout.preferredWidth: container.slot_size;
                    Layout.preferredHeight: container.slot_size;
                    //color:
                    sport_description: i18n.tr("Swimming")
                    img_path: "../assets/swimming-svgrepo-com.svg"
                    MouseArea{
                        anchors.fill: parent
                        onPressed:{
                            swimming_slot.scale = 0.8
                        }
                        onReleased:{
                            swimming_slot.scale = 1
                            progression : true
                            page_stack.push(swimming_page)
                        }
                    }
                }
            }
        }  
    }
    NavigationBar{id:navigation_shape} 
}