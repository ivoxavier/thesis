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
import QtCharts 2.3
import QtQuick.Controls.Suru 2.2
import QtQuick.LocalStorage 2.12
import "components"


Page{
    id: third_party_software_page
    objectName: 'ThirdPartySoftwarePage'
    header: PageHeader {
                visible: app_settings.is_page_headers_enabled ? true : false
                title: i18n.tr("Third Party Software")
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
                text: i18n.tr("Third Party Software")
                font.pixelSize: units.gu(4)
                font.bold: false
                visible: app_settings.is_page_headers_enabled ? false : true
            }

            BlankSpace{}


            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("QML Modules")
                }
            }

            ListItem{
                id: chart_list_item
                divider.visible: false
                property string github_url : "https://github.com/shuirna/QMLChartJs"
                onClicked : Qt.openUrlExternally(github_url)
                ListItemLayout{
                    title.text: "QChartsJs"
                    subtitle.text: chart_list_item.github_url
                }
            }

            ListItem{
                id: json_list_model_list
                divider.visible: false
                property string github_url : "https://github.com/kromain/qml-utils"
                onClicked : Qt.openUrlExternally(github_url)
                ListItemLayout{
                    title.text: i18n.tr("%1. Licensed under the MIT licence").arg("JSONListModel")
                    subtitle.text: json_list_model_list.github_url
                }
            }


            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("JavaScript Libs")
                }
            }

            ListItem{
                id: json_path_list
                divider.visible: false
                property string url : "https://goessner.net/2007/09/jsonpath-xpath-for-json.html"
                onClicked : Qt.openUrlExternally(url)
                ListItemLayout{
                    title.text: i18n.tr("%1. Licensed under the MIT licence").arg("jsonpath")
                    subtitle.text: json_path_list.url
                }
            }


            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("C++ Modules")
                }
            }

            ListItem{
                id: qzxing_list
                divider.visible: false
                property string github_url : "https://github.com/ftylitak/qzxing"
                onClicked : Qt.openUrlExternally(github_url)
                ListItemLayout{
                    title.text: i18n.tr("%1. Licensed under the Apache License 2.0").arg("qzxing")
                    subtitle.text: qzxing_list.github_url
                }
            } 
        }      
    }
    NavigationBar{id:navigation_shape}   
}