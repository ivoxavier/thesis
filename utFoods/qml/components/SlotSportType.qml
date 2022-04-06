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

UbuntuShape{
    id: slot_shape

    //public API's
    property alias color: slot_shape.color;
    property alias img_path: img.source;
    property alias sport_description: description_label.text
    
    radius: "large"
    aspect: UbuntuShape.Inset
    
    Image {
        id: img;
        anchors.centerIn: parent
        width: parent.width * 0.5;
        height: parent.height * 0.5;
    }

    Label {
        id: description_label;
        anchors.horizontalCenter: img.horizontalCenter
        anchors.top: img.bottom
        fontSize: "medium"
        //color:"white"
    }
} 