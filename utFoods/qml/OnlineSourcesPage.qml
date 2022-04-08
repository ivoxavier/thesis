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
import "components"


Page{
    id: api_page
    objectName: 'ApiPage'
    header: PageHeader {
                visible: app_settings.is_page_headers_enabled ? true : false
                title: i18n.tr("Aplication Programming Interface")
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

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Online Sources")
                font.pixelSize: units.gu(4)
                font.bold: false
                visible: app_settings.is_page_headers_enabled ? false : true
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Application Programming Interface")
                }
            }

            ListItem {
                divider.visible: false
                ListItemLayout{
                    title.text: i18n.tr("OpenFoodsFacts")
                    subtitle.text: i18n.tr("Search For Barcode In %1").arg("openfoodsfacts")
                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        source : "../assets/mangifying_glass_barcodes.svg"
                        height : units.gu(3.5)
                    }

                    Switch{
                        checked: app_settings.is_api_openfoodsfacts_enabled
                        onClicked: app_settings.is_api_openfoodsfacts_enabled = !app_settings.is_api_openfoodsfacts_enabled
                    }
                }  
            }

            ListItem {
                divider.visible: false
                ListItemLayout{
                    title.text: "The MealDB"
                    subtitle.text: i18n.tr("Gets Random Recipes")
                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        source : "../assets/meal-svgrepo-com.svg"
                        height : units.gu(3.5)
                    }
                    Switch{
                        checked: app_settings.is_api_themealdb_enabled
                        onClicked: app_settings.is_api_themealdb_enabled = !app_settings.is_api_themealdb_enabled
                    }
                }  
            }


        }  
    }
    NavigationBar{id:navigation_shape}   
}