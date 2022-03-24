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
    id: set_age_page
    objectName: 'SetAgePage'
    header: PageHeader {
        visible: true
        title: i18n.tr("About You")
    }
    
    //enables the next button after user clicking in one slotAge
    property bool is_age_inputed : false

    Flickable {

        anchors{
            top: parent.header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        contentWidth: parent.width
        contentHeight: main_column.height  
        
        ColumnLayout{
            id: main_column
            width: root.width

            CompletationBar{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                value: 66
            }

            BlankSpace{height:units.gu(2)}

            Text{
                Layout.alignment: Qt.AlignCenter   
                text: i18n.tr("What's your age?")
                font.pixelSize: units.gu(4)
                color: "black" 
            }

            BlankSpace{height:units.gu(2)}

            SlotAge{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                placeholderText: i18n.tr("Enter you age in years")
            }

            BlankSpace{height:units.gu(8)}
          
            Text{
                Layout.alignment: Qt.AlignCenter    
                text: i18n.tr("You can change it later") + " 😎."
                font.pixelSize: units.gu(1.5)
            }

            BlankSpace{height:units.gu(20)}

            Button{
                Layout.alignment: Qt.AlignCenter 
                text: i18n.tr("Next")
                enabled: set_age_page.is_age_inputed
                onClicked:{
                    page_stack.push(set_weight_page)
                }    
            }
        }  
    }
}