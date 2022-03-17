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


UbuntuShape{
    id: slot_shape

    // make public API's
    property alias img_path: slot_img_credentials.img_path
    property alias color : slot_shape.backgroundColor
    property alias placeholder : field_text.placeholderText
    property alias inputMethodHints : field_text.inputMethodHints
    property alias is_passcode : field_text.is_passcode

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

                //to decide wether the input is ID or Passcode
                property bool is_passcode

                width: parent.width - units.gu(11)
                onTextChanged:{
                    //check if is passcode
                    if(slot_shape.is_passcode){
                        login_page.user_passcode = text
                    } else{
                        login_page.user_id = text
                        app_settings.id_login = text
                    }
                }
            }

            UbuntuShape{
                id: slot_img_credentials
                property alias img_path: img.source
                SlotsLayout.position: SlotsLayout.Leading
                width: units.gu(5)
                height: units.gu(5)
                radius: "small"
                aspect: UbuntuShape.DropShadow
                //backgroundColor:"black"
                source: Image{
                    id: img
                    source: slot_img_credentials.img_path
                }
            }  
        }
    }
}  