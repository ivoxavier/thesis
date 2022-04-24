/*
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
import QtCharts 2.3
import QtQuick.Controls.Suru 2.2
import QtQuick.LocalStorage 2.12
import Ubuntu.Content 1.3
import "components"
import "../js/UserTable.js" as UserTable
import "../js/UpdateUserTable.js" as UpdateUserTable
import "../js/RecommendedCalories.js" as RecommendedCalories
import "../js/DefineGoalCalories.js" as DefinePeriod
import "../js/ThemeColors.js" as ThemeColors


Page{
    id: update_user_values_page
    objectName: 'UpdateUserValuesPage'
    header: PageHeader {
        visible: app_settings.is_page_headers_enabled ? true : false
        title: i18n.tr("Enter new values")
        StyleHints {
            foregroundColor: "white"
            backgroundColor:  Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_background : ThemeColors.utFoods_dark_theme_background 
        }
    }

    property bool is_values_view: true
    property bool is_blood_pressure_view : false
    property bool is_goal_view : false

    property bool is_maintain : true 
    property double update_weight
    property int update_height
    property int update_age
    property int sex_at_birth : UserTable.getSexAtBirth()
    property int update_activity_level
    property int update_user_goal
    property string update_type_goal
    property int update_recommended_calories

    property int update_ap_hi //systolic
    property int update_ap_lo //diastolic

    Component{
        id: state_updating_dialog
        UpdateUserTableDialog{}
    }

    Component{
        id: state_updating_blood_pressure_dialog
        UpdateUserBloodPressureDialog{}
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
    
    Flickable {

        anchors{
            top: app_settings.is_page_headers_enabled ? parent.header.bottom : parent.top
            left: parent.left
            right: parent.right
            bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
        }

        contentWidth: parent.width
        contentHeight: main_column.height  

        interactive : root.height > root.width ? false : true
        
        ColumnLayout{
            id: main_column
            width: root.width
            
            spacing: units.gu(2)


            RowLayout{
                Layout.alignment: Qt.AlignCenter
                width: parent.width
                visible: app_settings.is_page_headers_enabled ? false : true
                UbuntuShape{
                    Layout.preferredWidth: units.gu(14)
                    Layout.preferredHeight: units.gu(5)
                    radius: "large"
                    aspect: is_values_view ? UbuntuShape.DropShadow : UbuntuShape.Flat
                    Text{
                        anchors.centerIn: parent
                        text: i18n.tr("VALUES")
                        color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked :{
                            is_values_view = true
                            is_blood_pressure_view = false
                            is_goal_view = false
                        }
                    }
                }

                UbuntuShape{
                    Layout.preferredWidth: units.gu(14)
                    Layout.preferredHeight: units.gu(5)
                    radius: "large"
                    aspect: is_goal_view ? UbuntuShape.DropShadow : UbuntuShape.Flat
                    Text{
                        anchors.centerIn: parent
                        text: i18n.tr("GOALS")
                        color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            is_values_view = false
                            is_blood_pressure_view = false
                            is_goal_view = true
                        }
                    }
                } 

                UbuntuShape{
                    Layout.preferredWidth: units.gu(14)
                    Layout.preferredHeight: units.gu(5)
                    radius: "large"
                    aspect: is_blood_pressure_view ? UbuntuShape.DropShadow : UbuntuShape.Flat
                    Text{
                        anchors.centerIn: parent
                        text: i18n.tr("TENSION")
                        color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            is_values_view = false
                            is_blood_pressure_view = true
                            is_goal_view = false
                        }
                    }
                }   
            }

            /*VALUES TAB */

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Your new height")
                visible: is_values_view ? true: false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                font.bold : true
            }

            UbuntuShape{  
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(2)
                Layout.preferredHeight: units.gu(4)
                radius: "large"
                aspect: UbuntuShape.Inset
                visible: is_values_view ? true: false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background 
                TextInput{
                    anchors.fill: parent
                    overwriteMode: true
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: update_user_values_page.update_height = text 
                }
            }

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Your new weight")
                visible: is_values_view ? true: false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                font.bold : true
            }

            UbuntuShape{  
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(2)
                Layout.preferredHeight: units.gu(4)
                radius: "large"
                aspect: UbuntuShape.Inset
                visible: is_values_view ? true: false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background 
                TextInput{
                    anchors.fill: parent
                    overwriteMode: true
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                    onTextChanged: update_user_values_page.update_weight = text 
                }
            }

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Your new age")
                visible: is_values_view ? true: false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                font.bold : true
            }

            UbuntuShape{  
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(2)
                Layout.preferredHeight: units.gu(4)
                radius: "large"
                aspect: UbuntuShape.Inset
                visible: is_values_view ? true: false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background 
                TextInput{
                    anchors.fill: parent
                    overwriteMode: true
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                    onTextChanged: update_user_values_page.update_age = text 
                }
            }

            /*GOALS TAB */

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Activity level")
                visible: is_goal_view ? true : false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                font.bold : true
            }

            OptionSelector {
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(28)
                model: [i18n.tr("Very Light"),i18n.tr("Light"),i18n.tr("Moderate"), i18n.tr("High")]
                selectedIndex: -1
                visible: is_goal_view ? true : false
                onSelectedIndexChanged: {
                    update_user_values_page.update_activity_level = selectedIndex
                    
                }
            }

           

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Goal")
                visible: is_goal_view ? true : false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                font.bold : true
            }

            OptionSelector {
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(26)
                model: [i18n.tr("Loose weight"),i18n.tr("Maintain weight"), i18n.tr("Gain weight")]
                selectedIndex: -1
                visible: is_goal_view ? true : false
                onSelectedIndexChanged: {
                    if(selectedIndex == -1){
                        update_user_values_page.is_maintain = true
                    } else if(selectedIndex == 0) {
                        update_user_values_page.update_type_goal = "loose"
                        update_user_values_page.is_maintain = false
                    } else{
                        update_user_values_page.update_type_goal = "gain"
                        update_user_values_page.is_maintain = false
                    }
                    
                }
            }
            
           

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Goal definition")
                visible: is_goal_view ? true : false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                font.bold : true
            }

            OptionSelector {
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(26)
                enabled: update_user_values_page.is_maintain ? false : true
                model: [i18n.tr("0,5kg by week"),i18n.tr("1kg by week"),i18n.tr("3kg by week"), i18n.tr("4kg by week")]
                selectedIndex: -1
                visible: is_goal_view ? true : false
                onSelectedIndexChanged: {
                    update_user_values_page.update_user_goal = selectedIndex == 0 ?
                    DefinePeriod.periodOne() : selectedIndex == 1 ?
                    DefinePeriod.periodTwo() : selectedIndex == 2 ?
                    DefinePeriod.periodThree() : DefinePeriod.periodFour()

                }
            }

            /*BLOOD PRESSURE TAB*/

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Your Systolic Presure (High Pressure)")
                visible: is_blood_pressure_view ? true: false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                font.bold : true
            }

            UbuntuShape{  
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(2)
                Layout.preferredHeight: units.gu(4)
                radius: "large"
                aspect: UbuntuShape.Inset
                visible: is_blood_pressure_view ? true: false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background 
                TextInput{
                    anchors.fill: parent
                    overwriteMode: true
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                    onTextChanged: update_user_values_page.update_ap_hi = text 
                }
            }

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Your Diastolic Presure (Low Pressure)")
                visible: is_blood_pressure_view ? true: false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                font.bold : true
            }

            UbuntuShape{  
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(2)
                Layout.preferredHeight: units.gu(4)
                radius: "large"
                aspect: UbuntuShape.Inset
                visible: is_blood_pressure_view ? true: false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background 
                TextInput{
                    anchors.fill: parent
                    overwriteMode: true
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                    onTextChanged: update_user_values_page.update_ap_lo = text 
                }
            }
            
        }  
    }

    RowAbstractUpdateButton{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
        visible: is_goal_view ? true : false
    }

    RowAbstractUpdateBloodPressureButton{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
        visible: is_blood_pressure_view ? true : false
    }


    NavigationBar{
        id: navigation_shape
        backgroundColor : Suru.theme === 0 ? ThemeColors.utFoods_porcelain_theme_background : ThemeColors.utFoods_dark_theme_background 
    }
}