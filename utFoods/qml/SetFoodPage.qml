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
import Ubuntu.Components.Pickers 1.3
import "components"
import "../js/Chart.js" as Charts
import "../js/QChartJsTypes.js" as ChartTypes
import "../js/UserTable.js" as UserTable
import "../js/IngestionsTable.js" as IngestionsTable
import "../js/ThemeColors.js" as ThemeColors


Page{
    id: set_food_page
    objectName: 'SetFoodPage'
    header: PageHeader {
                visible: app_settings.is_page_headers_enabled ? true : false
                title: i18n.tr("Set Your Ingestion")
                StyleHints {
                    foregroundColor: "white"
                    backgroundColor:  Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_background : ThemeColors.utFoods_dark_theme_background 
            }
        }

    //receives values from foods from QuickFoodsList{}
    property string product_name_set_food_page
    property string nutriscore_set_food_page
    property int cal_set_food_page
    property double carbo_set_food_page
    property double fat_set_food_page
    property double protein_set_food_page
    property int meal_set_food_page

    //store quantity and portions
    property int quantity_portions : 1
    property double size_portions : 1

    //cal and nutriens ingested
    property int cal_ingested : Math.round(cal_set_food_page * quantity_portions) * size_portions
    property double carbo_ingested : Math.round((carbo_set_food_page * quantity_portions) * size_portions * 10) / 10
    property double fat_ingested : Math.round((fat_set_food_page * quantity_portions) * size_portions * 10) / 10
    property double protein_ingested : Math.round((protein_set_food_page * quantity_portions) * size_portions * 10) / 10
    
    function getChartPieValues(){
        var ChartPieData = [
            {
                value: fat_ingested,
                color: "#F7464A",
                highlight: "#FF5A5E",
                label: i18n.tr("Fat/100g")
            },
            {
                value: protein_ingested,
                color: "#46BFBD",
                highlight: "#5AD3D1",
                label: i18n.tr("Protein/100g")
            },
            {
                value: carbo_ingested,
                color: "#949FB1",
                highlight:"#A8B3C5",
                label: i18n.tr("Carbo/100g")
            }
        ]
        return ChartPieData
    }
    

    Component{
        id: sucess_dialog
        StoreIngestionDialog{msg:i18n.tr("Stored!")}
    }

    Component{
        id: error_dialog
        MessageDialog{msg:i18n.tr("Something went wrong. Please, restart the app and try again.")}
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
        
        ColumnLayout{
            id: main_column
            width: root.width
            
            spacing: units.gu(1)

            Text{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width
                text: set_food_page.product_name_set_food_page
                font.pixelSize: units.gu(4)
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
            }

            Text{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width
                text: i18n.tr("Calories: ") + cal_ingested
                font.pixelSize: units.gu(3)
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text
            }


            BlankSpace{}

            Grid {
                id:chart_pie_wrapper
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(6)
                Layout.preferredHeight:  units.gu(17)
                visible: true
                columns:1
                columnSpacing: units.gu(1)

                QChartJs {
                    id: chart_pie
                    width: parent.width
                    height: parent.height
                    chartType: ChartTypes.QChartJSTypes.PIE
                    chartData: getChartPieValues()
                    animation: app_settings.is_graphs_animation_enabled
                    chartAnimationEasing: Easing.InOutElastic;
                    chartAnimationDuration: 2000;
                }

            }
            BlankSpace{}

            ListItem{
                divider.visible: false
                ListItemLayout{
                    title.text: i18n.tr("Quantity")
                    title.font.bold : true
                    QuantitySpinner{
                        Layout.preferredWidth: root.width - units.gu(13)
                        height: units.gu(4)
                        value : 1
                        onValueChanged: quantity_portions = value    
                    }

                }
            }

            ListItem{
                divider.visible: false
                Layout.preferredHeight: units.gu(9)
                ListItemLayout{
                    title.text: i18n.tr("Size portion")
                    title.font.bold : true
                    SizePicker{
                        Layout.preferredWidth: root.width - units.gu(9)
                        height: units.gu(8)
                        onSelectedIndexChanged: {
                           selectedIndex == 0 ?
                            size_portions = 1 : selectedIndex == 1 ?
                            size_portions = 0.50 : selectedIndex == 2 ?
                            size_portions = 0.33 : selectedIndex == 3 ?
                            size_portions = 0.25 : selectedIndex == 4 ?
                            size_portions = 0.20 : size_portions = 0.17
                        }
                    }
                }
            }

            ListItem{
                divider.visible : false
                ListItemLayout{
                    subtitle.text : i18n.tr("Macros") 
                    subtitle.font.bold : true
                }
            }
            
            ListItem{
                divider.visible : false
                ListItemLayout{
                    title.text: i18n.tr("Fat: %1gr").arg(fat_ingested)
                    title.font.bold : true
                    NutrientIcon{img_path: "../assets/logo.svg"} 
                }
            }
            ListItem{
                divider.visible : false
                ListItemLayout{
                    title.text: i18n.tr("Protein: %1gr").arg(protein_ingested)
                    title.font.bold : true
                    NutrientIcon{img_path: "../assets/logo.svg"}      
                }
            }
            ListItem{
                divider.visible : false
                
                ListItemLayout{
                    title.text: i18n.tr("Carbohydrates: %1gr").arg(carbo_ingested)
                    title.font.bold : true
                    NutrientIcon{img_path: "../assets/logo.svg"}    
                }
            }
        }  
    }

    Row{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: navigation_shape.top
        width: root.width
        layoutDirection: Qt.RightToLeft 
        rightPadding: units.gu(1)
        bottomPadding: units.gu(1)
        IconButton{
            icon_name : "ok"
            MouseArea{
                
                anchors.fill: parent
                onClicked:{
                    try{
                        IngestionsTable.saveIngestion(product_name_set_food_page,
                        nutriscore_set_food_page, cal_ingested,
                        fat_ingested, carbo_ingested,
                        protein_ingested, meal_set_food_page)
                        root.initDB()
                        PopupUtils.open(sucess_dialog)
                    } catch (err){
                            PopupUtils.open(error_dialog)
                    } 
                }
            }  
        }
    }
  
    NavigationBar{id: navigation_shape}
   
}

    

