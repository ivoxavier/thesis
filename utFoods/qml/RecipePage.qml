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
import Ubuntu.Content 1.3
import "components"
import "../js/ThemeColors.js" as ThemeColors


Page{
    id: recipe_page
    objectName: 'RecipePage'
    header: PageHeader {
                visible: app_settings.is_page_headers_enabled ? true : false
                title: root.recipe_name

                StyleHints {
                    foregroundColor: "white"
                    backgroundColor:  Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_background : ThemeColors.utFoods_dark_theme_background 
                }
            }

    property bool is_instructions_view : true

    property var ingredients : [
    root.recipe_ingredient1,
    root.recipe_ingredient2,
    root.recipe_ingredient3,
    root.recipe_ingredient4,
    root.recipe_ingredient5,
    root.recipe_ingredient6,
    root.recipe_ingredient7,
    root.recipe_ingredient8,
    root.recipe_ingredient9,
    root.recipe_ingredient10
    ]

    property var measures :[
        root.recipe_measure1,
        root.recipe_measure2,
        root.recipe_measure3,
        root.recipe_measure4,
        root.recipe_measure5,
        root.recipe_measure6,
        root.recipe_measure7,
        root.recipe_measure8,
        root.recipe_measure9,
        root.recipe_measure10,
    ]
     
    
    
    Flickable {

        anchors{
            top:  app_settings.is_page_headers_enabled ? parent.header.bottom : parent.top
            left: parent.left
            right: parent.right
            bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
        }

        contentWidth: parent.width
        contentHeight: main_column.height  
        
        interactive: is_instructions_view ? true : false

        ColumnLayout{
            id: main_column
            width: root.width

            Text{
                Layout.alignment: Qt.AlignCenter
                text: root.recipe_name
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                font.pixelSize: units.gu(3.5)
                font.bold: false 
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                visible: app_settings.is_page_headers_enabled ? false : true
            }

            RowLayout{
                id: row_tabs
                Layout.alignment: Qt.AlignCenter
                width: parent.width
                UbuntuShape{
                    Layout.preferredWidth: units.gu(12.5)
                    Layout.preferredHeight: units.gu(5)
                    radius: "large"
                    aspect: is_instructions_view ? UbuntuShape.DropShadow : UbuntuShape.Flat

                    Text{
                        anchors.centerIn: parent
                        text: i18n.tr("INSTRUCTIONS")
                        color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                        }
                    MouseArea{
                        anchors.fill: parent
                        onClicked :{
                            is_instructions_view = true
                        }
                    }
                }

                UbuntuShape{
                    Layout.preferredWidth: units.gu(12.5)
                    Layout.preferredHeight: units.gu(5)
                    radius: "large"
                    aspect: is_instructions_view ? UbuntuShape.Flat : UbuntuShape.DropShadow

                    Text{
                        anchors.centerIn: parent
                        text: i18n.tr("INGREDIENTS")
                        color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            is_instructions_view = false
                        }
                    }
                }   
            }

            Label{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(4)
                text: root.recipe_instructions
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                font.pixelSize: units.gu(2)
                font.bold: false 
                visible: is_instructions_view ? true : false
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
            }

            BlankSpace{visible: is_instructions_view ? true : false}

            Label{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(1.5)
                text: i18n.tr("See Video on <a href='%1'>YouTube</a>").arg(root.recipe_youtbe_url)
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                font.pixelSize: units.gu(2)
                font.bold: false 
                onLinkActivated: Qt.openUrlExternally(link)
                visible: is_instructions_view ? true : false
            }

            ListView{
                //Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: root.width
                Layout.preferredHeight: root.height - navigation_shape.height - units.gu(5)
                model: 10
                visible: is_instructions_view ? false : true
                delegate: ListItem{
                    ListItemLayout{
                        title.text: ingredients[index]
                        title.font.bold: true
                        subtitle.text : measures[index]
                    }
                }
            }           
        }  
    }
    NavigationBar{id: navigation_shape}   
}   