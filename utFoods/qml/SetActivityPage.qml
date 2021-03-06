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
import "components"
import "../js/ControlSetActivitySelection.js" as ControlSetActivitySelection
import "../js/ThemeColors.js" as ThemeColors

Page{
    id: set_activity_page
    objectName: 'SetActivityPage'
    header: PageHeader {
                visible: true
                title: i18n.tr("About You")

                StyleHints {
                    foregroundColor: "white"
                    backgroundColor:  Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_background : ThemeColors.utFoods_dark_theme_background 
                }

                ActionBar {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter

                    StyleHints {
                        foregroundColor: "white"
                        backgroundColor:  Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_background : ThemeColors.utFoods_dark_theme_background 
                    }

                    numberOfSlots: 1
                    actions:[  Action{
                            iconName: "help"
                            text: i18n.tr("Help")
                            onTriggered: PopupUtils.open(help_dialog) 
                        }
                    ]
                }
            }
    //enables the next button after user clicking in one slotActivity
    property bool is_activity_choosed: false

    Component{
        id: help_dialog
        MessageDialog{msg: i18n.tr("Very Light Include: Driving, Typing, Sewing, Ironing, Cooking.\n\nLight Include: Walking 5 km, House Cleaning, Golf.\n\nModerate Include: Walking 6 km, Dancing, Tennis, Cycling.\n\nHeavy Include: Running, Soccer, Basketball, Football.")}
    }

    Rectangle{
        anchors{
            top: parent.header.bottom
            left : parent.left
            right : parent.right
            bottom : parent.bottom
        }
        color : Suru.theme === 0 ? ThemeColors.utFoods_porcelain_theme_background : ThemeColors.utFoods_dark_theme_background 
    }
    
    Flickable {
        anchors{
            top: parent.header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        contentWidth: parent.width
        contentHeight: main_column.height  

        interactive : root.height > root.width ? false : true
        
        ColumnLayout{
            id: main_column
            width: root.width

            CompletationBar{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                value: 32
            }

            BlankSpace{height:units.gu(2)}

            Text{
                Layout.alignment: Qt.AlignCenter 
                text: i18n.tr("Your Level Of Activity?")
                font.pixelSize: units.gu(4)  
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
            }

            BlankSpace{height:units.gu(2)}
            
            SlotActivity{
                id: very_light_slot
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                //TRANSLATORS Please Keep All Letters Capital
                text: i18n.tr("VERY LIGHT")
                img_path:"../assets/cooking-stew-svgrepo-com.svg"
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background 
                MouseArea{
                    anchors.fill: parent
                    onClicked: ControlSetActivitySelection.selectActivity(0)   
                }
            }

            BlankSpace{}

            SlotActivity{
                id: light_slot
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                //TRANSLATORS Please Keep All Letters Capital
                text: i18n.tr("LIGHT")
                img_path:"../assets/walking-the-dog-svgrepo-com.svg"
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background 
                MouseArea{
                    anchors.fill: parent
                    onClicked: ControlSetActivitySelection.selectActivity(1)
                }
            }

            BlankSpace{}

            SlotActivity{
                id: moderate_slot
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                //TRANSLATORS Please Keep All Letters Capital
                text: i18n.tr("MODERATE")
                img_path:"../assets/cycling-color-svgrepo-com.svg"
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background 
                MouseArea{
                    anchors.fill: parent
                    onClicked: ControlSetActivitySelection.selectActivity(2)   
                }
            }

            BlankSpace{}

            SlotActivity{
                id: heavy_slot
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                //TRANSLATORS Please Keep All Letters Capital
                text: i18n.tr("HEAVY")
                img_path:"../assets/soccer-svgrepo-com.svg"
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background 
                MouseArea{
                    anchors.fill: parent
                    onClicked: ControlSetActivitySelection.selectActivity(3) 
                }
            }

            BlankSpace{height:units.gu(2)}

            Text{
                Layout.alignment: Qt.AlignCenter  
                text: i18n.tr("You Can Change It Later") + " ????."
                font.pixelSize: units.gu(1.5)
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
            }

            BlankSpace{height:units.gu(2)}

            Button{
                id: next_button
                Layout.alignment: Qt.AlignCenter  
                text: i18n.tr("Next")
                enabled: set_activity_page.is_activity_choosed
                color : UbuntuColors.green
                onClicked:{
                    page_stack.push(set_sex_at_birth_page)
                }    
            }   
        }  
    }    
}