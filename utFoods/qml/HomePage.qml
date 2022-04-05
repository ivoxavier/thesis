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
import "../js/ControlIconUpAnimation.js" as ControlIconUpAnimation
import "../js/GetData.js" as GetData
import "../js/ControlSlotDashboardPlan.js" as ControlSlotDashboardPlan

Page{
    id: home_page
    objectName: 'HomePage'
    header: PageHeader {visible:false}
    
    // stores the query output
    property int query_total_cal_consumed 
    property int query_total_cal_remaining
    property int query_total_cal_breakfast
    property int query_total_cal_lunch
    property int query_total_cal_dinner
    property int query_total_cal_snacks
    property int query_total_foods_consumed

    //WaterCups
    property int total_water_cups
    
    //this component is need to initializate the db. It's linked to main view so it runs everytime the iniDB signal is emitted
    //without it the dashboard will not update untill a close and opening the app again
    Connections{
        target: root
        onInitDB:{
            GetData.getTotalCalConsumed()
            GetData.getTotalCalRemaining()
            GetData.getBreakfastCalories()
            GetData.getLunchCalories()
            GetData.getDinnerCalories()
            GetData.getSnacksCalories()
            GetData.getTotalFoodsConsumed()
            GetData.getCups()
        }
    }


    //popus a datepicker
    Component{
        id: date_popUP
        DateNavigation{}
    }

    Flickable {
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: footer_shape.top
        }
        contentWidth: parent.width
        contentHeight: main_column.height
            
        ColumnLayout{
            id: main_column
            width: root.width

            RowLayout{
                Layout.alignment: Qt.AlignCenter
                width: parent.width
                spacing: units.gu(2)

                SlotDashboardPlan{
                    id: male_slot
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: units.gu(22)
                    Layout.preferredHeight: units.gu(7)
                    text: ControlSlotDashboardPlan.planType(app_settings.plan_type)
                    img_path:"../assets/logo.svg"
                }
            }

            BlankSpace{}

            CaloriesCircleChart{Layout.alignment: Qt.AlignCenter}

            BlankSpace{}

            RowLayout{
                Layout.alignment: Qt.AlignCenter
                width: parent.width
                spacing: units.gu(1.5)

                SlotDashboardIndicators{
                    Layout.preferredWidth: units.gu(13)
                    Layout.preferredHeight: units.gu(5)
                    slot_indicatior: query_total_foods_consumed
                    slot_icon_label: i18n.tr("FOODS")
                }


                SlotDashboardIcons{
                    Layout.preferredWidth: units.gu(13)
                    Layout.preferredHeight: units.gu(5)
                    slot_icon : "attachment"
                }

                SlotDashboardIndicators{
                    Layout.preferredWidth: units.gu(13)
                    Layout.preferredHeight: units.gu(5)
                    slot_indicatior: query_total_cal_consumed
                    slot_icon_label: i18n.tr("CONSUMED")
                }
                
            }
            
            BlankSpace{height:units.gu(2)}

            RowLayout{
                Layout.alignment: Qt.AlignCenter
                spacing: units.gu(1)
                Icon{id:calendar_icon;Layout.alignment: Qt.AlignVCenter;name:"calendar";height: units.gu(2.5)}

                Label {
                    id: dateLabel
                    Layout.alignment: Qt.AlignVCenter
                    text: root.stringDate
                    font.pixelSize: units.gu(2)
                }

                Icon{
                    id: icon_down
                    Layout.alignment: Qt.AlignVCenter
                    property bool is_clicked : false
                    name: "go-up"
                    height: units.gu(4)
                    rotation: icon_down.is_clicked ? 180 : 0
                    Behavior on rotation {
                        UbuntuNumberAnimation {}
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: ControlIconUpAnimation.animate()
                    }
                }
            }
            
            BlankSpace{}

            SlotAddMeal{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                title.text: i18n.tr("Breakfast")
                meal_category: 1
                subtitle.text: i18n.tr("%1 calories").arg(home_page.query_total_cal_breakfast)
                img_path:"../assets/logo.svg"
            }  

            SlotAddMeal{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                title.text: i18n.tr("Lunch")
                meal_category: 2
                subtitle.text: i18n.tr("%1 calories").arg(home_page.query_total_cal_lunch)
                img_path:"../assets/logo.svg"
            } 

            SlotAddMeal{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                title.text: i18n.tr("Dinner")
                meal_category: 3
                subtitle.text: i18n.tr("%1 calories").arg(home_page.query_total_cal_dinner)
                img_path:"../assets/logo.svg"
            }

            SlotAddMeal{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                title.text: i18n.tr("Snacks")
                meal_category: 4
                subtitle.text: i18n.tr("%1 calories").arg(home_page.query_total_cal_snacks)
                img_path:"../assets/logo.svg"
            }

            BlankSpace{}

            SlotWaterTracker{
                id: slot_water
                
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                img_path:"../assets/logo.svg"
                water_cups_drinked : (home_page.total_water_cups * 0.1)
            }


        }  
    }

    FooterBar{id: footer_shape}
        
    Component.onCompleted:{
        GetData.getTotalCalConsumed()
        GetData.getTotalCalRemaining()
        GetData.getBreakfastCalories()
        GetData.getLunchCalories()
        GetData.getDinnerCalories()
        GetData.getSnacksCalories()
        GetData.getTotalFoodsConsumed()
        GetData.getCups()
    }        
}