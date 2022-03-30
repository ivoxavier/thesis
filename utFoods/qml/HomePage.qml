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
import "components"
import "../js/ControlIconUpAnimation.js" as ControlIconUpAnimation


Page{
    id: home_page
    objectName: 'HomePage'
    header: PageHeader {visible:false}
    
    //popus a datepicker
    Component{
        id: date_popUP
        DateNavigation{}
    }

    Flickable {
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: footer_shape.top
        }
        contentWidth: parent.width
        contentHeight: main_column.height
            
        ColumnLayout{
            id: main_column
            width: root.width

            Row{
                Layout.alignment: Qt.AlignCenter
                spacing: units.gu(1)
                Icon{id:calendar_icon;name:"calendar";height: units.gu(2.5)}

                Label {
                    id: dateLabel
                    text: root.stringDate
                    font.pixelSize: units.gu(2)
                }

                Icon{
                    id: icon_down
                    property bool is_clicked : false
                    name: "go-up"
                    height: units.gu(2.5)
                    rotation: icon_down.is_clicked ? 180 : 0
                    Behavior on rotation {
                        UbuntuNumberAnimation {}
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: ControlIconUpAnimation.animate()
                    }
                }
            }
        }  
    }

    FooterBar{id: footer_shape}
        
    Component.onCompleted:{}        
}