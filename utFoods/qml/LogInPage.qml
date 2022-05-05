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
import "../js/ControlLogInMessages.js" as ControlMessages
import "../js/ThemeColors.js" as ThemeColors


Page{
    id: login_page
    objectName: 'LoginPage'
    header: PageHeader {visible: false}

    //to check is fields aren't empty
    property int user_id : -1
    property string user_passcode : " "


    Rectangle{
    anchors.fill: parent
    gradient: Gradient {
        GradientStop { position: 0.0; color: Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_background : ThemeColors.utFoods_dark_theme_background }
    }
}


    /*Messages --start--*/
    Component{
        id: info_text_dialog
        MessageDialog{msg:i18n.tr("Hi, Thanks For Participating.\n\nYou Should Have Received An ID And A Passcode.\n\nEnter Them. Make Sure You have WiFi Or Mobile Data Enabled.")}
    }


    Component{
        id: all_fields_empty_dialog
        MessageDialog{msg:i18n.tr("ID & Passcode Fields Are Empty!")}
    }

    Component{
        id: id_field_empty_dialog
        MessageDialog{msg:i18n.tr("ID Field Is Empty!")}
    }

    Component{
        id: passcode_field_empty_dialog
        MessageDialog{msg:i18n.tr("Passcode Field Is Empty!")}
    }

    Component{
        id: forgot_dialog
        MessageDialog{msg:i18n.tr("Please Send An Email To %1.\n\nDescribing The Situation And Mentioning The App Version.\n\nApp Version: %2").arg("pg27165@alunos.uminho.pt").arg(root.app_version)}
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

        //interactive : root.height > root.width ? false : true

        ColumnLayout{
            id: main_column
            width: root.width

            BlankSpace{height: units.gu(4)}

            Text{
                Layout.alignment: Qt.AlignCenter 
                text: i18n.tr("Welcome")
                font.pixelSize: units.gu(4)
                color : "white"   
            }

            BlankSpace{height: units.gu(3)}

            Text{
                Layout.alignment: Qt.AlignCenter
                text: i18n.tr("Sign In To Continue")
                font.pixelSize: units.gu(2)
                color : "white" 
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

            BlankSpace{height:units.gu(4)}

            SlotUserCredentials{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                color: "transparent"
                placeholder : i18n.tr("ID...")
                img_path: "stock_contact"
                is_passcode: false
                inputMethodHints: Qt.ImhDigitsOnly
            }

            BlankSpace{}

            SlotUserCredentials{
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: root.width - units.gu(9)
                Layout.preferredHeight: units.gu(7)
                color: "transparent"
                placeholder : i18n.tr("Passcode...")
                img_path:"stock_lock"
                is_passcode: true
            }

            BlankSpace{}

            Text{ 
                text: i18n.tr("Forgot my ID or Passcode.")
                font.pixelSize: units.gu(1.3)
                color: "white"
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
                color : UbuntuColors.green
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