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
import "../js/ControlSetPlanSelection.js" as ControlSetPlanSelection
import "../js/ControlSetPlanNextButton.js" as ControlSetPlanNextButton
import "../js/ThemeColors.js" as ThemeColors



Page{
    id: set_plan_page
    objectName: 'SetPlanPage'
    header: PageHeader {
        visible: true
        title: i18n.tr("About You")

        StyleHints {
            foregroundColor: "white"
            backgroundColor:  Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_background : ThemeColors.utFoods_dark_theme_background 
        }

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
     

    //when true this property triggers the dialog propomt user to select how we would like to loose or gain weight
    property bool is_loose_weight: false
    property bool is_gain_weight: false
    
    //enables the next button after user clicking in one slotPlans
    property bool is_plan_choosed: false

    Component{
        id: loose_weight_definition_dialog
        GoalDefinitionDialog{type_of_goal: i18n.tr("loose")}
    }

    Component{
        id: gain_weight_definition_dialog
        GoalDefinitionDialog{type_of_goal: i18n.tr("gain")}
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
                value: 16
            }

            BlankSpace{height:units.gu(2)}

            Text{
                Layout.alignment: Qt.AlignCenter 
                text: i18n.tr("What's Your Goal?")
                font.pixelSize: units.gu(4)  
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
            }

            BlankSpace{height:units.gu(2)}

            SlotPlans{
                id: loose_weight_slot
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                //TRANSLATORS Please Keep All Letters Capital
                text: i18n.tr("LOOSE WEIGHT")
                img_path:"../assets/shoe-svgrepo-com.svg"
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background 
                MouseArea{
                    anchors.fill: parent
                    onClicked: ControlSetPlanSelection.selectPlan(1)
                }
            }

            BlankSpace{}

            SlotPlans{
                id: maintain_weight_slot
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                //TRANSLATORS Please Keep All Letters Capital
                text: i18n.tr("MAINTAIN WEIGHT")
                img_path:"../assets/kilograms-justice-svgrepo-com.svg"
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background 
                MouseArea{
                    anchors.fill: parent
                    onClicked: ControlSetPlanSelection.selectPlan(0) 
                }
            }

            BlankSpace{}

            SlotPlans{
                id: gain_weight_slot
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                //TRANSLATORS Please Keep All Letters Capital
                text: i18n.tr("GAIN WEIGHT")
                img_path:"../assets/dumbbell-gym-svgrepo-com.svg"
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background 
                MouseArea{
                    anchors.fill: parent
                    onClicked: ControlSetPlanSelection.selectPlan(2)   
                }
            }

            BlankSpace{height:units.gu(2)}

            Text{
                Layout.alignment: Qt.AlignCenter  
                text: i18n.tr("You Can Change It Later") + " ????."
                font.pixelSize: units.gu(1.5)
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
            }

            BlankSpace{height:units.gu(5)}

            Button{
                id: next_button
                Layout.alignment: Qt.AlignCenter 
                text: i18n.tr("Next")
                enabled: set_plan_page.is_plan_choosed
                color : UbuntuColors.green
                onClicked: ControlSetPlanNextButton.next()
            }  
        }  
    }    
}