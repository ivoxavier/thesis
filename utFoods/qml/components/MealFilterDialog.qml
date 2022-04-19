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

Dialog {
    id: meal_filter_dialog
    title: i18n.tr("Show Ingestions From")

    OptionSelector{
        expanded : true
        model : [i18n.tr("Breakfast"), i18n.tr("Lunch"), i18n.tr("Dinner"), i18n.tr("Snacks")]
        selectedIndex: -1
        onSelectedIndexChanged :  bottom_edge.meal_filter = selectedIndex
    }

    Button {
        text: i18n.tr("Back")
        onClicked:{
            PopupUtils.close(meal_filter_dialog)
        } 
    }
}