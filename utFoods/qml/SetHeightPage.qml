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
import QtQuick.Controls.Suru 2.2
import "components"



Page{
    id: set_height_page
    objectName: 'SetHeightPage'
    header: PageHeader {
        visible: true
        title: i18n.tr("About You")
        }

    property bool is_height_inputed : false

    //Pop Dialog that calculates the recommended calories
    Component{
        id: calculate_recommended_calories_dialog
        RecommendedCaloriesDialog{}
    }


    
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
                value: 100
            }

            BlankSpace{}

            Text{
                Layout.alignment: Qt.AlignCenter  
                text: i18n.tr("Your height?")
                font.pixelSize: units.gu(4)
                  
            }

            BlankSpace{height: units.gu(2.5)}

            SlotHeight{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                placeholderText: i18n.tr("Your height in cm: 171")
            }
          
            BlankSpace{height: units.gu(2.5)}

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("You can change it later") + " 😎."
                font.pixelSize: units.gu(1.5)
            }

            BlankSpace{height:units.gu(20)}

            Button{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Next")
                enabled: set_height_page.is_height_inputed
                onClicked: PopupUtils.open(calculate_recommended_calories_dialog)      
            }
        }  
    }          
}