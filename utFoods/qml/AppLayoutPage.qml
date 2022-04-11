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
import QtQuick.Controls 2.2 as QQC2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import Ubuntu.Components.ListItems 1.3 
import Ubuntu.Components.Popups 1.3
import QtQuick.Controls.Suru 2.2
import QtQuick.LocalStorage 2.12
import "components"



Page{
    id: app_layout_page
    objectName: 'AppLayoutPage'
    header: PageHeader {
                visible: app_settings.is_page_headers_enabled ? true : false
                title: i18n.tr("App Layout")
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
                text: i18n.tr("App Layout")
                font.pixelSize: units.gu(4)
                font.bold: false
                visible: app_settings.is_page_headers_enabled ? false : true
            }

            ListItem {
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Appearance")
                }  
            }       

         
            ListItem {
                divider.visible: false
                ListItemLayout{
                    title.text: i18n.tr("Enable Page Headers")
                    subtitle.text: i18n.tr("If Enabled It Will Remove Footer Navigation Bar")
                    Switch{
                        checked: app_settings.is_page_headers_enabled
                        onClicked: app_settings.is_page_headers_enabled = !app_settings.is_page_headers_enabled
                    }
                }  
            }
            

            ListItem {
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Foods List")
                }  
            } 

            ListItem{
                divider.visible: false
                ListItemLayout{
                        title.text : i18n.tr("%1 List").arg("OpenFoodsFacts")
                        subtitle.text : i18n.tr("Modified From %1").arg("world.openfoodfacts.org")
                        Icon{
                            SlotsLayout.position: SlotsLayout.Leading
                            name : "x-office-document-symbolic" //"../assets/mangifying_glass_barcodes.svg"
                            height : units.gu(3.5)
                        }
                        QQC2.RadioButton{
                            checked: app_settings.is_xml_openfoodsfacts_enabled ? true : false
                            onClicked: {app_settings.is_xml_openfoodsfacts_enabled = !app_settings.is_xml_openfoodsfacts_enabled}
                        }
                }
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                        title.text : i18n.tr("User Created Foods List")
                        Icon{
                            SlotsLayout.position: SlotsLayout.Leading
                            name : "x-office-document-symbolic"
                            height : units.gu(3.5)
                        }
                        QQC2.RadioButton{
                            checked: app_settings.is_xml_openfoodsfacts_enabled ? false : true
                            onClicked: {app_settings.is_xml_openfoodsfacts_enabled = !app_settings.is_xml_openfoodsfacts_enabled}
                        }
                }
            }

            ListItem {
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Graphs Settings")
                }  
            }

            ListItem {
                divider.visible: false
                ListItemLayout{
                    title.text: i18n.tr("Graph Animation")
                    Switch{
                        checked: app_settings.is_graphs_animation_enabled
                        onClicked: app_settings.is_graphs_animation_enabled = !app_settings.is_graphs_animation_enabled
                    }
                }  
            }

        }  
    }
    NavigationBar{id:navigation_shape}   
}