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
import Ubuntu.Components.Pickers 1.3
import "../../js/Regex.js" as Regex
import "../../js/ControlFoodsSearchTimer.js" as ControlFoodsSearchTimer

Popover{
    id: operation_result_popover
    width: units.gu(56)
    height: units.gu(12)
    y:15
    
    ColumnLayout{
        id: main_column_pop
        width: parent.width
        ListItem{
            color: UbuntuColors.porcelain
            ListItemLayout{
                TextField{
                    id: search_text
                    height: units.gu(4.5)
                    width: parent.width - units.gu(15.5)
                    placeholderText: i18n.tr("Search...")
                    validator: RegExpValidator { regExp: Regex.regex_char}
                    onTextChanged:{
                        ControlFoodsSearchTimer.searchTimer(1000, function () {
                            sorted_model.filter.pattern = new RegExp(search_text.text)
                            PopupUtils.close(operation_result_popover)
                            })
                    }
                }

                Button{
                    text: i18n.tr("Close")
                    onClicked: PopupUtils.close(operation_result_popover)
                }
            }
        }
        Timer{id: timer;repeat: false}
    }
}