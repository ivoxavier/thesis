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
import QtQuick.Controls.Suru 2.2
import "components"
import "../js/UserTable.js" as UserTable
import "../js/IngestionsTable.js" as IngestionsTable
import "../js/UserFoodsListTable.js" as UserFoodsListTable
import "../js/ControlFoodsNutriscore.js" as ControlFoodsNutriscore
import "../js/ThemeColors.js" as ThemeColors

Page{
    id: quick_addition_page
    objectName: 'QuickAdditionPage'
    header: PageHeader {
                visible: app_settings.is_page_headers_enabled ? true : false
                title : i18n.tr("Quick Addition")

                StyleHints {
                    foregroundColor: "white"
                    backgroundColor:  Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_background : ThemeColors.utFoods_dark_theme_background 
            }
        }

    //receives meal category from HomePage.slotAddMeal
    property int meal_quick_addition_page

    //food detail
    property string product_name_quick_addition_page
    property string nutriscore_quick_addition_page
    property bool is_fruits_vegetables_nuts : false 

    //macros for calculating nutriscore
    property int cal_quick_addition_page
    property double carbo_quick_addition_page : 0.0
    property double fat_quick_addition_page : 0.0
    property double protein_quick_addition_page : 0.0
    property double saturated_fat_quick_addition_page : 0.0
    property double sugars_quick_addition_page : 0.0
    property double salt_quick_addition_page : 0.0
    property double fibre_quick_addition_page : 0.0

    //stores subtotal points of macros
    property int subtotal_negative_points 
    property int subtotal_positive_points
    
    //stores total negative & positive points
    property int total_negative_points : subtotal_negative_points - 40
    property int total_positive_points : subtotal_positive_points - 15

    //stores final score
    property int final_score : total_negative_points - total_positive_points

    //handler to trigger the assignement of grade
    onFinal_scoreChanged : ControlFoodsNutriscore.getGrade(final_score)

    
    //public API
    property alias nutriscore_label : score_label.text 

    //defines active view
    property bool is_details_view : true
   
   
    Component{
        id: sucess_dialog
        StoreIngestionDialog{msg:i18n.tr("Stored!")}
    }

    Component{
        id: error_dialog
        MessageDialog{msg:i18n.tr("Something went wrong. Please, restart the app and try again.")}
    }

    Timer{id: timer;repeat: false}

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
        id: flickable
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
            
            spacing: units.gu(1)

            RowLayout{
                Layout.alignment: Qt.AlignCenter
                width: parent.width
                UbuntuShape{
                    Layout.preferredWidth: units.gu(10)
                    Layout.preferredHeight: units.gu(5)
                    radius: "large"
                    aspect: is_details_view ? UbuntuShape.DropShadow : UbuntuShape.Flat

                    Text{
                        anchors.centerIn: parent
                        text: i18n.tr("DETAILS")
                        }
                    MouseArea{
                        anchors.fill: parent
                        onClicked :{
                            is_details_view = true
                        }
                    }
                }

                UbuntuShape{
                    Layout.preferredWidth: units.gu(10)
                    Layout.preferredHeight: units.gu(5)
                    radius: "large"
                    aspect: is_details_view ? UbuntuShape.Flat : UbuntuShape.DropShadow

                    Text{
                        anchors.centerIn: parent
                        text: i18n.tr("MACROS")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            is_details_view = false
                        }
                    }
                }   
            }

            BlankSpace{}

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Product name")
                visible: is_details_view ? true: false
                font.bold : true
            }

            UbuntuShape{  
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(2)
                Layout.preferredHeight: units.gu(4)
                radius: "large"
                aspect: UbuntuShape.Inset
                visible: is_details_view ? true: false
                TextInput{
                    anchors.fill: parent
                    overwriteMode: true
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    onTextChanged: product_name_quick_addition_page = text
                }
            }

            BlankSpace{}

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Calories")
                visible: is_details_view ? true: false
                font.bold : true
            }
            
            UbuntuShape{  
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(2)
                Layout.preferredHeight: units.gu(4)
                radius: "large"
                aspect: UbuntuShape.Inset
                visible: is_details_view ? true: false
                
                TextInput{
                    anchors.fill: parent
                    overwriteMode: true
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment: TextInput.AlignVCenter
                    inputMethodHints: Qt.ImhDigitsOnly
                    onEditingFinished:{ 
                        cal_quick_addition_page = text
                        ControlFoodsNutriscore.negativePointsEnergy(cal_quick_addition_page)
                    }
                }
            }

            BlankSpace{}

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Is fruits, vegetables, pulses, nuts, walnut and olive oils?")
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                visible: is_details_view ? true: false
                font.bold : true
            }

            CheckBox{
                Layout.alignment: Qt.AlignCenter
                checked: is_fruits_vegetables_nuts
                visible: is_details_view ? true: false
                onCheckedChanged: is_fruits_vegetables_nuts = !is_fruits_vegetables_nuts
            }

            BlankSpace{}

            ListItem{
                divider.visible : false
                visible: is_details_view ? true: false
                ListItemLayout{
                    title.text : i18n.tr("Create An Addition Request")
                    title.font.bold : true
                    subtitle.text : i18n.tr("utFoods Community Foods")
                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        name : "webbrowser-app-symbolic" 
                        height : units.gu(3.5)
                    }
                    ProgressionSlot{}
                }
                onClicked: page_stack.push(create_request_page)
            }


          
            /*MACROS TAB*/

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Fat/100g")
                visible: is_details_view ? false: true
                font.bold : true
            }

            Text{
                Layout.alignment: Qt.AlignCenter
                text: fat_quick_addition_page
                visible: is_details_view ? false: true
            }

            UbuntuShape{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(30)
                Layout.preferredHeight: units.gu(3)
                radius: "large"
                aspect: UbuntuShape.DropShadow
                visible: is_details_view ? false: true
                backgroundColor : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background
                NutrientSlider{
                        id: fat_slider
                        anchors.centerIn: parent
                        width: parent.width
                        onPressedChanged: fat_quick_addition_page = ControlFoodsNutriscore.roundToOneDecimal(value) 
                }
            }

            BlankSpace{}

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Protein/100g")
                visible: is_details_view ? false: true
                font.bold : true
            }

            Text{
                Layout.alignment: Qt.AlignCenter
                text: protein_quick_addition_page
                visible: is_details_view ? false: true
            }

            UbuntuShape{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(30)
                Layout.preferredHeight: units.gu(3)
                radius: "large"
                aspect: UbuntuShape.DropShadow
                visible: is_details_view ? false: true
                backgroundColor : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background
                NutrientSlider{
                        anchors.centerIn: parent
                        width: parent.width
                        onPressedChanged : {
                            protein_quick_addition_page = ControlFoodsNutriscore.roundToOneDecimal(value)
                            ControlFoodsNutriscore.positivePointsProtein(value)
                        }    
                    }
            }

            BlankSpace{}

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Carbo/100g")
                visible: is_details_view ? false: true
                font.bold : true
            }

            Text{
                Layout.alignment: Qt.AlignCenter
                text: carbo_quick_addition_page
                visible: is_details_view ? false: true
            }

            UbuntuShape{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(30)
                Layout.preferredHeight: units.gu(3)
                radius: "large"
                aspect: UbuntuShape.DropShadow
                visible: is_details_view ? false: true
                backgroundColor : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background
                NutrientSlider{
                        anchors.centerIn: parent
                        width: parent.width
                        onPressedChanged : carbo_quick_addition_page = ControlFoodsNutriscore.roundToOneDecimal(value)
                    }
            }

            BlankSpace{}

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Saturated/100g")
                visible: is_details_view ? false: true
                font.bold : true
            }

            Text{
                Layout.alignment: Qt.AlignCenter
                text: saturated_fat_quick_addition_page
                visible: is_details_view ? false: true
            }

            UbuntuShape{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(30)
                Layout.preferredHeight: units.gu(3)
                radius: "large"
                aspect: UbuntuShape.DropShadow
                visible: is_details_view ? false: true
                backgroundColor : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background
                NutrientSlider{
                        anchors.centerIn: parent
                        width: parent.width
                        onPressedChanged:{
                            saturated_fat_quick_addition_page = ControlFoodsNutriscore.roundToOneDecimal(value)
                            ControlFoodsNutriscore.negativePointsSaturatedFat(saturated_fat_quick_addition_page)
                        }   
                    }
            }

            BlankSpace{}

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Sugars/100g")
                visible: is_details_view ? false: true
                font.bold : true
            }

            Text{
                Layout.alignment: Qt.AlignCenter
                text: sugars_quick_addition_page
                visible: is_details_view ? false: true
            }

            UbuntuShape{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(30)
                Layout.preferredHeight: units.gu(3)
                radius: "large"
                aspect: UbuntuShape.DropShadow
                visible: is_details_view ? false: true
                backgroundColor : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background
                NutrientSlider{
                        anchors.centerIn: parent
                        width: parent.width
                        onPressedChanged: {
                            sugars_quick_addition_page = ControlFoodsNutriscore.roundToOneDecimal(value)
                            ControlFoodsNutriscore.negativePointsSugars(sugars_quick_addition_page)
                        }
                    }
            }

            BlankSpace{}

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Salt/100g")
                visible: is_details_view ? false: true
                font.bold : true
            }

            Text{
                Layout.alignment: Qt.AlignCenter
                text: salt_quick_addition_page
                visible: is_details_view ? false: true
            }

            UbuntuShape{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(30)
                Layout.preferredHeight: units.gu(3)
                radius: "large"
                aspect: UbuntuShape.DropShadow
                visible: is_details_view ? false: true
                backgroundColor : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background
                NutrientSlider{
                        anchors.centerIn: parent
                        width: parent.width     
                        onPressedChanged: {
                            salt_quick_addition_page = ControlFoodsNutriscore.roundToOneDecimal(value)
                            ControlFoodsNutriscore.negativePointsSodium(salt_quick_addition_page)
                        }
                    }
            }

            BlankSpace{}

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Fibre/100g")
                visible: is_details_view ? false: true
                font.bold : true
            }

            Text{
                Layout.alignment: Qt.AlignCenter
                text: fibre_quick_addition_page
                visible: is_details_view ? false: true
            }

            UbuntuShape{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(30)
                Layout.preferredHeight: units.gu(3)
                radius: "large"
                aspect: UbuntuShape.DropShadow
                visible: is_details_view ? false: true
                backgroundColor : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_slot_background : ThemeColors.utFoods_dark_theme_slot_background
                NutrientSlider{
                        anchors.centerIn: parent
                        width: parent.width
                        onPressedChanged: {
                            fibre_quick_addition_page = ControlFoodsNutriscore.roundToOneDecimal(value)
                            ControlFoodsNutriscore.positivePointsFiber(fibre_quick_addition_page)
                        }   
                    }
            }

            ListItem{
                ListItemLayout{
                    subtitle.text : i18n.tr("Aproximated Nutriscore")
                    subtitle.font.bold : true
                }
            }

            UbuntuShape{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: units.gu(9)
                Layout.preferredHeight: units.gu(9)
                radius: "large"
                aspect: UbuntuShape.Inset
                color: ControlFoodsNutriscore.backgroundColor(nutriscore_quick_addition_page)
                visible: is_details_view ? false: true

                Label{
                    id: score_label
                    anchors.centerIn: parent
                    textSize: Label.Large
                    font.capitalization: Font.AllUppercase
                    color: "white"
                }
            }           
        }  
    }
    RowAbstractConfirmButton{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
    }
    NavigationBar{id: navigation_shape}
}