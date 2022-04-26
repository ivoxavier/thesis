/*
*  2016 Stefano Verzegnassi
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
import Ubuntu.Content 1.3
import QtQuick.Controls.Suru 2.2
import "components"
import "../js/ThemeColors.js" as ThemeColors

Page {
  id: picker
	property var activeTransfer
    
	property var url
	property var handler
	property var contentType

    signal cancel()
    signal imported(string fileUrl)

    header: PageHeader {
        title: i18n.tr("Import From...")
        visible: app_settings.is_page_headers_enabled ? true : false

        StyleHints {
            foregroundColor: "white"
            backgroundColor:  Suru.theme === 0 ? ThemeColors.utFoods_blue_theme_background : ThemeColors.utFoods_dark_theme_background 
        }
    }

    Rectangle{
        anchors{
            top: app_settings.is_page_headers_enabled ? parent.header.bottom : parent.top
            left : parent.left
            right : parent.right
            bottom : parent.bottom
        }
        color : Suru.theme === 0 ? ThemeColors.utFoods_porcelain_theme_background : ThemeColors.utFoods_dark_theme_background 
    }

    
    ContentPeerPicker {
        anchors { 
            top:  app_settings.is_page_headers_enabled ? parent.header.bottom : parent.top
            left: parent.left
            right: parent.right
            bottom: app_settings.is_page_headers_enabled ? parent.bottom : navigation_shape.top
        }

        visible: parent.visible
        showTitle: false
        contentType: picker.contentType
        handler: picker.handler 

        onPeerSelected: {
            peer.selectionType = ContentTransfer.Single
            picker.activeTransfer = peer.request()
            picker.activeTransfer.stateChanged.connect(function() {
				        if (picker.activeTransfer.state === ContentTransfer.InProgress) {
					           console.log("In progress");
					           picker.activeTransfer.items = picker.activeTransfer.items[0].url = url;
					           picker.activeTransfer.state = ContentTransfer.Charged;
				        }
                if (picker.activeTransfer.state === ContentTransfer.Charged) {
					           console.log("Charged");
                     picker.imported(picker.activeTransfer.items[0].url)
					           console.log(picker.activeTransfer.items[0].url)
                     picker.activeTransfer = null

                     //close contentHub after file loaded
                     page_stack.pop(picker)
                }
            })
        }


        onCancelPressed: {
            console.log("Cancelled")
            page_stack.pop(picker)
        }
    }

    ContentTransferHint {
        id: transferHint
        anchors.fill: parent
        activeTransfer: picker.activeTransfer
    }
    Component {
        id: resultComponent
        ContentItem {}
	}

    NavigationBar{id: navigation_shape} 
}