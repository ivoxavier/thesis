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
import "../js/ControlTheMealDB.js" as ControlTheMealDB
import "../js/DefineMacroNutriensPerDay.js" as DefineMacroNutriensPerDay
import "../js/ControlFoodsNutriscore.js" as ControlFoodsNutriscore
import "../js/IngestionsTable.js" as IngestionsTable

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
    property int query_total_water_cups
    property int query_total_activity_made
    property double query_total_carbo_consumed
    property double query_total_fat_consumed
    property double query_total_protein_consumed

    //stores the amount of days user wants to getback to (re)ingest
    property int amount_of_days_back : 1

    JSONListModel {
        id: theMealDB
        source: app_settings.is_api_themealdb_enabled ? "https://www.themealdb.com/api/json/v1/1/random.php" : " "
        query: "$[*]"
        onJsonChanged: ControlTheMealDB.getRecipe()          
    }

     ListModel{id: filtered_meal_model}
    
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
            GetData.getSportsDone()
            GetData.getCarboConsumed()
            GetData.getFatConsumed()
            GetData.getProteinConsumed()
        }
    }


    //popus a datepicker
    Component{
        id: date_popUP
        DateNavigation{}
    }

    //popus a dialog for adding note
    Component{
        id: add_note_dialog
        AddNoteDialog{}
    }

    //message confirming the ingestion on bottom 
    Component{
        id: operation_sucess
        MessageDialog{
            msg: i18n.tr("Ingestion Saved!")
        }
    }
    

    Flickable {
        id: flickable
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
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
                    Layout.preferredWidth: root.width - units.gu(9)
                    Layout.preferredHeight: units.gu(7)
                    title.text: ControlSlotDashboardPlan.planType(app_settings.plan_type)
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
                    MouseArea{
                        anchors.fill: parent
                        onClicked: PopupUtils.open(add_note_dialog)
                    }
                }

                SlotDashboardIndicators{
                    Layout.preferredWidth: units.gu(13)
                    Layout.preferredHeight: units.gu(5)
                    slot_indicatior: query_total_cal_consumed
                    slot_icon_label: i18n.tr("CONSUMED")
                }
                
            }

            BlankSpace{}

            RowLayout{
                Layout.alignment: Qt.AlignCenter
                spacing: units.gu(1.5)

                SlotNutrientProgress{
                    Layout.preferredWidth: units.gu(13)
                    Layout.preferredHeight: units.gu(5)
                    slot_icon_label: i18n.tr("FAT")
                    bar_color: UbuntuColors.red
                    nutrient_value:  (home_page.query_total_fat_consumed / DefineMacroNutriensPerDay.fat(app_settings.plan_type) * 100.0) * 0.01
                }

                SlotNutrientProgress{
                    Layout.preferredWidth: units.gu(13)
                    Layout.preferredHeight: units.gu(5)
                    slot_icon_label: i18n.tr("CARBO")
                    bar_color: UbuntuColors.blue
                    nutrient_value: (home_page.query_total_carbo_consumed / DefineMacroNutriensPerDay.carbo(app_settings.plan_type) * 100.0) * 0.01
                }


                SlotNutrientProgress{
                    Layout.preferredWidth: units.gu(13)
                    Layout.preferredHeight: units.gu(5)
                    slot_icon_label: i18n.tr("PROTEIN")
                    bar_color: UbuntuColors.green
                    nutrient_value: (home_page.query_total_protein_consumed / DefineMacroNutriensPerDay.protein(app_settings.plan_type) * 100.0) * 0.01
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
                meal_category: 0
                subtitle.text: i18n.tr("%1 calories").arg(home_page.query_total_cal_breakfast)
                img_path:"../assets/logo.svg"
            }  

            SlotAddMeal{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                title.text: i18n.tr("Lunch")
                meal_category: 1
                subtitle.text: i18n.tr("%1 calories").arg(home_page.query_total_cal_lunch)
                img_path:"../assets/logo.svg"
            } 

            SlotAddMeal{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                title.text: i18n.tr("Dinner")
                meal_category: 2
                subtitle.text: i18n.tr("%1 calories").arg(home_page.query_total_cal_dinner)
                img_path:"../assets/logo.svg"
            }

            SlotAddMeal{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                title.text: i18n.tr("Snacks")
                meal_category: 3
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
                water_cups_drinked : (home_page.query_total_water_cups * 0.1)
            }

            BlankSpace{}

            SlotSportTracker{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                img_path:"../assets/logo.svg"
            }

            BlankSpace{}

            SlotRecipe{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(23)
                img_url: root.recipe_img_url
                visible: app_settings.is_api_themealdb_enabled
            } 
            BlankSpace{}  
        }  
    }

    BottomEdge{
        id: bottom_edge
        parent : home_page

        //holds the date for query db
        property var yesterday_formated_date 
        //holds the meal index for query db
        property int meal_filter

        //filter handler
        onMeal_filterChanged : meal_filter == 0 ?
        GetData.getYesterdayBreakfast() : meal_filter == 1 ? 
        GetData.getYesterdayLunch() : meal_filter == 2 ? 
        GetData.getYesterdayDinner() : meal_filter == 3 ?
        GetData.getYesterdaySnacks() : {}

        Component{
            id: meal_filter_dialog
            MealFilterDialog{}
        }

        contentComponent: Page{
            id: bottom_edge_page
        
            height: bottom_edge.height
    
            Item{
                visible: yesterday_foods_list.visible ? false : true
                anchors.centerIn: parent
                height: parent.height / 2
                width: parent.width / 2

                Icon {
                    id: empty_icon
                    anchors.fill: parent
                    name: "empty-symbolic"
                    opacity: 0.75
                }

                Label{
                    anchors.top: empty_icon.bottom
                    anchors.horizontalCenter: empty_icon.horizontalCenter
                    text: i18n.tr("Empty List, Register Ingestions First Or Choose A Filter.")
                    opacity: 0.75
                }
            }
            header: PageHeader{
                title : i18n.tr("Your Previous Ingestions")
                ActionBar{
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    numberOfSlots : 1
                    actions : [
                        Action{
                            iconName : "filters"
                            onTriggered : PopupUtils.open(meal_filter_dialog)
                        }
                    ]
                }
            }

        
            ListView{
                id: yesterday_foods_list

                anchors{
                    top: parent.header.bottom
                    left : parent.left
                    right : parent.right
                    bottom : parent.bottom
                }

                highlightRangeMode: ListView.ApplyRange
                highlightMoveDuration: UbuntuAnimation.SnapDuration
                model : filtered_meal_model
                visible: filtered_meal_model.count == 0 ? false : true
                delegate: ListItem{
                            divider.visible: false
                            ListItemLayout{
                                title.text: name
                                subtitle.text: cal 
                                UbuntuShape{
                                    SlotsLayout.position: SlotsLayout.Leading
                    
                                    height: units.gu(6)
                                    width: height
                                    color: ControlFoodsNutriscore.backgroundColor(score_label.text)
                                    radius: "large"
                                    aspect: UbuntuShape.Inset
                                    Label{
                                        id: score_label
                                        anchors.centerIn: parent
                                        text: nutriscore
                                        textSize: Label.Large
                                        font.capitalization: Font.AllUppercase
                                        color: "white"
                                    }
                                }
                            }

                            leadingActions: ListItemActions{
                                    actions:[
                                        Action{
                                           iconName : "delete" 
                                           onTriggered:{
                                               IngestionsTable.deleteIngestion(id)
                                               filtered_meal_model.remove(index)
                                           }
                                        }
                                    ]
                                }

                            onClicked:{
                                IngestionsTable.saveIngestion(name,
                                nutriscore, cal,
                                fat, carbo,
                                protein, bottom_edge.meal_filter)
                                PopupUtils.open(operation_sucess)
                                root.initDB()
                            }
                        }
            }
        }
    }
        
    Component.onCompleted:{
        GetData.getTotalCalConsumed()
        GetData.getTotalCalRemaining()
        GetData.getBreakfastCalories()
        GetData.getLunchCalories()
        GetData.getDinnerCalories()
        GetData.getSnacksCalories()
        GetData.getTotalFoodsConsumed()
        GetData.getCups()
        GetData.getSportsDone()
        GetData.getCarboConsumed()
        GetData.getFatConsumed()
        GetData.getProteinConsumed()
    }        
}