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
    id: credits_page
    objectName: 'CreditsPage'
    header: PageHeader {
                visible: app_settings.is_page_headers_enabled ? true : false
                title: i18n.tr("Credits & Licensing")
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
                text: i18n.tr("About")
                font.pixelSize: units.gu(4)
                font.bold: false
                visible: app_settings.is_page_headers_enabled ? false : true
            }

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
                text: i18n.tr("Version: %1").arg(root.app_version)
            }

            BlankSpace{}

            Label {
                Layout.alignment: Qt.AlignCenter
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                text: i18n.tr("App License: %1").arg("GNU GPL V3")
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Education Institution")
                }
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    title.text: i18n.tr("University Of Minho")
                    subtitle.text: i18n.tr("Information Systems Department, Guimarães.")
                }
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Developer")
                }
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    title.text: "Ivo Fernandes"
                    subtitle.text: i18n.tr("Student")
                }
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Advisor")
                }
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    title.text: "Professor Dr. José Luis Pereira"
                    subtitle.text : i18n.tr("Assistant Professor At Information Systems Department")
                }
            }

            ListItem{
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Support")
                }
            }

            ListItem{
                id: source_code_list_item
                divider.visible: false
                property string github_url : "https://github.com/ivoxavier/thesis"
                onClicked : Qt.openUrlExternally(github_url)
                ListItemLayout{
                    title.text: i18n.tr("Source-Code")
                    subtitle.text : source_code_list_item.github_url
                }
            }

            ListItem{
                id: support_list_item
                divider.visible: false
                property string github_url : "https://github.com/ivoxavier/thesis/issues"
                onClicked : Qt.openUrlExternally(github_url)
                ListItemLayout{
                    title.text: i18n.tr("Get Support For This Application")
                    subtitle.text : support_list_item.github_url
                }
            }
        }  
    }
    NavigationBar{id:navigation_shape}   
}