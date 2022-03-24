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
import "../../js/ControlSetWeight.js" as ControlSetWeight

UbuntuShape{
    id: slot_shape

    // make public API's
    property alias color : slot_shape.backgroundColor
    property alias placeholderText: field_text.placeholderText
    

    width: units.gu(29)
    height: units.gu(7)
    radius: "large"
    aspect: UbuntuShape.DropShadow
    
    ListItem{
        height: slot_layout.height
        divider.visible: false

        ListItemLayout{
            id: slot_layout
            
            TextField {
                id: field_text
                anchors.verticalCenter: parent.verticalCenter
                inputMethodHints: Qt.ImhDigitsOnly
                width: parent.width - units.gu(3.7)
                onTextChanged: ControlSetWeight.setWeight()
            }  
        }
    }
}  