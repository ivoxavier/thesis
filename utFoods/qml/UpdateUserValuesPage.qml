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


Page{
    id: update_user_values_page
    objectName: 'UpdateUserValuesPage'
    header: PageHeader {
        visible: app_settings.is_page_headers_enabled ? true : false
        title: i18n.tr("Enter new values")
        }

    property bool is_values_view: true

    property bool is_maintain : true 
    property double update_weight
    property int update_height
    property int update_age
    property int sex_at_birth : UserTable.getSexAtBirth()
    property int update_activity_level
    property int update_user_goal
    property string update_type_goal
    property int update_recommended_calories

    Component{
        id: state_updating_dialog
        UpdateUserTableDialog{}
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
            
            spacing: units.gu(2)

            Text{
                text: i18n.tr("Enter new values")
                font.pixelSize: units.gu(4)
                Layout.alignment: Qt.AlignCenter 
                visible: app_settings.is_page_headers_enabled ? false : true   
            }

            RowLayout{
                Layout.alignment: Qt.AlignCenter
                width: parent.width
                visible: app_settings.is_page_headers_enabled ? false : true
                UbuntuShape{
                    Layout.preferredWidth: units.gu(10)
                    Layout.preferredHeight: units.gu(5)
                    radius: "large"
                    aspect: is_values_view ? UbuntuShape.DropShadow : UbuntuShape.Flat

                    Text{
                        anchors.centerIn: parent
                        text: i18n.tr("VALUES")
                        }
                    MouseArea{
                        anchors.fill: parent
                        onClicked :{
                            is_values_view = true
                        }
                    }
                }

                UbuntuShape{
                    Layout.preferredWidth: units.gu(10)
                    Layout.preferredHeight: units.gu(5)
                    radius: "large"
                    aspect: is_values_view ? UbuntuShape.Flat : UbuntuShape.DropShadow

                    Text{
                        anchors.centerIn: parent
                        text: i18n.tr("GOALS")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            is_values_view = false
                        }
                    }
                }   
            }


            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Your new height")
                visible: is_values_view ? true: false
            }

            UbuntuShape{  
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(2)
                Layout.preferredHeight: units.gu(4)
                radius: "large"
                aspect: UbuntuShape.Inset
                visible: is_values_view ? true: false
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
            }

            UbuntuShape{  
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(2)
                Layout.preferredHeight: units.gu(4)
                radius: "large"
                aspect: UbuntuShape.Inset
                visible: is_values_view ? true: false
                TextInput{
                    anchors.fill: parent
                    overwriteMode: true
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: update_user_values_page.update_weight = text 
                }
            }

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Your new age")
                visible: is_values_view ? true: false
            }

            UbuntuShape{  
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(2)
                Layout.preferredHeight: units.gu(4)
                radius: "large"
                aspect: UbuntuShape.Inset
                visible: is_values_view ? true: false
                TextInput{
                    anchors.fill: parent
                    overwriteMode: true
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: update_user_values_page.update_age = text 
                }
            }

            /*GOALS TAB */

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Activity level")
                visible: is_values_view ? false: true
            }

            OptionSelector {
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(28)
                model: [i18n.tr("Very Light"),i18n.tr("Light"),i18n.tr("Moderate"), i18n.tr("High")]
                selectedIndex: -1
                visible: is_values_view ? false: true
                onSelectedIndexChanged: {
                    update_user_values_page.update_activity_level = selectedIndex
                    
                }
            }

            BlankSpace{}

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Goal")
                visible: is_values_view ? false: true
            }

            OptionSelector {
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(26)
                model: [i18n.tr("Loose weight"),i18n.tr("Maintain weight"), i18n.tr("Gain weight")]
                selectedIndex: -1
                visible: is_values_view ? false: true
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
            
            BlankSpace{}

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Goal definition")
                visible: is_values_view ? false: true
            }

            OptionSelector {
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(26)
                enabled: update_user_values_page.is_maintain ? false : true
                model: [i18n.tr("0,5kg by week"),i18n.tr("1kg by week"),i18n.tr("3kg by week"), i18n.tr("4kg by week")]
                selectedIndex: -1
                visible: is_values_view ? false: true
                onSelectedIndexChanged: {
                    update_user_values_page.update_user_goal = selectedIndex == 0 ?
                    DefinePeriod.periodOne() : selectedIndex == 1 ?
                    DefinePeriod.periodTwo() : selectedIndex == 2 ?
                    DefinePeriod.periodThree() : DefinePeriod.periodFour()

                }
            }
            
        }  
    }

    RowAbstractUpdateButton{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
        visible: is_values_view ? false: true
    }


    NavigationBar{id: navigation_shape}
}