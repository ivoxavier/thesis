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
import "../js/ThemeColors.js" as ThemeColors


Page{
    id: third_party_software_page
    objectName: 'ThirdPartySoftwarePage'
    header: PageHeader {
                visible: app_settings.is_page_headers_enabled ? true : false
                title: i18n.tr("Third Party Software")
                StyleHints {
                    foregroundColor: "white"
                    backgroundColor:  Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_background : ThemeColors.utFoods_dark_theme_background 
                }
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


            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("QML Modules")
                    subtitle.font.bold : true
                }
            }

            ListItem{
                id: chart_list_item
                divider.visible: false
                property string github_url : "https://github.com/shuirna/QMLChartJs"
                onClicked : Qt.openUrlExternally(github_url)
                ListItemLayout{
                    title.text: "QChartsJs"
                    title.font.bold : true
                    subtitle.text: chart_list_item.github_url
                }
            }

            ListItem{
                id: json_list_model_list
                divider.visible: false
                property string github_url : "https://github.com/kromain/qml-utils"
                onClicked : Qt.openUrlExternally(github_url)
                ListItemLayout{
                    title.text: i18n.tr("JSONListModel. Licensed under the MIT licence")
                    subtitle.font.bold : true
                    subtitle.text: json_list_model_list.github_url
                }
            }


            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("JavaScript Libs")
                    subtitle.font.bold : true
                }
            }

            ListItem{
                id: json_path_list
                divider.visible: false
                property string url : "https://goessner.net/2007/09/jsonpath-xpath-for-json.html"
                onClicked : Qt.openUrlExternally(url)
                ListItemLayout{
                    title.text: i18n.tr("jsonpath. Licensed under the MIT licence")
                    title.font.bold : true
                    subtitle.text: json_path_list.url
                }
            }


            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("C++ Modules")
                    subtitle.font.bold : true
                }
            }

            ListItem{
                id: qzxing_list
                divider.visible: false
                property string github_url : "https://github.com/ftylitak/qzxing"
                onClicked : Qt.openUrlExternally(github_url)
                ListItemLayout{
                    title.text: i18n.tr("qzxing. Licensed under the Apache License 2.0")
                    title.font.bold : true
                    subtitle.text: qzxing_list.github_url
                }
            } 
        }      
    }
    NavigationBar{
        id: navigation_shape
        backgroundColor : Suru.theme === 0 ? ThemeColors.utFoods_porcelain_theme_background : ThemeColors.utFoods_dark_theme_background 
    }     
}