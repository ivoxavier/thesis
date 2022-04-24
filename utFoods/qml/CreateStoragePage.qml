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
import QtQuick.Controls.Suru 2.2
import "components"
import "../js/Storage.js" as Storage
import "../js/UserTable.js" as UserTable
import "../js/WeightTrackerTable.js" as WeightTrackerTable
import "../js/ControlCreateStorage.js" as ControlCreateStorage
import "../js/ThemeColors.js" as ThemeColors

Page{
    id: create_storage_page
    objectName: 'CreateStoragePage'
    header: PageHeader {visible: false}

    Component{
        id: operation_failed
        MessageDialog{msg: err}
    }

    Component{
        id: dummy_dialog
        MessageDialog{msg: "DB Created"}
    }

    Rectangle{
        anchors{
            top: parent.top
            left : parent.left
            right : parent.right
            bottom : parent.bottom
        }
        color : Suru.theme === 0 ? ThemeColors.utFoods_porcelain_theme_background : ThemeColors.utFoods_dark_theme_background 
    }

    Timer{id: timer; repeat: false}

    Column{
        anchors{
            top: parent.top
            right: parent.right
            left: parent.left
            bottom: parent.bottom
        }

        BlankSpace{height: units.gu(6)}

        UbuntuShape{
            anchors.horizontalCenter: parent.horizontalCenter
            width: units.gu(12)
            height: units.gu(12)
            aspect: UbuntuShape.Flat
            source: Image{
                source: "../assets/db_logo.svg"
                fillMode: Image.PreserveAspectFit
            }
        }

        BlankSpace{height: units.gu(12)}

         Text{
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr("Creating database...")
            color : Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_text : ThemeColors.utFoods_dark_theme_text 
            font.bold : true
        }

        BlankSpace{height: units.gu(12)}

        ActivityIndicator {
            id: loading_circle

            anchors.horizontalCenter: parent.horizontalCenter
            running: false
            onRunningChanged: {
                ControlCreateStorage.animationState(4000, function () {
                    page_stack.pop(create_storage_page)
                    page_stack.push(home_page)
                })
            }
        }
        
    }
    Component.onCompleted: ControlCreateStorage.dBbuild()
}