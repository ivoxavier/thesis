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
import "components"
import "../js/ControlSetSexSelection.js" as ControlSetSexSelection


Page{
    id: set_sex_at_birth_page
    objectName: 'SetSexAtBirthPage'
    header: PageHeader {
        visible: true
        title: i18n.tr("About You")
        }

    //enables the next button after user clicking in one slotActivity
    property bool is_sex_at_birth_selected : false
    
    
    Flickable {

        anchors{
            top: parent.header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        contentWidth: parent.width
        contentHeight: main_column.height  

        interactive : root.height > root.width ? false : true
        
        ColumnLayout{
            id: main_column
            width: root.width
        

            CompletationBar{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                value: 49
            }

            BlankSpace{height:units.gu(2)}

            Text{
                Layout.alignment: Qt.AlignCenter  
                text: i18n.tr("Sex assigned at birth?")
                font.pixelSize: units.gu(4)
            }

            BlankSpace{height:units.gu(2)}

            SlotBirthSex{
                id: male_slot
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                text: i18n.tr("MALE")
                img_path:"../assets/logo.svg"
                MouseArea{
                    anchors.fill: parent
                    onClicked: ControlSetSexSelection.selectSex(0)
                }
            }

            BlankSpace{}

            SlotBirthSex{
                id: female_slot
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                text: i18n.tr("FEMALE")
                img_path:"../assets/logo.svg"
                MouseArea{
                    anchors.fill: parent
                    onClicked: ControlSetSexSelection.selectSex(1)   
                }
            }

            BlankSpace{height:units.gu(22)}

            Button{
                id: next_button
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Next")
                enabled: set_sex_at_birth_page.is_sex_at_birth_selected
                onClicked:{
                    page_stack.push(set_age_page)
                }    
            } 
        }  
    }  
}