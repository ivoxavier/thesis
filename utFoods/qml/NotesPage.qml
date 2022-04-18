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
import "../js/NotesTable.js" as NotesTable

Page{
    id: notes_page
    objectName: 'NotesPage'
    header: PageHeader {
                visible: app_settings.is_page_headers_enabled ? true : false
                title : i18n.tr("Your Notes")
        }

    Item{
        visible: notes_page_list.visible ? false : true
        anchors.centerIn: parent
        height: parent.height / 2
        width: parent.width / 2

        Icon {
            id: empty_icon
            anchors.fill: parent
            name: "empty-symbolic"
            opacity: 0.75
        }

        Label{
            anchors.top: empty_icon.bottom
            anchors.horizontalCenter: empty_icon.horizontalCenter
            text: i18n.tr("Empty List, Please Register Notes First..")
            opacity: 0.75
        }
    }   

    ListView{
        id: notes_page_list
        anchors{
            top: app_settings.is_page_headers_enabled ? parent.header.bottom : parent.top
            bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
            left: parent.left
            right: parent.right
        }
        model: NotesList{}
        clip: true
        removeDisplaced: Transition {
            NumberAnimation { 
                properties: "x,y"
                 duration: 1000 
                }
            }
        visible: model.count === 0 ? false : true
        delegate: ListItem{
            ListItemLayout{
                title.text: note
                subtitle.text: date
                }
            leadingActions: ListItemActions{
                actions:[
                    Action{
                        iconName: "delete"
                        onTriggered:{
                            NotesTable.deleteNote(id)
                            notes_page_list.model.remove(index)
                        }
                    }
                ]
            }
        }
    }
    NavigationBar{id:navigation_shape}   
}