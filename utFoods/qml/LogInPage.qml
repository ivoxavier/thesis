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
import "../js/ControlLogInMessages.js" as ControlMessages



Page{
    id: login_page
    objectName: 'LoginPage'
    header: PageHeader {visible: false}

    //to check is fields aren't empty
    property int user_id : -1
    property string user_passcode : " "

    /*Messages --start--*/
    Component{
        id: info_text_dialog
        MessageDialog{msg:i18n.tr("Hi, thanks for participating.\n\nYou should have received an id and a passcode.\n\nEnter them in the respective fields. Make sure you have Wifi or Mobile Data enabled.")}
    }


    Component{
        id: all_fields_empty_dialog
        MessageDialog{msg:i18n.tr("ID and Passcode fields are empty!")}
    }

    Component{
        id: id_field_empty_dialog
        MessageDialog{msg:i18n.tr("ID field is empty!")}
    }

    Component{
        id: passcode_field_empty_dialog
        MessageDialog{msg:i18n.tr("Passcode field is empty!")}
    }

    Component{
        id: forgot_dialog
        MessageDialog{msg:i18n.tr("Please send an email to %1.\n\nDescribing the situation and mentioning the app version.\n\nApp version: %2").arg("pg27165@alunos.uminho.pt").arg(root.app_version)}
    }

    //Pops a slot warning that about 
    Component{
        id: wrong_credentials
        WrongCredentialsPopOver{}
    }

    /*Messages --end--*/

    //Dialog that checks login credentials
    Component{
        id: auth_dialog
        AuthenticationDialog{}
    }
    
    Flickable {
        anchors{
            top: parent.top
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
        
            Text{
                text: i18n.tr("Welcome")
                font.pixelSize: units.gu(4)
                Layout.alignment: Qt.AlignCenter    
            }

            BlankSpace{}

            Text{
                text: i18n.tr("Sign in to continue")
                font.pixelSize: units.gu(2)
                Layout.alignment: Qt.AlignCenter
            }

            BlankSpace{}

            UbuntuShape{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: units.gu(12)
                Layout.preferredHeight: units.gu(12)
                radius: "large"
                aspect: UbuntuShape.DropShadow
                source : Image{
                    source : "../assets/logo.svg"
                }
            }

            BlankSpace{height:units.gu(2)}

            SlotUserCredentials{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                color: root.backgroundColor
                placeholder : i18n.tr("ID...")
                img_path:"../assets/logo.svg"
                is_passcode: false
                inputMethodHints: Qt.ImhDigitsOnly
            }

            BlankSpace{}

            SlotUserCredentials{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                color: root.backgroundColor
                placeholder : i18n.tr("Passcode...")
                img_path:"../assets/logo.svg"
                is_passcode: true
            }

            BlankSpace{}

            Text{ 
                text: i18n.tr("Forgot my ID or Passcode.")
                font.pixelSize: units.gu(1.3)
                color: "blue"
                Layout.alignment: Qt.AlignCenter
                font.underline : true
                MouseArea{
                    
                    anchors.fill: parent
                    onClicked:{
                        PopupUtils.open(forgot_dialog)
                    }
                }
            }

           BlankSpace{height:units.gu(8)}

            Button{
                id: next_button
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("LOGIN")
                onClicked:{
                    ControlMessages.state()
                }
            } 
        }  
    }
    Component.onCompleted:{
        PopupUtils.open(info_text_dialog)
    }            
}