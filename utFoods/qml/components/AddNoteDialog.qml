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
import Ubuntu.Components.Popups 1.3
import QtQuick.Layouts 1.3
import QtQuick.LocalStorage 2.12
import "../../js/NotesTable.js" as NotesTable

Dialog {
    id: add_note_dialog

    property string note

    Label{
        text: i18n.tr("Add Your Notes")
    }

    UbuntuShape{
        width : parent.width
        height : units.gu(10)
        radius: "large"
        aspect: UbuntuShape.Inset

        TextInput{
            anchors.fill: parent
            overwriteMode: true
            horizontalAlignment: TextInput.AlignHCenter
            verticalAlignment: TextInput.AlignVCenter
            onTextChanged: note = text
        }
    }

    Button {
        text: i18n.tr("View Your Notes")
        onClicked:{
            PopupUtils.close(add_note_dialog)
            page_stack.push(notes_page)
        } 
    }
    
    Button {
        text: i18n.tr("Add")
        onClicked:{
            NotesTable.saveNote(note)
            PopupUtils.close(add_note_dialog)
        } 
    }

    Button {
        text: i18n.tr("Back")
        onClicked:{
            PopupUtils.close(add_note_dialog)
        } 
    }
}