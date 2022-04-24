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
    id: credits_page
    objectName: 'CreditsPage'
    header: PageHeader {
                visible: app_settings.is_page_headers_enabled ? true : false
                title: i18n.tr("Credits & Licensing")

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
        
        ColumnLayout{
            id: main_column
            width: root.width

            BlankSpace{}

            UbuntuShape{
                Layout.alignment: Qt.AlignCenter
                radius: "large"
                Layout.preferredWidth: units.gu(12)
                Layout.preferredHeight: units.gu(12)
                aspect: UbuntuShape.DropShadow
                source: Image{
                    source: "../assets/logo.svg"
                }
            }

            Label {
                Layout.alignment: Qt.AlignCenter
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                text: i18n.tr("Version: ") + root.app_version
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text
            }

            BlankSpace{}

            Label {
                Layout.alignment: Qt.AlignCenter
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                text: i18n.tr("App License: GNU GPL v3")
                color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Education Institution")
                    subtitle.font.bold : true
                }
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    title.text: i18n.tr("University Of Minho")
                    title.font.bold : true
                    subtitle.text: i18n.tr("Information Systems Department, Guimarães.")
                }
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Developer")
                    subtitle.font.bold : true
                }
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    title.text: "Ivo Fernandes"
                    title.font.bold : true
                    subtitle.text: i18n.tr("Student")
                }
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Advisor")
                    subtitle.font.bold : true
                }
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    title.text: "Professor Dr. José Luis Pereira"
                    title.font.bold : true
                    subtitle.text : i18n.tr("Assistant Professor At Information Systems Department")
                }
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Support")
                    subtitle.font.bold : true
                }
            }

            ListItem{
                id: source_code_list_item
                divider.visible: false
                property string github_url : "https://github.com/ivoxavier/thesis"
                onClicked : Qt.openUrlExternally(github_url)
                ListItemLayout{
                    title.text: i18n.tr("Source-Code")
                    title.font.bold : true
                    subtitle.text : source_code_list_item.github_url

                    ProgressionSlot{}
                }
            }

            ListItem{
                id: support_list_item
                divider.visible: false
                property string github_url : "https://github.com/ivoxavier/thesis/issues"
                onClicked : Qt.openUrlExternally(github_url)
                ListItemLayout{
                    title.text: i18n.tr("Get Support For This Application")
                    title.font.bold : true
                    subtitle.text : support_list_item.github_url

                    ProgressionSlot{}
                }
            }
        }  
    }
    NavigationBar{
        id: navigation_shape
        backgroundColor : Suru.theme === 0 ? ThemeColors.utFoods_porcelain_theme_background : ThemeColors.utFoods_dark_theme_background 
    }    
}