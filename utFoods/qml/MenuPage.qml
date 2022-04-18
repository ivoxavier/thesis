/*
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
import QtQuick.Window 2.0
import "components"



Page{
    id: menu_page
    objectName: 'MenuPage'
    header: PageHeader {
        visible: app_settings.is_page_headers_enabled ? true : false
        title: i18n.tr("Menu")
        }

    Flickable{
        id: flickable

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

            SlotAccountImg{
                id: slot_account_img
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(28)
                Layout.preferredHeight: width
                img_path: app_settings.account_picture_path == "../assets/logo.svg" ? "../assets/logo.svg" : app_settings.account_picture_path
            }

            Icon{
                Layout.alignment: Qt.AlignCenter
                name: "camera-app-symbolic"
                height : units.gu(2.5)
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        var importPage = page_stack.push(import_page,{"contentType": ContentType.All, "handler": ContentHandler.Source})
                        importPage.imported.connect(function(fileUrl) {
                            app_settings.account_picture_path = fileUrl
                        })
                    }
                }
            }

            ListItem{
                width: root.width
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("User")
                }
            }


            ListItem{
                width: root.width
                ListItemLayout{
                    title.text : i18n.tr("Update your information")
                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        name : "account"
                        height : units.gu(3.5)
                    }

                    ProgressionSlot{}
                }
                onClicked: page_stack.push(update_user_values_page)
            }

            ListItem{
                width: root.width
                ListItemLayout{
                    title.text : i18n.tr("Data analysis")
                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        name : "x-office-presentation-symbolic"
                        height : units.gu(3.5)
                    }

                    ProgressionSlot{}
                }
                onClicked: page_stack.push(data_analysis_page)
            }

            ListItem{
                width: root.width
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Settings")
                }
            }

            ListItem{
                width: root.width
        
                ListItemLayout{
                    title.text : i18n.tr("Change App Layout & Behaviours")
                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        name : "preferences-desktop-wallpaper-symbolic"
                        height : units.gu(3.5)
                    }

                    ProgressionSlot{}
                }
                onClicked: page_stack.push(app_layout_page)
            }

            ListItem{
                width: root.width
                ListItemLayout{
                    title.text : i18n.tr("Online sources")

                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        name : "stock_website"
                        height : units.gu(3.5)
                    }

                    ProgressionSlot{}
                }
                onClicked: page_stack.push(online_sources_page)
            }

            ListItem{
                width: root.width
                ListItemLayout{
                    title.text : i18n.tr("Trackers settings")

                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        name : "stopwatch"
                        height : units.gu(3.5)
                    }

                    ProgressionSlot{}
                }
                onClicked: page_stack.push(trackers_settings_page)
            }

            ListItem{
                width: root.width
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("Storage")
                }
            }

            ListItem{
                width: root.width
                ListItemLayout{
                    title.text : i18n.tr("Manage data")
                    
                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        name : "drive-harddisk-symbolic"
                        height : units.gu(3.5)
                    }

                    ProgressionSlot{}
                }
                onClicked: page_stack.push(manage_data_page)
            }

            ListItem{
                width: root.width
                ListItemLayout{
                    title.text : i18n.tr("Export data")
                    
                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        name : "document-save"
                        height : units.gu(3.5)
                    }

                    ProgressionSlot{}
                }
                onClicked: page_stack.push(export_data_page)
            }

            ListItem{
                width: root.width
                divider.visible: false
                ListItemLayout{
                    subtitle.text: i18n.tr("About")
                }
            }

            ListItem{
                width: root.width
                ListItemLayout{
                    title.text : i18n.tr("Credits & licensing")
                    
                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        name : "info"
                        height : units.gu(3.5)
                    }

                    ProgressionSlot{}
                }
                onClicked: page_stack.push(credits_page)
            }

            ListItem{
                width: root.width
                ListItemLayout{
                    title.text : i18n.tr("Third party software")
                    
                    Icon{
                        SlotsLayout.position: SlotsLayout.Leading
                        name : "text-css-symbolic"
                        height : units.gu(3.5)
                    }

                    ProgressionSlot{}
                }
                onClicked: console.log(" ")
            }


        }

        
    }
    

    NavigationBar{id: navigation_shape}
}

